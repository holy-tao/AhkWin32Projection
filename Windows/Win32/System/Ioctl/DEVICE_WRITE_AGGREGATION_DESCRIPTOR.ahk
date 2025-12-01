#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Reserved for system use. (DEVICE_WRITE_AGGREGATION_DESCRIPTOR)
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-device_write_aggregation_descriptor
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DEVICE_WRITE_AGGREGATION_DESCRIPTOR extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Contains the size, in bytes, of this structure. The value of this member will change as members are added 
     *       to the structure.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the total size of the descriptor, in bytes.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * <b>TRUE</b> if the device benefits from write aggregation.
     * @type {BOOLEAN}
     */
    BenefitsFromWriteAggregation {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }
}
