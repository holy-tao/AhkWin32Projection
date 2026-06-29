#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct HID_XFER_PACKET {
    #StructPack 8

    reportBuffer : IntPtr

    reportBufferLen : UInt32

    reportId : Int8

}
