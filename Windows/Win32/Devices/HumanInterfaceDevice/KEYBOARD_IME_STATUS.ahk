#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct KEYBOARD_IME_STATUS {
    #StructPack 4

    UnitId : UInt16

    ImeOpen : UInt32

    ImeConvMode : UInt32

}
