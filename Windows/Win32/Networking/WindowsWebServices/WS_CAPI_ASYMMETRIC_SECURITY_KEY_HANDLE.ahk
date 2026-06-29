#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_SECURITY_KEY_HANDLE_TYPE.ahk" { WS_SECURITY_KEY_HANDLE_TYPE }
#Import ".\WS_SECURITY_KEY_HANDLE.ahk" { WS_SECURITY_KEY_HANDLE }

/**
 * The type for specifying asymmetric cryptographic keys as CAPI 1.0 key handles.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_capi_asymmetric_security_key_handle
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_CAPI_ASYMMETRIC_SECURITY_KEY_HANDLE {
    #StructPack 8

    /**
     * The base type from which this type and all other key handle types derive.
     */
    keyHandle : WS_SECURITY_KEY_HANDLE

    /**
     * The cryptographic provider.
     */
    provider : IntPtr

    /**
     * The key specification.
     */
    keySpec : UInt32

}
