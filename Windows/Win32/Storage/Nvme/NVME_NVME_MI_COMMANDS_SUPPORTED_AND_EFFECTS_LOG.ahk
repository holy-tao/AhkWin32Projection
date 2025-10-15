#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVME_NVME_MI_COMMANDS_SUPPORTED_AND_EFFECTS.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_NVME_MI_COMMANDS_SUPPORTED_AND_EFFECTS_LOG extends Win32Struct
{
    static sizeof => 5120

    static packingSize => 8

    /**
     * @type {Array<NVME_NVME_MI_COMMANDS_SUPPORTED_AND_EFFECTS>}
     */
    ManagementInterfaceCommandSupported{
        get {
            if(!this.HasProp("__ManagementInterfaceCommandSupportedProxyArray"))
                this.__ManagementInterfaceCommandSupportedProxyArray := Win32FixedArray(this.ptr + 0, 256, NVME_NVME_MI_COMMANDS_SUPPORTED_AND_EFFECTS, "")
            return this.__ManagementInterfaceCommandSupportedProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 2048, 3072, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }
}
