#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains virtual hard disk (VHD) mirror request parameters.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-mirror_virtual_disk_parameters
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class MIRROR_VIRTUAL_DISK_PARAMETERS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Indicates the version of this structure to use. Set this to 
     *       <b>MIRROR_VIRTUAL_DISK_VERSION_1</b> (1).
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    Anonymous {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
