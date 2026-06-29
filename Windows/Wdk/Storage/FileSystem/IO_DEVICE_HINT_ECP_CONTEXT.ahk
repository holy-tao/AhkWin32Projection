#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct IO_DEVICE_HINT_ECP_CONTEXT {
    #StructPack 8

    TargetDevice : DEVICE_OBJECT.Ptr

    RemainingName : IntPtr

}
