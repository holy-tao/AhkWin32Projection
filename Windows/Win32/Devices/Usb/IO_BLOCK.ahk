#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct IO_BLOCK {
    #StructPack 8

    uOffset : UInt32

    uLength : UInt32

    pbyData : IntPtr

    uIndex : UInt32

}
