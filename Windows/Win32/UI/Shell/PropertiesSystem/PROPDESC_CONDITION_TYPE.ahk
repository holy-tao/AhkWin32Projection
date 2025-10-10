#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the condition type to use when displaying the property in the query builder UI in Windows Vista, but not in Windows 7 and later.
 * @remarks
 * 
  * The flags in PROPDESC_CONDITION_TYPE affected the query string display in the <b>Advanced Query Builder</b> user interface in Windows Vista. In Windows 7 and later, the flags in PROPDESC_CONDITION_TYPE are not used.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//propsys/ne-propsys-propdesc_condition_type
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class PROPDESC_CONDITION_TYPE{

    /**
     * The default value; it means the condition type is unspecified.
     * @type {Integer (Int32)}
     */
    static PDCOT_NONE => 0

    /**
     * Use the string condition type.
     * @type {Integer (Int32)}
     */
    static PDCOT_STRING => 1

    /**
     * Use the size condition type.
     * @type {Integer (Int32)}
     */
    static PDCOT_SIZE => 2

    /**
     * Use the date/time condition type.
     * @type {Integer (Int32)}
     */
    static PDCOT_DATETIME => 3

    /**
     * Use the Boolean condition type.
     * @type {Integer (Int32)}
     */
    static PDCOT_BOOLEAN => 4

    /**
     * Use the number condition type.
     * @type {Integer (Int32)}
     */
    static PDCOT_NUMBER => 5
}
