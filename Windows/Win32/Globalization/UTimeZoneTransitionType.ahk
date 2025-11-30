#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UTimeZoneTransitionType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_TZ_TRANSITION_NEXT => 0

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_TZ_TRANSITION_NEXT_INCLUSIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_TZ_TRANSITION_PREVIOUS => 2

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_TZ_TRANSITION_PREVIOUS_INCLUSIVE => 3
}
