#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct RFCOMM_MSC_DATA {
    #StructPack 1

    Signals : Int8

    Break : Int8

}
