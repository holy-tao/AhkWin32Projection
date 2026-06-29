#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVICE_INTERNAL_STATUS_DATA_REQUEST_TYPE.ahk" { DEVICE_INTERNAL_STATUS_DATA_REQUEST_TYPE }
#Import ".\DEVICE_INTERNAL_STATUS_DATA_SET.ahk" { DEVICE_INTERNAL_STATUS_DATA_SET }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct GET_DEVICE_INTERNAL_STATUS_DATA_REQUEST {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    RequestDataType : DEVICE_INTERNAL_STATUS_DATA_REQUEST_TYPE

    RequestDataSet : DEVICE_INTERNAL_STATUS_DATA_SET

}
