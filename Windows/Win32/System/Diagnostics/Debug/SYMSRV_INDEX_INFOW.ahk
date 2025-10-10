#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains symbol server index information.
 * @remarks
 * 
  * > [!NOTE]
  * > The dbghelp.h header defines SYMSRV_INDEX_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dbghelp/ns-dbghelp-symsrv_index_infow
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 * @charset Unicode
 */
class SYMSRV_INDEX_INFOW extends Win32Struct
{
    static sizeof => 1600

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
        get => StrGet(this.ptr + 4, 260, "UTF-16")
        set => StrPut(value, this.ptr + 4, 260, "UTF-16")
    }

    /**
     * A value that indicates whether the image file is stripped.
     * @type {Integer}
     */
    stripped {
        get => NumGet(this, 528, "int")
        set => NumPut("int", value, this, 528)
    }

    /**
     * The timestamp from the PE header. This member is used only for image files.
     * @type {Integer}
     */
    timestamp {
        get => NumGet(this, 532, "uint")
        set => NumPut("uint", value, this, 532)
    }

    /**
     * The file size from the PE header. This member is used only for image files.
     * @type {Integer}
     */
    size {
        get => NumGet(this, 536, "uint")
        set => NumPut("uint", value, this, 536)
    }

    /**
     * If the image file is stripped and there is a .dbg file, this member is the path to the .dbg file from the CV record.
     * @type {String}
     */
    dbgfile {
        get => StrGet(this.ptr + 540, 260, "UTF-16")
        set => StrPut(value, this.ptr + 540, 260, "UTF-16")
    }

    /**
     * The .pdb file from the CV record. This member is used only for image and .dbg files.
     * @type {String}
     */
    pdbfile {
        get => StrGet(this.ptr + 1062, 260, "UTF-16")
        set => StrPut(value, this.ptr + 1062, 260, "UTF-16")
    }

    /**
     * The GUID of the .pdb file. If there is no GUID available, the signature of the .pdb file is copied into first <b>DWORD</b> of the GUID.
     * @type {Pointer<Guid>}
     */
    guid {
        get => NumGet(this, 1584, "ptr")
        set => NumPut("ptr", value, this, 1584)
    }

    /**
     * The signature of the .pdb file (for use with old-style .pdb files). This value can be 0 if it is a new-style .pdb file that uses a GUID-length signature.
     * @type {Integer}
     */
    sig {
        get => NumGet(this, 1592, "uint")
        set => NumPut("uint", value, this, 1592)
    }

    /**
     * The age of the .pdb file.
     * @type {Integer}
     */
    age {
        get => NumGet(this, 1596, "uint")
        set => NumPut("uint", value, this, 1596)
    }
}
