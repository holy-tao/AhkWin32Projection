#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 */
class ENG_SYSTEM_ATTRIBUTE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static EngProcessorFeature => 1

    /**
     * @type {Integer (Int32)}
     */
    static EngNumberOfProcessors => 2

    /**
     * @type {Integer (Int32)}
     */
    static EngOptimumAvailableUserMemory => 3

    /**
     * @type {Integer (Int32)}
     */
    static EngOptimumAvailableSystemMemory => 4
}
