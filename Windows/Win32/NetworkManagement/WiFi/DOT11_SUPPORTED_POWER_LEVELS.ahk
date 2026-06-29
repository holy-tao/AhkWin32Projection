#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_SUPPORTED_POWER_LEVELS {
    #StructPack 4

    uNumOfSupportedPowerLevels : UInt32

    uTxPowerLevelValues : UInt32[8]

}
