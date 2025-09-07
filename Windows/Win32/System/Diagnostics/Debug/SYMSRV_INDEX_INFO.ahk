#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The SYMSRV_INDEX_INFO structure (dbghelp.h) contains symbol server index information.
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-symsrv_index_info
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 * @charset ANSI
 */
class SYMSRV_INDEX_INFO extends Win32Struct
{
    static sizeof => 824

    static packingSize => 8

    /**
     * The size of the structure, in bytes. This member must be set to <c>sizeof(SYMSRV_INDEX_INFO)</code> or <code>sizeof(SYMSRV_INDEX_INFOW)</c>.
     * @type {Integer}
     */
    sizeofstruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The name of the .pdb, .dbg, or image file.
     * @type {String}
     */
    file {
        get => StrGet(this.ptr + 4, 260, "UTF-8")
        set => StrPut(value, this.ptr + 4, 260, "UTF-8")
    }

    /**
     * A value that indicates whether the image file is stripped.
     * @type {Integer}
     */
    stripped {
        get => NumGet(this, 268, "int")
        set => NumPut("int", value, this, 268)
    }

    /**
     * The timestamp from the PE header. This member is used only for image files.
     * @type {Integer}
     */
    timestamp {
        get => NumGet(this, 272, "uint")
        set => NumPut("uint", value, this, 272)
    }

    /**
     * The file size from the PE header. This member is used only for image files.
     * @type {Integer}
     */
    size {
        get => NumGet(this, 276, "uint")
        set => NumPut("uint", value, this, 276)
    }

    /**
     * If the image file is stripped and there is a .dbg file, this member is the path to the .dbg file from the CV record.
     * @type {String}
     */
    dbgfile {
        get => StrGet(this.ptr + 280, 260, "UTF-8")
        set => StrPut(value, this.ptr + 280, 260, "UTF-8")
    }

    /**
     * The .pdb file from the CV record. This member is used only for image and .dbg files.
     * @type {String}
     */
    pdbfile {
        get => StrGet(this.ptr + 541, 260, "UTF-8")
        set => StrPut(value, this.ptr + 541, 260, "UTF-8")
    }

    /**
     * The GUID of the .pdb file. If there is no GUID available, the signature of the .pdb file is copied into first <b>DWORD</b> of the GUID.
     * @type {Pointer<Guid>}
     */
    guid {
        get => NumGet(this, 808, "ptr")
        set => NumPut("ptr", value, this, 808)
    }

    /**
     * The signature of the .pdb file (for use with old-style .pdb files). This value can be 0 if it is a new-style .pdb file that uses a GUID-length signature.
     * @type {Integer}
     */
    sig {
        get => NumGet(this, 816, "uint")
        set => NumPut("uint", value, this, 816)
    }

    /**
     * The age of the .pdb file.
     * @type {Integer}
     */
    age {
        get => NumGet(this, 820, "uint")
        set => NumPut("uint", value, this, 820)
    }
}
