#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_SECURITY_KEY_HANDLE_TYPE.ahk" { WS_SECURITY_KEY_HANDLE_TYPE }
#Import "..\..\Security\Cryptography\NCRYPT_KEY_HANDLE.ahk" { NCRYPT_KEY_HANDLE }
#Import ".\WS_SECURITY_KEY_HANDLE.ahk" { WS_SECURITY_KEY_HANDLE }

/**
 * The type for specifying asymmetric cryptographic keys as a CryptoNG NCRYPT_KEY_HANDLE.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_ncrypt_asymmetric_security_key_handle
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_NCRYPT_ASYMMETRIC_SECURITY_KEY_HANDLE {
    #StructPack 8

    /**
     * The base type from which this type and all other key handle types derive.
     */
    keyHandle : WS_SECURITY_KEY_HANDLE

    /**
     * The CryptoNG asymmetric cryptographic key.
     */
    asymmetricKey : NCRYPT_KEY_HANDLE

}
