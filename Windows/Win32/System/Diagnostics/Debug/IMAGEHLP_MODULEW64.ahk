#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SYM_TYPE.ahk" { SYM_TYPE }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains module information. (IMAGEHLP_MODULEW64)
 * @remarks
 * This structure supersedes the <b>IMAGEHLP_MODULE</b> structure. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>IMAGEHLP_MODULE</b> is defined as follows in DbgHelp.h. 
 * 
 * 
 * ```cpp
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-imagehlp_modulew64
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IMAGEHLP_MODULEW64 {
    #StructPack 8

    /**
     * The size of the structure, in bytes. The caller must set this member to <c>sizeof(IMAGEHLP_MODULE64)</c>.
     */
    SizeOfStruct : UInt32

    /**
     * The base virtual address where the image is loaded.
     */
    BaseOfImage : Int64

    /**
     * The size of the image, in bytes.
     */
    ImageSize : UInt32

    /**
     * The date and timestamp value. The value is represented in the number of seconds elapsed since midnight (00:00:00), January 1, 1970, Universal Coordinated Time, according to the system clock. The timestamp can be printed using the C run-time (CRT) function <b>ctime</b>.
     */
    TimeDateStamp : UInt32

    /**
     * The checksum of the image. This value can be zero.
     */
    CheckSum : UInt32

    /**
     * The number of symbols in the symbol table.  The value of this parameter is not meaningful when <b>SymPdb</b> is specified as  the value of the <i>SymType</i> parameter.
     */
    NumSyms : UInt32

    SymType : SYM_TYPE

    /**
     * The module name.
     */
    ModuleName : WCHAR[32]

    /**
     * The image name. The name may or may not contain a full path.
     */
    ImageName : WCHAR[256]

    /**
     * The full path and file name of the file from which symbols were loaded.
     */
    LoadedImageName : WCHAR[256]

    /**
     * The full path and file name of the .pdb file.
     */
    LoadedPdbName : WCHAR[256]

    /**
     * The signature of the CV record in the debug directories.
     */
    CVSig : UInt32

    /**
     * The contents of the CV record.
     */
    CVData : WCHAR[780]

    /**
     * The PDB signature.
     */
    PdbSig : UInt32

    /**
     * The PDB signature (Visual C/C++ 7.0 and later)
     */
    PdbSig70 : Guid

    /**
     * The DBI age of PDB.
     */
    PdbAge : UInt32

    /**
     * A value that indicates whether the loaded PDB is unmatched.
     */
    PdbUnmatched : BOOL

    /**
     * A value that indicates whether the loaded DBG is unmatched.
     */
    DbgUnmatched : BOOL

    /**
     * A value that indicates whether line number information is available.
     */
    LineNumbers : BOOL

    /**
     * A value that indicates whether symbol information is available.
     */
    GlobalSymbols : BOOL

    /**
     * A value that indicates whether type information is available.
     */
    TypeInfo : BOOL

    /**
     * A value that indicates whether the .pdb supports the source server.
     * 
     * <b>DbgHelp 6.1 and earlier:  </b>This member is not supported.
     */
    SourceIndexed : BOOL

    /**
     * A value that indicates whether the module contains public symbols.
     * 
     * <b>DbgHelp 6.1 and earlier:  </b>This member is not supported.
     */
    Publics : BOOL

    /**
     * TBD
     */
    MachineType : UInt32

    /**
     * TBD
     */
    Reserved : UInt32

}
