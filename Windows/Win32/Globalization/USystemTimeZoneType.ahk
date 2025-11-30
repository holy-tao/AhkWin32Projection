#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class USystemTimeZoneType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_ZONE_TYPE_ANY => 0

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_ZONE_TYPE_CANONICAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_ZONE_TYPE_CANONICAL_LOCATION => 2
}
