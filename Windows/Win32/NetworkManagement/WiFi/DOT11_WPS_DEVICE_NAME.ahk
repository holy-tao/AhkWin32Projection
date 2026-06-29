#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_WPS_DEVICE_NAME {
    #StructPack 4

    uDeviceNameLength : UInt32

    ucDeviceName : Int8[32]

}
