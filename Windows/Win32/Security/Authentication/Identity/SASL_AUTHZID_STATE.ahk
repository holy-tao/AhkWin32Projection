#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class SASL_AUTHZID_STATE extends Win32Enum {

    /**
     * Native name: Sasl_AuthZIDForbidden
     * @type {Integer (Int32)}
     */
    static AuthZIDForbidden => 0

    /**
     * Native name: Sasl_AuthZIDProcessed
     * @type {Integer (Int32)}
     */
    static AuthZIDProcessed => 1
}
