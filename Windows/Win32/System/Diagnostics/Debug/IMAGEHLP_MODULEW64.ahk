#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\BOOL.ahk

/**
 * Contains module information.
 * @remarks
 * 
  * This structure supersedes the <b>IMAGEHLP_MODULE</b> structure. For more information, see 
  * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>IMAGEHLP_MODULE</b> is defined as follows in DbgHelp.h. 
  * 
  * 
  * ```cpp
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dbghelp/ns-dbghelp-imagehlp_modulew64
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IMAGEHLP_MODULEW64 extends Win32Struct
{
    static sizeof => 3256

    static packingSize => 8

    /**
     * The size of the structure, in bytes. The caller must set this member to <c>sizeof(IMAGEHLP_MODULE64)</c>.
     * @type {Integer}
     */
    SizeOfStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The base virtual address where the image is loaded.
     * @type {Integer}
     */
    BaseOfImage {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The size of the image, in bytes.
     * @type {Integer}
     */
    ImageSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The date and timestamp value. The value is represented in the number of seconds elapsed since midnight (00:00:00), January 1, 1970, Universal Coordinated Time, according to the system clock. The timestamp can be printed using the C run-time (CRT) function <b>ctime</b>.
     * @type {Integer}
     */
    TimeDateStamp {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The checksum of the image. This value can be zero.
     * @type {Integer}
     */
    CheckSum {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The number of symbols in the symbol table.  The value of this parameter is not meaningful when <b>SymPdb</b> is specified as  the value of the <i>SymType</i> parameter.
     * @type {Integer}
     */
    NumSyms {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * 
     * @type {Integer}
     */
    SymType {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * The module name.
     * @type {String}
     */
    ModuleName {
        get => StrGet(this.ptr + 36, 31, "UTF-16")
        set => StrPut(value, this.ptr + 36, 31, "UTF-16")
    }

    /**
     * The image name. The name may or may not contain a full path.
     * @type {String}
     */
    ImageName {
        get => StrGet(this.ptr + 100, 255, "UTF-16")
        set => StrPut(value, this.ptr + 100, 255, "UTF-16")
    }

    /**
     * The full path and file name of the file from which symbols were loaded.
     * @type {String}
     */
    LoadedImageName {
        get => StrGet(this.ptr + 612, 255, "UTF-16")
        set => StrPut(value, this.ptr + 612, 255, "UTF-16")
    }

    /**
     * The full path and file name of the .pdb file.
     * @type {String}
     */
    LoadedPdbName {
        get => StrGet(this.ptr + 1124, 255, "UTF-16")
        set => StrPut(value, this.ptr + 1124, 255, "UTF-16")
    }

    /**
     * The signature of the CV record in the debug directories.
     * @type {Integer}
     */
    CVSig {
        get => NumGet(this, 1636, "uint")
        set => NumPut("uint", value, this, 1636)
    }

    /**
     * The contents of the CV record.
     * @type {String}
     */
    CVData {
        get => StrGet(this.ptr + 1640, 779, "UTF-16")
        set => StrPut(value, this.ptr + 1640, 779, "UTF-16")
    }

    /**
     * The PDB signature.
     * @type {Integer}
     */
    PdbSig {
        get => NumGet(this, 3200, "uint")
        set => NumPut("uint", value, this, 3200)
    }

    /**
     * The PDB signature (Visual C/C++ 7.0 and later)
     * @type {Pointer<Guid>}
     */
    PdbSig70 {
        get => NumGet(this, 3208, "ptr")
        set => NumPut("ptr", value, this, 3208)
    }

    /**
     * The DBI age of PDB.
     * @type {Integer}
     */
    PdbAge {
        get => NumGet(this, 3216, "uint")
        set => NumPut("uint", value, this, 3216)
    }

    /**
     * A value that indicates whether the loaded PDB is unmatched.
     * @type {BOOL}
     */
    PdbUnmatched{
        get {
            if(!this.HasProp("__PdbUnmatched"))
                this.__PdbUnmatched := BOOL(this.ptr + 3220)
            return this.__PdbUnmatched
        }
    }

    /**
     * A value that indicates whether the loaded DBG is unmatched.
     * @type {BOOL}
     */
    DbgUnmatched{
        get {
            if(!this.HasProp("__DbgUnmatched"))
                this.__DbgUnmatched := BOOL(this.ptr + 3224)
            return this.__DbgUnmatched
        }
    }

    /**
     * A value that indicates whether line number information is available.
     * @type {BOOL}
     */
    LineNumbers{
        get {
            if(!this.HasProp("__LineNumbers"))
                this.__LineNumbers := BOOL(this.ptr + 3228)
            return this.__LineNumbers
        }
    }

    /**
     * A value that indicates whether symbol information is available.
     * @type {BOOL}
     */
    GlobalSymbols{
        get {
            if(!this.HasProp("__GlobalSymbols"))
                this.__GlobalSymbols := BOOL(this.ptr + 3232)
            return this.__GlobalSymbols
        }
    }

    /**
     * A value that indicates whether type information is available.
     * @type {BOOL}
     */
    TypeInfo{
        get {
            if(!this.HasProp("__TypeInfo"))
                this.__TypeInfo := BOOL(this.ptr + 3236)
            return this.__TypeInfo
        }
    }

    /**
     * A value that indicates whether the .pdb supports the source server.
     * 
     * <b>DbgHelp 6.1 and earlier:  </b>This member is not supported.
     * @type {BOOL}
     */
    SourceIndexed{
        get {
            if(!this.HasProp("__SourceIndexed"))
                this.__SourceIndexed := BOOL(this.ptr + 3240)
            return this.__SourceIndexed
        }
    }

    /**
     * A value that indicates whether the module contains public symbols.
     * 
     * <b>DbgHelp 6.1 and earlier:  </b>This member is not supported.
     * @type {BOOL}
     */
    Publics{
        get {
            if(!this.HasProp("__Publics"))
                this.__Publics := BOOL(this.ptr + 3244)
            return this.__Publics
        }
    }

    /**
     * TBD
     * @type {Integer}
     */
    MachineType {
        get => NumGet(this, 3248, "uint")
        set => NumPut("uint", value, this, 3248)
    }

    /**
     * TBD
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 3252, "uint")
        set => NumPut("uint", value, this, 3252)
    }
}
