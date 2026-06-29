#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB4_HRD_DEBUG_ROUTE_STRING {
    #StructPack 1

    Depth : Int8

    Route : Int8[7]

}
