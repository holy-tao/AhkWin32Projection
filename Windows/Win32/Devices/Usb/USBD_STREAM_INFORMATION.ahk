#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USBD_STREAM_INFORMATION {
    #StructPack 8

    PipeHandle : IntPtr

    StreamID : UInt32

    MaximumTransferSize : UInt32

    PipeFlags : UInt32

}
