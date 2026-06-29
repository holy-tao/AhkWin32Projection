#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The SYMSRV_INDEX_INFO structure (dbghelp.h) contains symbol server index information.
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-symsrv_index_info
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @charset ANSI
 */
export default struct SYMSRV_INDEX_INFO {
    #StructPack 4

    /**
     * The size of the structure, in bytes. This member must be set to <c>sizeof(SYMSRV_INDEX_INFO)</code> or <code>sizeof(SYMSRV_INDEX_INFOW)</c>.
     */
    sizeofstruct : UInt32

    /**
     * The name of the .pdb, .dbg, or image file.
     */
    file : CHAR[261]

    /**
     * A value that indicates whether the image file is stripped.
     */
    stripped : BOOL

    /**
     * The timestamp from the PE header. This member is used only for image files.
     */
    timestamp : UInt32

    /**
     * The file size from the PE header. This member is used only for image files.
     */
    size : UInt32

    /**
     * If the image file is stripped and there is a .dbg file, this member is the path to the .dbg file from the CV record.
     */
    dbgfile : CHAR[261]

    /**
     * The .pdb file from the CV record. This member is used only for image and .dbg files.
     */
    pdbfile : CHAR[261]

    /**
     * The GUID of the .pdb file. If there is no GUID available, the signature of the .pdb file is copied into first <b>DWORD</b> of the GUID.
     */
    guid : Guid

    /**
     * The signature of the .pdb file (for use with old-style .pdb files). This value can be 0 if it is a new-style .pdb file that uses a GUID-length signature.
     */
    sig : UInt32

    /**
     * The age of the .pdb file.
     */
    age : UInt32

}
