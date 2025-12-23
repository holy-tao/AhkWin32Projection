#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_NETWORKCAMERACONTROL_NTPINFO_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_NETWORKCAMERACONTROL_NTPINFO_TYPE_DISABLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_NETWORKCAMERACONTROL_NTPINFO_TYPE_HOSTNTP => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_NETWORKCAMERACONTROL_NTPINFO_TYPE_CUSTOM => 2
}
