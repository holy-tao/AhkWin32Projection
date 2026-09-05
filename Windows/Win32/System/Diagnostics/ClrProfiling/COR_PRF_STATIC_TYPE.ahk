#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
class COR_PRF_STATIC_TYPE extends Win32Enum {

    /**
     * Native name: COR_PRF_FIELD_NOT_A_STATIC
     * @type {Integer (Int32)}
     */
    static FIELD_NOT_A_STATIC => 0

    /**
     * Native name: COR_PRF_FIELD_APP_DOMAIN_STATIC
     * @type {Integer (Int32)}
     */
    static FIELD_APP_DOMAIN_STATIC => 1

    /**
     * Native name: COR_PRF_FIELD_THREAD_STATIC
     * @type {Integer (Int32)}
     */
    static FIELD_THREAD_STATIC => 2

    /**
     * Native name: COR_PRF_FIELD_CONTEXT_STATIC
     * @type {Integer (Int32)}
     */
    static FIELD_CONTEXT_STATIC => 4

    /**
     * Native name: COR_PRF_FIELD_RVA_STATIC
     * @type {Integer (Int32)}
     */
    static FIELD_RVA_STATIC => 8
}
