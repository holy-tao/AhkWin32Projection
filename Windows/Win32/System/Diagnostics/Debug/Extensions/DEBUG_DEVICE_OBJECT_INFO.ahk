#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DEBUG_DEVICE_OBJECT_INFO {
    #StructPack 8

    SizeOfStruct : UInt32

    DevObjAddress : Int64

    ReferenceCount : UInt32

    QBusy : BOOL

    DriverObject : Int64

    CurrentIrp : Int64

    DevExtension : Int64

    DevObjExtension : Int64

}
