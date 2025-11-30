#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines the types of hardware counters being profiled.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ne-winnt-hardware_counter_type
 * @namespace Windows.Win32.System.Performance.HardwareCounterProfiling
 * @version v4.0.30319
 */
class HARDWARE_COUNTER_TYPE extends Win32Enum{

    /**
     * Hardware performance monitoring counters.
     * @type {Integer (Int32)}
     */
    static PMCCounter => 0

    /**
     * The maximum enumeration value for this enumeration.
     * @type {Integer (Int32)}
     */
    static MaxHardwareCounterType => 1
}
