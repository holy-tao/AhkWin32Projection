#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains flags used to define a query or enumerator.
 * @see https://docs.microsoft.com/windows/win32/api//wbemcli/ne-wbemcli-wbem_query_flag_type
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WBEM_QUERY_FLAG_TYPE{

    /**
     * Include the specified class and all subclasses.
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_DEEP => 0

    /**
     * Include only the specified class, not any subclasses.
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_SHALLOW => 1

    /**
     * Used for prototyping. It does not execute the query and instead returns an object that looks like a typical result object.
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_PROTOTYPE => 2
}
