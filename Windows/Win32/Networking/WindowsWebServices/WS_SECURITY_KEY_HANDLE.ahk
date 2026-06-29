#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_SECURITY_KEY_HANDLE_TYPE.ahk" { WS_SECURITY_KEY_HANDLE_TYPE }

/**
 * The abstract base type for all types that specify a cryptographic key. Such a key is typically specified for a generic XML security token or a custom security token.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_key_handle
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_SECURITY_KEY_HANDLE {
    #StructPack 4

    /**
     * Type of the key handle.
     */
    keyHandleType : WS_SECURITY_KEY_HANDLE_TYPE

}
