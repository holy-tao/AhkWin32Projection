#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 */
class WBEM_EXTRA_RETURN_CODES extends Win32Enum {

    /**
     * Native name: WBEM_S_INITIALIZED
     * @type {Integer (Int32)}
     */
    static S_INITIALIZED => 0

    /**
     * Native name: WBEM_S_LIMITED_SERVICE
     * @type {Integer (Int32)}
     */
    static S_LIMITED_SERVICE => 274433

    /**
     * Native name: WBEM_S_INDIRECTLY_UPDATED
     * @type {Integer (Int32)}
     */
    static S_INDIRECTLY_UPDATED => 274434

    /**
     * Native name: WBEM_S_SUBJECT_TO_SDS
     * @type {Integer (Int32)}
     */
    static S_SUBJECT_TO_SDS => 274435

    /**
     * Native name: WBEM_E_RETRY_LATER
     * @type {Integer (Int32)}
     */
    static E_RETRY_LATER => -2147209215

    /**
     * Native name: WBEM_E_RESOURCE_CONTENTION
     * @type {Integer (Int32)}
     */
    static E_RESOURCE_CONTENTION => -2147209214
}
