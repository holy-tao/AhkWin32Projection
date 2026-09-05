#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_NETWORKCAMERACONTROL_PROPERTY extends Win32Enum {

    /**
     * Native name: KSPROPERTY_NETWORKCAMERACONTROL_NTP
     * @type {Integer (Int32)}
     */
    static NTP => 0

    /**
     * Native name: KSPROPERTY_NETWORKCAMERACONTROL_URI
     * @type {Integer (Int32)}
     */
    static URI => 1

    /**
     * Native name: KSPROPERTY_NETWORKCAMERACONTROL_METADATA
     * @type {Integer (Int32)}
     */
    static METADATA => 2

    /**
     * Native name: KSPROPERTY_NETWORKCAMERACONTROL_EVENTTOPICS_XML
     * @type {Integer (Int32)}
     */
    static EVENTTOPICS_XML => 3
}
