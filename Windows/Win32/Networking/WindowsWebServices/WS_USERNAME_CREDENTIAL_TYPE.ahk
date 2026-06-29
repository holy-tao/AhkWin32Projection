#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The type of the username/password credential, used as a selector for subtypes of WS_USERNAME_CREDENTIAL.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_username_credential_type
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_USERNAME_CREDENTIAL_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Type ID for the username/password credential <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_string_username_credential">WS_STRING_USERNAME_CREDENTIAL</a>.
     * @type {Integer (Int32)}
     */
    static WS_STRING_USERNAME_CREDENTIAL_TYPE => 1
}
