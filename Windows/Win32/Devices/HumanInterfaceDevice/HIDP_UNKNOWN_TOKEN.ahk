#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct HIDP_UNKNOWN_TOKEN {
    #StructPack 4

    Token : Int8

    Reserved : Int8[3]

    BitField : UInt32

}
