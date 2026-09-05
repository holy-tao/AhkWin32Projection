#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_VIDCAP_VIDEOCONTROL extends Win32Enum {

    /**
     * Native name: KSPROPERTY_VIDEOCONTROL_CAPS
     * @type {Integer (Int32)}
     */
    static CAPS => 0

    /**
     * Native name: KSPROPERTY_VIDEOCONTROL_ACTUAL_FRAME_RATE
     * @type {Integer (Int32)}
     */
    static ACTUAL_FRAME_RATE => 1

    /**
     * Native name: KSPROPERTY_VIDEOCONTROL_FRAME_RATES
     * @type {Integer (Int32)}
     */
    static FRAME_RATES => 2

    /**
     * Native name: KSPROPERTY_VIDEOCONTROL_MODE
     * @type {Integer (Int32)}
     */
    static MODE => 3
}
