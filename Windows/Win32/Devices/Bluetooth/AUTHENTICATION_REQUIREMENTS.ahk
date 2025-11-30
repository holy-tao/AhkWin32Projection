#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class AUTHENTICATION_REQUIREMENTS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MITMProtectionNotRequired => 0

    /**
     * @type {Integer (Int32)}
     */
    static MITMProtectionRequired => 1

    /**
     * @type {Integer (Int32)}
     */
    static MITMProtectionNotRequiredBonding => 2

    /**
     * @type {Integer (Int32)}
     */
    static MITMProtectionRequiredBonding => 3

    /**
     * @type {Integer (Int32)}
     */
    static MITMProtectionNotRequiredGeneralBonding => 4

    /**
     * @type {Integer (Int32)}
     */
    static MITMProtectionRequiredGeneralBonding => 5

    /**
     * @type {Integer (Int32)}
     */
    static MITMProtectionNotDefined => 255
}
