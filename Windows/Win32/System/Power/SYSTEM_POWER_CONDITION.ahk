#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used by the GUID_ACDC_POWER_SOURCE power event to indicate the current power source.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ne-winnt-system_power_condition
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class SYSTEM_POWER_CONDITION extends Win32Enum{

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
