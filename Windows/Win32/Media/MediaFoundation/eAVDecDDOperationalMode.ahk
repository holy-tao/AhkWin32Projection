#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the compression control mode for a Dolby AC-3 audio stream. This enumeration is used with the AVDecDDOperationalMode property.
 * @see https://docs.microsoft.com/windows/win32/api//codecapi/ne-codecapi-eavdecddoperationalmode
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVDecDDOperationalMode extends Win32Enum{

    /**
     * No dynamic range control or dialogue normalization (dialnorm). This mode should be used only for signal tests.
     * @type {Integer (Int32)}
     */
    static eAVDecDDOperationalMode_NONE => 0

    /**
     * Line mode. Dialnorm is enabled with a reference level of -31 decibels full scale (dBFS). Dynamic range control is applied, and high-level/low-level scaling is enabled. To set the high-level scaling factor, set the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/avdecdddynamicrangescalehigh-property">AVDecDDDynamicRangeScaleHigh</a> property. To set the low-level scaling factor, set the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/avdecdddynamicrangescalelow-property">AVDecDDDynamicRangeScaleLow</a> property.
     * @type {Integer (Int32)}
     */
    static eAVDecDDOperationalMode_LINE => 1

    /**
     * RF mode. Dialnorm is enabled with a reference level of -20 dBFS. Dynamic range control is applied. High-level/low-level scaling is disabled; instead, the maximum dynamic range reduction is applied.
     * @type {Integer (Int32)}
     */
    static eAVDecDDOperationalMode_RF => 2

    /**
     * Custom mode 0 (analog dialnorm).
     * @type {Integer (Int32)}
     */
    static eAVDecDDOperationalMode_CUSTOM0 => 3

    /**
     * Custom mode 1 (digital dialnorm).
     * @type {Integer (Int32)}
     */
    static eAVDecDDOperationalMode_CUSTOM1 => 4

    /**
     * Dialnorm enabled, dialogue at -8dBFS. Dynamic range and compression used. High-level/low-level scaling is not allowed (always fully compressed).
     * @type {Integer (Int32)}
     */
    static eAVDecDDOperationalMode_PORTABLE8 => 5

    /**
     * Dialnorm enabled, dialogue at -11dBFS. Dynamic range and compression used. High-level/low-level scaling is not allowed (always fully compressed).
     * @type {Integer (Int32)}
     */
    static eAVDecDDOperationalMode_PORTABLE11 => 6

    /**
     * Dialnorm enabled, dialogue at -14dBFS. Dynamic range and compression used. High-level/low-level scaling is not allowed (always fully compressed).
     * @type {Integer (Int32)}
     */
    static eAVDecDDOperationalMode_PORTABLE14 => 7
}
