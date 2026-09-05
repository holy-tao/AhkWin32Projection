#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_SOUNDDETECTOR extends Win32Enum {

    /**
     * Native name: KSPROPERTY_SOUNDDETECTOR_SUPPORTEDPATTERNS
     * @type {Integer (Int32)}
     */
    static SUPPORTEDPATTERNS => 1

    /**
     * Native name: KSPROPERTY_SOUNDDETECTOR_PATTERNS
     * @type {Integer (Int32)}
     */
    static PATTERNS => 2

    /**
     * Native name: KSPROPERTY_SOUNDDETECTOR_ARMED
     * @type {Integer (Int32)}
     */
    static ARMED => 3

    /**
     * Native name: KSPROPERTY_SOUNDDETECTOR_MATCHRESULT
     * @type {Integer (Int32)}
     */
    static MATCHRESULT => 4

    /**
     * Native name: KSPROPERTY_SOUNDDETECTOR_RESET
     * @type {Integer (Int32)}
     */
    static RESET => 5

    /**
     * Native name: KSPROPERTY_SOUNDDETECTOR_STREAMINGSUPPORT
     * @type {Integer (Int32)}
     */
    static STREAMINGSUPPORT => 6
}
