#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\XSTATE_FEATURE.ahk" { XSTATE_FEATURE }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct XSTATE_CONFIG_FEATURE_MSC_INFO {
    #StructPack 8

    SizeOfInfo : UInt32

    ContextSize : UInt32

    EnabledFeatures : Int64

    Features : XSTATE_FEATURE[64]

}
