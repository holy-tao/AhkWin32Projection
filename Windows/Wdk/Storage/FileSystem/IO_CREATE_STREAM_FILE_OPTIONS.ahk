#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct IO_CREATE_STREAM_FILE_OPTIONS {
    #StructPack 8

    Size : UInt16

    Flags : UInt16

    TargetDeviceObject : DEVICE_OBJECT.Ptr

}
