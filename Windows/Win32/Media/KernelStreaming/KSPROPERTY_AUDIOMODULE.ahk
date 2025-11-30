#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_AUDIOMODULE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIOMODULE_DESCRIPTORS => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIOMODULE_COMMAND => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_AUDIOMODULE_NOTIFICATION_DEVICE_ID => 3
}
