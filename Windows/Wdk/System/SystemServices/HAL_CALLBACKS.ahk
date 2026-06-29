#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PCALLBACK_OBJECT.ahk" { PCALLBACK_OBJECT }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct HAL_CALLBACKS {
    #StructPack 8

    SetSystemInformation : PCALLBACK_OBJECT

    BusCheck : PCALLBACK_OBJECT

}
