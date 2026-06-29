#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the types of hardware counters being profiled.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-hardware_counter_type
 * @namespace Windows.Win32.System.Performance.HardwareCounterProfiling
 */
export default struct HARDWARE_COUNTER_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
