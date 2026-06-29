#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct DIPROPHEADER {
    #StructPack 4

    dwSize : UInt32

    dwHeaderSize : UInt32

    dwObj : UInt32

    dwHow : UInt32

}
