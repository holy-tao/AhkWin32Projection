#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Gets the type of key used for token binding.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.tokenbindingkeytype
 * @namespace Windows.Security.Authentication.Web
 * @version WindowsRuntime 1.4
 */
class TokenBindingKeyType extends Win32Enum{

    /**
     * RSA-2048.
     * @type {Integer (Int32)}
     */
    static Rsa2048 => 0

    /**
     * ECDsaP256.
     * @type {Integer (Int32)}
     */
    static EcdsaP256 => 1

    /**
     * Any existing key type.
     * @type {Integer (Int32)}
     */
    static AnyExisting => 2
}
