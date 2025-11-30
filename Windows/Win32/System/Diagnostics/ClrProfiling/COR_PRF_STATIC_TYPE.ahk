#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class COR_PRF_STATIC_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_FIELD_NOT_A_STATIC => 0

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_FIELD_APP_DOMAIN_STATIC => 1

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_FIELD_THREAD_STATIC => 2

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_FIELD_CONTEXT_STATIC => 4

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_FIELD_RVA_STATIC => 8
}
