#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct _URB_HCD_AREA {
    #StructPack 8

    Reserved8 : IntPtr[8]

}
