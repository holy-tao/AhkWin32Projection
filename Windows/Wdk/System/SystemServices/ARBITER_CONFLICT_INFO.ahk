#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct ARBITER_CONFLICT_INFO {
    #StructPack 8

    OwningObject : DEVICE_OBJECT.Ptr

    Start : Int64

    End : Int64

}
