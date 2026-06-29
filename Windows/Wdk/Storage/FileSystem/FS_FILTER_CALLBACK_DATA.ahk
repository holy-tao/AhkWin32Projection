#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import "..\..\Foundation\FILE_OBJECT.ahk" { FILE_OBJECT }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FS_FILTER_CALLBACK_DATA {
    #StructPack 8

    SizeOfFsFilterCallbackData : UInt32

    Operation : Int8

    Reserved : Int8

    DeviceObject : DEVICE_OBJECT.Ptr

    FileObject : FILE_OBJECT.Ptr

    Parameters : IntPtr

}
