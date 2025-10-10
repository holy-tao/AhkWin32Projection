#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains parameters for the DeviceDsmAction_OffloadRead action for the IOCTL_STORAGE_MANAGE_DATA_SET_ATTRIBUTES control code.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-device_dsm_offload_read_parameters
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DEVICE_DSM_OFFLOAD_READ_PARAMETERS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Set to 0.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The time to live (TTL) for the token, in milliseconds.
     * @type {Integer}
     */
    TimeToLive {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Set to 0.
     * @type {Array<UInt32>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 8, 2, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }
}
