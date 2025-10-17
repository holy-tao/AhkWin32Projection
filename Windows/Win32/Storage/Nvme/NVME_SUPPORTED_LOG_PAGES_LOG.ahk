#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVME_LID_SUPPORTED_AND_EFFECTS.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_SUPPORTED_LOG_PAGES_LOG extends Win32Struct
{
    static sizeof => 2048

    static packingSize => 8

    /**
     * @type {Array<NVME_LID_SUPPORTED_AND_EFFECTS>}
     */
    LogPageIdentifierSupported{
        get {
            if(!this.HasProp("__LogPageIdentifierSupportedProxyArray"))
                this.__LogPageIdentifierSupportedProxyArray := Win32FixedArray(this.ptr + 0, 256, NVME_LID_SUPPORTED_AND_EFFECTS, "")
            return this.__LogPageIdentifierSupportedProxyArray
        }
    }
}
