#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVME_COMMAND_EFFECTS_DATA.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_command_effects_log
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_COMMAND_EFFECTS_LOG extends Win32Struct
{
    static sizeof => 6144

    static packingSize => 8

    /**
     * @type {Array<NVME_COMMAND_EFFECTS_DATA>}
     */
    ACS{
        get {
            if(!this.HasProp("__ACSProxyArray"))
                this.__ACSProxyArray := Win32FixedArray(this.ptr + 0, 256, NVME_COMMAND_EFFECTS_DATA, "")
            return this.__ACSProxyArray
        }
    }

    /**
     * @type {Array<NVME_COMMAND_EFFECTS_DATA>}
     */
    IOCS{
        get {
            if(!this.HasProp("__IOCSProxyArray"))
                this.__IOCSProxyArray := Win32FixedArray(this.ptr + 2048, 256, NVME_COMMAND_EFFECTS_DATA, "")
            return this.__IOCSProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 4096, 2048, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }
}
