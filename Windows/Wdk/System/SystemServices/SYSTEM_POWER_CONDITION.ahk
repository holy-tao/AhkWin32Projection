#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used by the GUID_ACDC_POWER_SOURCE power event to indicate the current power source.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-system_power_condition
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct SYSTEM_POWER_CONDITION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The computer is powered by an AC power source (or similar, such as a laptop powered by a 12V automotive 
     *       adapter).
     * @type {Integer (Int32)}
     */
    static PoAc => 0

    /**
     * The system is receiving power from built-in batteries.
     * @type {Integer (Int32)}
     */
    static PoDc => 1

    /**
     * The computer is powered by a short-term power source such as a UPS device.
     * @type {Integer (Int32)}
     */
    static PoHot => 2

    /**
     * Values equal to or greater than this value indicate an out of range value.
     * @type {Integer (Int32)}
     */
    static PoConditionMaximum => 3
}
