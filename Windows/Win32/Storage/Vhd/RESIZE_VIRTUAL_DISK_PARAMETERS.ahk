#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the parameters for a ResizeVirtualDisk function.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-resize_virtual_disk_parameters
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class RESIZE_VIRTUAL_DISK_PARAMETERS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Discriminant for the union containing a value enumerated from the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/virtdisk/ne-virtdisk-resize_virtual_disk_version">RESIZE_VIRTUAL_DISK_VERSION</a> 
     *       enumeration.
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
