#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Describes how property values are displayed when multiple items are selected.
 * @remarks
 * 
 * These values are defined in propsys.h and propsys.idl.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//propsys/ne-propsys-propdesc_aggregation_type
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class PROPDESC_AGGREGATION_TYPE extends Win32Enum{

    /**
     * Display the string "Multiple Values".
     * @type {Integer (Int32)}
     */
    static PDAT_DEFAULT => 0

    /**
     * Display the first value in the selection.
     * @type {Integer (Int32)}
     */
    static PDAT_FIRST => 1

    /**
     * Display the sum of the selected values. This flag is never returned for data types <b>VT_LPWSTR</b>, <b>VT_BOOL</b>, and <b>VT_FILETIME</b>.
     * @type {Integer (Int32)}
     */
    static PDAT_SUM => 2

    /**
     * Display the numerical average of the selected values. This flag is never returned for data types <b>VT_LPWSTR</b>, <b>VT_BOOL</b>, and <b>VT_FILETIME</b>.
     * @type {Integer (Int32)}
     */
    static PDAT_AVERAGE => 3

    /**
     * Display the date range of the selected values. This flag is returned only for values of the <b>VT_FILETIME</b> data type.
     * @type {Integer (Int32)}
     */
    static PDAT_DATERANGE => 4

    /**
     * Display a concatenated string of all the values. The order of individual values in the string is undefined. The concatenated string omits duplicate values; if a value occurs more than once, it appears only once in the concatenated string.
     * @type {Integer (Int32)}
     */
    static PDAT_UNION => 5

    /**
     * Display the highest of the selected values.
     * @type {Integer (Int32)}
     */
    static PDAT_MAX => 6

    /**
     * Display the lowest of the selected values.
     * @type {Integer (Int32)}
     */
    static PDAT_MIN => 7
}
