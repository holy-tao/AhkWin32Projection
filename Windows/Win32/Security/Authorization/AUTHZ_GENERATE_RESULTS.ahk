#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authorization
 */
class AUTHZ_GENERATE_RESULTS extends Win32Enum {

    /**
     * @type {Integer (UInt32)}
     */
    static AUTHZ_GENERATE_SUCCESS_AUDIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AUTHZ_GENERATE_FAILURE_AUDIT => 2
}
