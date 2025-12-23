#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_CAMERA_PHOTOTRIGGERTIME_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERA_PHOTOTRIGGERTIME_CLEAR => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERA_PHOTOTRIGGERTIME_SET => 1
}
