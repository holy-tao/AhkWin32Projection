#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHV_X64_UNSUPPORTED_FEATURE_CODE.ahk" { WHV_X64_UNSUPPORTED_FEATURE_CODE }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_X64_UNSUPPORTED_FEATURE_CONTEXT {
    #StructPack 8

    FeatureCode : WHV_X64_UNSUPPORTED_FEATURE_CODE

    Reserved : UInt32

    FeatureParameter : Int64

}
