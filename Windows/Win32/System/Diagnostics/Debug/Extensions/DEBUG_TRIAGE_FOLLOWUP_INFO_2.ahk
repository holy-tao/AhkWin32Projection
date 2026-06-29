#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DEBUG_TRIAGE_FOLLOWUP_INFO_2 {
    #StructPack 8

    SizeOfStruct : UInt32

    OwnerNameSize : UInt32

    OwnerName : PSTR

    FeaturePathSize : UInt32

    FeaturePath : PSTR

}
