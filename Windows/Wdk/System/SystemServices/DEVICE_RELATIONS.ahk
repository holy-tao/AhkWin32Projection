#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DEVICE_RELATIONS {
    #StructPack 8

    Count : UInt32

    Objects : DEVICE_OBJECT.Ptr[1]

}
