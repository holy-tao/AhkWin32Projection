#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies optional extended information for directory enumeration and placeholder information.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/ns-projectedfslib-prj_extended_info
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 * @version v4.0.30319
 */
class PRJ_EXTENDED_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/ne-projectedfslib-prj_ext_info_type">PRJ_EXT_INFO</a> value describing what kind of extended information this structure contains.
     * @type {Integer}
     */
    InfoType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Offset in bytes from the beginning of this structure to the next PRJ_EXTENDED_INFO structure.  If this is the last structure in the buffer this value must be 0.
     * @type {Integer}
     */
    NextInfoOffset {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    Anonymous {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
