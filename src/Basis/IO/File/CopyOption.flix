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


mod Basis.IO.File {

    ///
    /// Represents an CopyOption.
    ///
    pub enum CopyOption(##java.nio.file.CopyOption)

}

mod Basis.IO.File.CopyOption {

    pub def nofollowLinks(): CopyOption = 
        Basis.IO.File.LinkOption.asCopyOption(Basis.IO.File.LinkOption.NofollowLinks)
        
    pub def atomicMove(): CopyOption = 
        Basis.IO.File.StandardCopyOption.asCopyOption(Basis.IO.File.StandardCopyOption.AtomicMove)

    pub def copyAttributes(): CopyOption =
        Basis.IO.File.StandardCopyOption.asCopyOption(Basis.IO.File.StandardCopyOption.CopyAttributes)

    pub def replaceExisting(): CopyOption = 
        Basis.IO.File.StandardCopyOption.asCopyOption(Basis.IO.File.StandardCopyOption.ReplaceExisting)

}
