#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct DIENVELOPE {
    #StructPack 4

    dwSize : UInt32

    dwAttackLevel : UInt32

    dwAttackTime : UInt32

    dwFadeLevel : UInt32

    dwFadeTime : UInt32

}
