#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class TOKENBINDING_KEY_PARAMETERS_TYPE extends Win32Enum {

    /**
     * Native name: TOKENBINDING_KEY_PARAMETERS_TYPE_RSA2048_PKCS
     * @type {Integer (Int32)}
     */
    static RSA2048_PKCS => 0

    /**
     * Native name: TOKENBINDING_KEY_PARAMETERS_TYPE_RSA2048_PSS
     * @type {Integer (Int32)}
     */
    static RSA2048_PSS => 1

    /**
     * Native name: TOKENBINDING_KEY_PARAMETERS_TYPE_ECDSAP256
     * @type {Integer (Int32)}
     */
    static ECDSAP256 => 2

    /**
     * Native name: TOKENBINDING_KEY_PARAMETERS_TYPE_ANYEXISTING
     * @type {Integer (Int32)}
     */
    static ANYEXISTING => 255
}
