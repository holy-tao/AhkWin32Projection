#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct JOYPOS {
    #StructPack 4

    dwX : UInt32

    dwY : UInt32

    dwZ : UInt32

    dwR : UInt32

    dwU : UInt32

    dwV : UInt32

}
