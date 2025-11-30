#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_NETWORKCAMERACONTROL_PROPERTY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_NETWORKCAMERACONTROL_NTP => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_NETWORKCAMERACONTROL_URI => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_NETWORKCAMERACONTROL_METADATA => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_NETWORKCAMERACONTROL_EVENTTOPICS_XML => 3
}
