#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct CHANNEL_INFO {
    #StructPack 4

    EventChannelSize : UInt32

    uReadDataAlignment : UInt32

    uWriteDataAlignment : UInt32

}
