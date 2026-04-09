#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\SYM_TYPE.ahk

/**
 * Contains module information. (IMAGEHLP_MODULE64)
 * @remarks
 * This structure supersedes the <b>IMAGEHLP_MODULE</b> structure. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>IMAGEHLP_MODULE</b> is defined as follows in DbgHelp.h. 
 * 
 * 
 * ```cpp
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-imagehlp_module64
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class IMAGEHLP_MODULE64 extends Win32Struct {
    static sizeof => 1672

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
     * @type {SYM_TYPE}
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
        get => StrGet(this.ptr + 36, 31, "UTF-8")
        set => StrPut(value, this.ptr + 36, 31, "UTF-8")
    }

    /**
     * The image name. The name may or may not contain a full path.
     * @type {String}
     */
    ImageName {
        get => StrGet(this.ptr + 68, 255, "UTF-8")
        set => StrPut(value, this.ptr + 68, 255, "UTF-8")
    }

    /**
     * The full path and file name of the file from which symbols were loaded.
     * @type {String}
     */
    LoadedImageName {
        get => StrGet(this.ptr + 324, 255, "UTF-8")
        set => StrPut(value, this.ptr + 324, 255, "UTF-8")
    }

    /**
     * The full path and file name of the .pdb file.
     * @type {String}
     */
    LoadedPdbName {
        get => StrGet(this.ptr + 580, 255, "UTF-8")
        set => StrPut(value, this.ptr + 580, 255, "UTF-8")
    }

    /**
     * The signature of the CV record in the debug directories.
     * @type {Integer}
     */
    CVSig {
        get => NumGet(this, 836, "uint")
        set => NumPut("uint", value, this, 836)
    }

    /**
     * The contents of the CV record.
     * @type {String}
     */
    CVData {
        get => StrGet(this.ptr + 840, 779, "UTF-8")
        set => StrPut(value, this.ptr + 840, 779, "UTF-8")
    }

    /**
     * The PDB signature.
     * @type {Integer}
     */
    PdbSig {
        get => NumGet(this, 1620, "uint")
        set => NumPut("uint", value, this, 1620)
    }

    /**
     * The PDB signature (Visual C/C++ 7.0 and later)
     * @type {Pointer}
     */
    PdbSig70 {
        get => NumGet(this, 1624, "ptr")
        set => NumPut("ptr", value, this, 1624)
    }

    /**
     * The DBI age of PDB.
     * @type {Integer}
     */
    PdbAge {
        get => NumGet(this, 1632, "uint")
        set => NumPut("uint", value, this, 1632)
    }

    /**
     * A value that indicates whether the loaded PDB is unmatched.
     * @type {BOOL}
     */
    PdbUnmatched {
        get => NumGet(this, 1636, "int")
        set => NumPut("int", value, this, 1636)
    }

    /**
     * A value that indicates whether the loaded DBG is unmatched.
     * @type {BOOL}
     */
    DbgUnmatched {
        get => NumGet(this, 1640, "int")
        set => NumPut("int", value, this, 1640)
    }

    /**
     * A value that indicates whether line number information is available.
     * @type {BOOL}
     */
    LineNumbers {
        get => NumGet(this, 1644, "int")
        set => NumPut("int", value, this, 1644)
    }

    /**
     * A value that indicates whether symbol information is available.
     * @type {BOOL}
     */
    GlobalSymbols {
        get => NumGet(this, 1648, "int")
        set => NumPut("int", value, this, 1648)
    }

    /**
     * A value that indicates whether type information is available.
     * @type {BOOL}
     */
    TypeInfo {
        get => NumGet(this, 1652, "int")
        set => NumPut("int", value, this, 1652)
    }

    /**
     * A value that indicates whether the .pdb supports the source server.
     * 
     * <b>DbgHelp 6.1 and earlier:  </b>This member is not supported.
     * @type {BOOL}
     */
    SourceIndexed {
        get => NumGet(this, 1656, "int")
        set => NumPut("int", value, this, 1656)
    }

    /**
     * A value that indicates whether the module contains public symbols.
     * 
     * <b>DbgHelp 6.1 and earlier:  </b>This member is not supported.
     * @type {BOOL}
     */
    Publics {
        get => NumGet(this, 1660, "int")
        set => NumPut("int", value, this, 1660)
    }

    /**
     * TBD
     * @type {Integer}
     */
    MachineType {
        get => NumGet(this, 1664, "uint")
        set => NumPut("uint", value, this, 1664)
    }

    /**
     * TBD
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 1668, "uint")
        set => NumPut("uint", value, this, 1668)
    }
}
