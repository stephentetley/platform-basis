/*
 * Copyright 2023 Stephen Tetley
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

mod Basis.Text {

    ///
    /// Represents a DecimalFormat.
    /// "Immutable after init"
    ///
    pub enum DecimalFormat(##java.text.DecimalFormat)

    instance Hash[DecimalFormat] {
        pub def hash(x: DecimalFormat): Int32 = 
            Basis.Text.DecimalFormat.hashCode(x)
    }
}


mod Basis.Text.DecimalFormat {

    use Basis.Text.DecimalFormat.{DecimalFormat}

    use Basis.Util.Currency
    use Basis.Util.Currency.{Currency}


    pub def hashCode(df: DecimalFormat): Int32 =
        import java.text.DecimalFormat.hashCode(): Int32 \ {};
        let DecimalFormat(df1) = df;
        hashCode(df1)


    pub def formatInt64(fmt: DecimalFormat, n: Int64): Result[String, String] = 
        Result.tryCatch(_ -> {
            import java.text.NumberFormat.format(Int64): String \ {};
            let DecimalFormat(fmt1) = fmt;
            format(checked_cast(fmt1), n)
        })

    pub def formatFloat64(fmt: DecimalFormat, d: Float64): Result[String, String] =  
        Result.tryCatch(_ -> {
            import java.text.NumberFormat.format(Float64): String \ {};
            let DecimalFormat(fmt1) = fmt;
            format(checked_cast(fmt1), d)
        })


    pub def parseInt64(fmt: DecimalFormat, s: String): Result[String, Int64] = 
        Result.tryCatch(_ -> {
            import java.text.NumberFormat.parse(String): ##java.lang.Number \ {};
            import java.lang.Number.longValue(): Int64 \ {};
            let DecimalFormat(fmt1) = fmt;
            parse(checked_cast(fmt1), s) |> longValue
        })


    pub def parseFloat64(fmt: DecimalFormat, s: String): Result[String, Float64] = 
        Result.tryCatch(_ -> {
            import java.text.NumberFormat.parse(String): ##java.lang.Number \ {};
            import java.lang.Number.doubleValue(): Float64 \ {};
            let DecimalFormat(fmt1) = fmt;
            parse(checked_cast(fmt1), s) |> doubleValue
        })


    ///
    pub def toPattern(df: DecimalFormat): String =
        import java.text.DecimalFormat.toPattern(): String \ {};
        let DecimalFormat(df1) = df;
        toPattern(df1)



    ///
    pub def toLocalizedPattern(df: DecimalFormat): String =
        import java.text.DecimalFormat.toLocalizedPattern(): String \ {};
        let DecimalFormat(df1) = df;
        toLocalizedPattern(df1)


    pub def getCurrency(df: DecimalFormat): Result[String, Currency] =
        Result.tryCatch(_ -> {
            import java.text.DecimalFormat.getCurrency(): ##java.util.Currency \ {};
            let DecimalFormat(df1) = df;
            getCurrency(df1) |> Currency
        })



}