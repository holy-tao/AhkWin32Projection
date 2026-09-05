#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_CAMERA_PHOTOTRIGGERTIME_FLAGS extends Win32Enum {

    /**
     * Native name: KSPROPERTY_CAMERA_PHOTOTRIGGERTIME_CLEAR
     * @type {Integer (Int32)}
     */
    static CLEAR => 0

    /**
     * Native name: KSPROPERTY_CAMERA_PHOTOTRIGGERTIME_SET
     * @type {Integer (Int32)}
     */
    static SET => 1
}
