#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_SOUNDDETECTOR extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_SOUNDDETECTOR_SUPPORTEDPATTERNS => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_SOUNDDETECTOR_PATTERNS => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_SOUNDDETECTOR_ARMED => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_SOUNDDETECTOR_MATCHRESULT => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_SOUNDDETECTOR_RESET => 5

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_SOUNDDETECTOR_STREAMINGSUPPORT => 6
}
