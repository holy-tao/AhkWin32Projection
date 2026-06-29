#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct ARBITER_ADD_RESERVED_PARAMETERS {
    #StructPack 8

    ReserveDevice : DEVICE_OBJECT.Ptr

}
