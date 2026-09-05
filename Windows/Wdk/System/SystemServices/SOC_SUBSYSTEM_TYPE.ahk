#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class SOC_SUBSYSTEM_TYPE extends Win32Enum {

    /**
     * Native name: SOC_SUBSYS_WIRELESS_MODEM
     * @type {Integer (Int32)}
     */
    static SUBSYS_WIRELESS_MODEM => 0

    /**
     * Native name: SOC_SUBSYS_AUDIO_DSP
     * @type {Integer (Int32)}
     */
    static SUBSYS_AUDIO_DSP => 1

    /**
     * Native name: SOC_SUBSYS_WIRELSS_CONNECTIVITY
     * @type {Integer (Int32)}
     */
    static SUBSYS_WIRELSS_CONNECTIVITY => 2

    /**
     * Native name: SOC_SUBSYS_SENSORS
     * @type {Integer (Int32)}
     */
    static SUBSYS_SENSORS => 3

    /**
     * Native name: SOC_SUBSYS_COMPUTE_DSP
     * @type {Integer (Int32)}
     */
    static SUBSYS_COMPUTE_DSP => 4

    /**
     * Native name: SOC_SUBSYS_SECURE_PROC
     * @type {Integer (Int32)}
     */
    static SUBSYS_SECURE_PROC => 5

    /**
     * Native name: SOC_SUBSYS_VENDOR_DEFINED
     * @type {Integer (Int32)}
     */
    static SUBSYS_VENDOR_DEFINED => 65536
}
