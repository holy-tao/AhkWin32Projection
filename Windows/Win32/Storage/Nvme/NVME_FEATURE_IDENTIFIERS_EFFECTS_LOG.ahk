#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVME_FID_SUPPORTED_AND_EFFECTS.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_FEATURE_IDENTIFIERS_EFFECTS_LOG extends Win32Struct
{
    static sizeof => 2048

    static packingSize => 8

    /**
     * @type {Array<NVME_FID_SUPPORTED_AND_EFFECTS>}
     */
    FeatureIdentifierSupported{
        get {
            if(!this.HasProp("__FeatureIdentifierSupportedProxyArray"))
                this.__FeatureIdentifierSupportedProxyArray := Win32FixedArray(this.ptr + 0, 256, NVME_FID_SUPPORTED_AND_EFFECTS, "")
            return this.__FeatureIdentifierSupportedProxyArray
        }
    }
}
