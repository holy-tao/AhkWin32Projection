#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NVME_FID_SUPPORTED_AND_EFFECTS.ahk" { NVME_FID_SUPPORTED_AND_EFFECTS }

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_FEATURE_IDENTIFIERS_EFFECTS_LOG {
    #StructPack 4

    FeatureIdentifierSupported : NVME_FID_SUPPORTED_AND_EFFECTS[256]

}
