#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authorization
 */
class AUTHZ_INITIALIZE_OBJECT_ACCESS_AUDIT_EVENT_FLAGS extends Win32Enum {

    /**
     * Native name: AUTHZ_NO_SUCCESS_AUDIT
     * @type {Integer (UInt32)}
     */
    static NO_SUCCESS_AUDIT => 1

    /**
     * Native name: AUTHZ_NO_FAILURE_AUDIT
     * @type {Integer (UInt32)}
     */
    static NO_FAILURE_AUDIT => 2

    /**
     * Native name: AUTHZ_NO_ALLOC_STRINGS
     * @type {Integer (UInt32)}
     */
    static NO_ALLOC_STRINGS => 4
}
