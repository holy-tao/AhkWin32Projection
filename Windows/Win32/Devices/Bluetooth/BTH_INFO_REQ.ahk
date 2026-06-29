#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct BTH_INFO_REQ {
    #StructPack 8

    btAddr : Int64

    infoType : UInt16

}
