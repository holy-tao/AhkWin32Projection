#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct BTH_PING_RSP {
    #StructPack 1

    dataLen : Int8

    data : Int8[44]

}
