#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class SOC_SUBSYSTEM_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SOC_SUBSYS_WIRELESS_MODEM => 0

    /**
     * @type {Integer (Int32)}
     */
    static SOC_SUBSYS_AUDIO_DSP => 1

    /**
     * @type {Integer (Int32)}
     */
    static SOC_SUBSYS_WIRELSS_CONNECTIVITY => 2

    /**
     * @type {Integer (Int32)}
     */
    static SOC_SUBSYS_SENSORS => 3

    /**
     * @type {Integer (Int32)}
     */
    static SOC_SUBSYS_COMPUTE_DSP => 4

    /**
     * @type {Integer (Int32)}
     */
    static SOC_SUBSYS_SECURE_PROC => 5

    /**
     * @type {Integer (Int32)}
     */
    static SOC_SUBSYS_VENDOR_DEFINED => 65536
}
