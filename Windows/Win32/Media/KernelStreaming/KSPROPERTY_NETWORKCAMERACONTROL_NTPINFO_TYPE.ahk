#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_NETWORKCAMERACONTROL_NTPINFO_TYPE extends Win32Enum {

    /**
     * Native name: KSPROPERTY_NETWORKCAMERACONTROL_NTPINFO_TYPE_DISABLE
     * @type {Integer (Int32)}
     */
    static DISABLE => 0

    /**
     * Native name: KSPROPERTY_NETWORKCAMERACONTROL_NTPINFO_TYPE_HOSTNTP
     * @type {Integer (Int32)}
     */
    static HOSTNTP => 1

    /**
     * Native name: KSPROPERTY_NETWORKCAMERACONTROL_NTPINFO_TYPE_CUSTOM
     * @type {Integer (Int32)}
     */
    static CUSTOM => 2
}
