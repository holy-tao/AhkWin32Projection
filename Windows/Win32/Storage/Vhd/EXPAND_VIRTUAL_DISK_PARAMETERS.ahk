#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains virtual disk expansion request parameters.
 * @see https://docs.microsoft.com/windows/win32/api//virtdisk/ns-virtdisk-expand_virtual_disk_parameters
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class EXPAND_VIRTUAL_DISK_PARAMETERS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * An <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-expand_virtual_disk_version">EXPAND_VIRTUAL_DISK_VERSION</a> 
     *       enumeration value that specifies the version of the 
     *       <b>EXPAND_VIRTUAL_DISK_PARAMETERS</b> structure 
     *       being passed to or from the virtual disk functions.
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
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
