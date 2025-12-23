#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.LegacyWindowsEnvironmentFeatures
 * @version v4.0.30319
 */
class EMPTY_VOLUME_CACHE_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static EVCF_HASSETTINGS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EVCF_ENABLEBYDEFAULT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EVCF_REMOVEFROMLIST => 4

    /**
     * @type {Integer (UInt32)}
     */
    static EVCF_ENABLEBYDEFAULT_AUTO => 8

    /**
     * @type {Integer (UInt32)}
     */
    static EVCF_DONTSHOWIFZERO => 16

    /**
     * @type {Integer (UInt32)}
     */
    static EVCF_SETTINGSMODE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static EVCF_OUTOFDISKSPACE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static EVCF_USERCONSENTOBTAINED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static EVCF_SYSTEMAUTORUN => 256
}
