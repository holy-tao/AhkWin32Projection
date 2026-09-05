#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 */
class ENG_SYSTEM_ATTRIBUTE extends Win32Enum {

    /**
     * Native name: EngProcessorFeature
     * @type {Integer (Int32)}
     */
    static ProcessorFeature => 1

    /**
     * Native name: EngNumberOfProcessors
     * @type {Integer (Int32)}
     */
    static NumberOfProcessors => 2

    /**
     * Native name: EngOptimumAvailableUserMemory
     * @type {Integer (Int32)}
     */
    static OptimumAvailableUserMemory => 3

    /**
     * Native name: EngOptimumAvailableSystemMemory
     * @type {Integer (Int32)}
     */
    static OptimumAvailableSystemMemory => 4
}
