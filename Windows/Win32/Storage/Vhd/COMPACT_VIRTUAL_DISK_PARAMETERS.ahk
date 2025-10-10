#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains virtual hard disk (VHD) compacting parameters.
 * @see https://docs.microsoft.com/windows/win32/api//virtdisk/ns-virtdisk-compact_virtual_disk_parameters
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class COMPACT_VIRTUAL_DISK_PARAMETERS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-compact_virtual_disk_version">COMPACT_VIRTUAL_DISK_VERSION</a> 
     *      enumeration that specifies the version of the 
     *      <b>COMPACT_VIRTUAL_DISK_PARAMETERS</b> 
     *      structure being passed to or from the VHD functions.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Anonymous {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
