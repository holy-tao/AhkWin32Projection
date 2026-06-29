#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains flags used to define a query or enumerator.
 * @see https://learn.microsoft.com/windows/win32/api/wbemcli/ne-wbemcli-wbem_query_flag_type
 * @namespace Windows.Win32.System.Wmi
 */
export default struct WBEM_QUERY_FLAG_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
