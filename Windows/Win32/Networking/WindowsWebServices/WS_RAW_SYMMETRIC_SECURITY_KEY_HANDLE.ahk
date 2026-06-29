#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_SECURITY_KEY_HANDLE_TYPE.ahk" { WS_SECURITY_KEY_HANDLE_TYPE }
#Import ".\WS_BYTES.ahk" { WS_BYTES }
#Import ".\WS_SECURITY_KEY_HANDLE.ahk" { WS_SECURITY_KEY_HANDLE }

/**
 * The type for specifying a symmetric cryptographic key as raw bytes.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_raw_symmetric_security_key_handle
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_RAW_SYMMETRIC_SECURITY_KEY_HANDLE {
    #StructPack 8

    /**
     * The base type from which this type and all other key handle types derive.
     */
    keyHandle : WS_SECURITY_KEY_HANDLE

    /**
     * The cryptographic key as raw bytes.  It is strongly recommended that
     * after the key is supplied in this form to any API, it is immediately
     * cleared using SecureZeroMemory.
     */
    rawKeyBytes : WS_BYTES

}
