#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_AUDIOMODULE extends Win32Enum {

    /**
     * Native name: KSPROPERTY_AUDIOMODULE_DESCRIPTORS
     * @type {Integer (Int32)}
     */
    static DESCRIPTORS => 1

    /**
     * Native name: KSPROPERTY_AUDIOMODULE_COMMAND
     * @type {Integer (Int32)}
     */
    static COMMAND => 2

    /**
     * Native name: KSPROPERTY_AUDIOMODULE_NOTIFICATION_DEVICE_ID
     * @type {Integer (Int32)}
     */
    static NOTIFICATION_DEVICE_ID => 3
}
