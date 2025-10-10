#Requires AutoHotkey v2.0.0 64-bit

/**
 * Type of locale is needed when setting and getting locales.
 * @see https://docs.microsoft.com/windows/win32/api//mi/ne-mi-mi_localetype
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_LocaleType{

    /**
     * The preferred language of error messages and dialog boxes.
     * @type {Integer (Int32)}
     */
    static MI_LOCALE_TYPE_REQUESTED_UI => 0

    /**
     * The preferred date/time formats and  whether a comma or a decimal point is used in a floating-point number.
     * @type {Integer (Int32)}
     */
    static MI_LOCALE_TYPE_REQUESTED_DATA => 1

    /**
     * The fallback error messages language if the requested language is not available.
     * @type {Integer (Int32)}
     */
    static MI_LOCALE_TYPE_CLOSEST_UI => 2

    /**
     * The fallback data format if the requested language is not available.
     * @type {Integer (Int32)}
     */
    static MI_LOCALE_TYPE_CLOSEST_DATA => 3
}
