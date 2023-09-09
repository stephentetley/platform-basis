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
    /// Represents a RuleBasedCollator.
    /// Subclass of Collator
    /// "Immutable after init"
    ///
    pub enum RuleBasedCollator(##java.text.RuleBasedCollator)
    

}

mod Basis.Text.RuleBasedCollator {

    use Basis.Text.RuleBasedCollator.{RuleBasedCollator}
    use Basis.Text.Collator
    use Basis.Text.Collator.{Collator}
    use Basis.Text.Collator.CollatorBuilder

    ///
    /// Get a Collator from the rules.
    /// Apply the setters in `props` to further configure the Collator.
    ///
    pub def new(rules: String): Result[String, RuleBasedCollator] =
        Result.tryCatch(_ -> {
            import new java.text.RuleBasedCollator(String): ##java.text.RuleBasedCollator \ {} as newRuleBasedCollator;
            RuleBasedCollator(newRuleBasedCollator(rules))
        })
    
    pub def newWith(rules: String, build: CollatorBuilder): Result[String, RuleBasedCollator] \ IO = 
        Result.tryCatch(_ -> {
            import new java.text.RuleBasedCollator(String): ##java.text.RuleBasedCollator \ {} as newRuleBasedCollator;
            let rbc1 = newRuleBasedCollator(rules);
            let c1   = unchecked_cast(rbc1 as ##java.text.Collator); 
            build(c1);
            RuleBasedCollator(rbc1)
        })

    pub def asCollator(rbc: RuleBasedCollator): Collator = 
        let RuleBasedCollator(rbc1) = rbc;
        let c1 = unchecked_cast(rbc1 as ##java.text.Collator); 
        Collator(c1)

    ///
    /// Test equality of strings `s1` and `s2` with the collator `x``.
    ///
    pub def equals(rbc: RuleBasedCollator, s1: String, s2: String): Bool = 
        Basis.Text.Collator.equals(asCollator(rbc), s1, s2)


    ///
    /// Compare strings `s1` and `s2` with the collator `x``.
    ///
    pub def compare(rbc: RuleBasedCollator, s1: String, s2: String): Comparison = 
        Basis.Text.Collator.compare(asCollator(rbc), s1, s2)


    // pub def getDecomposition(c: RuleBasedCollator): DecompositionMode =
    //     Interop.Text.SubCollator.toCollator(c) |> Basis.Text.Collator.getDecomposition
            
    // pub def getStrength(c: RuleBasedCollator): CollatorStrength =
    //     Interop.Text.SubCollator.toCollator(c) |> Basis.Text.Collator.getStrength
            


}