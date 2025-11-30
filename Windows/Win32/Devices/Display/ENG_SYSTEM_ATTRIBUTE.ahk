#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class ENG_SYSTEM_ATTRIBUTE extends Win32Enum{

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
