#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVME_FID_SUPPORTED_AND_EFFECTS.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_FEATURE_IDENTIFIERS_EFFECTS_LOG extends Win32Struct {
    static sizeof => 1024

    static packingSize => 4

    /**
     * @type {NVME_FID_SUPPORTED_AND_EFFECTS}
     */
    FeatureIdentifierSupported {
        get {
            if(!this.HasProp("__FeatureIdentifierSupportedProxyArray"))
                this.__FeatureIdentifierSupportedProxyArray := Win32FixedArray(this.ptr + 0, 256, NVME_FID_SUPPORTED_AND_EFFECTS, "")
            return this.__FeatureIdentifierSupportedProxyArray
        }
    }
}
