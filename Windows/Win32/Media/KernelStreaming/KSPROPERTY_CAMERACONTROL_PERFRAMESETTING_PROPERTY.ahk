#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_CAMERACONTROL_PERFRAMESETTING_PROPERTY extends Win32Enum {

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_PERFRAMESETTING_CAPABILITY
     * @type {Integer (Int32)}
     */
    static CAPABILITY => 0

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_PERFRAMESETTING_SET
     * @type {Integer (Int32)}
     */
    static SET => 1

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_PERFRAMESETTING_CLEAR
     * @type {Integer (Int32)}
     */
    static CLEAR => 2
}
