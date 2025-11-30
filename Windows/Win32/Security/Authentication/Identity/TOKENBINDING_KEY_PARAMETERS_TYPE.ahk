#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class TOKENBINDING_KEY_PARAMETERS_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static TOKENBINDING_KEY_PARAMETERS_TYPE_RSA2048_PKCS => 0

    /**
     * @type {Integer (Int32)}
     */
    static TOKENBINDING_KEY_PARAMETERS_TYPE_RSA2048_PSS => 1

    /**
     * @type {Integer (Int32)}
     */
    static TOKENBINDING_KEY_PARAMETERS_TYPE_ECDSAP256 => 2

    /**
     * @type {Integer (Int32)}
     */
    static TOKENBINDING_KEY_PARAMETERS_TYPE_ANYEXISTING => 255
}
