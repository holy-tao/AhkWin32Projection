#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The values in this enumeration are used to identify the sub-types of WS_POLICY_EXTENSION.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_policy_extension_type
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_POLICY_EXTENSION_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * This value is used in the type field of <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_endpoint_policy_extension">WS_POLICY_EXTENSION</a> to identify a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_endpoint_policy_extension">WS_ENDPOINT_POLICY_EXTENSION</a> structure.
     * @type {Integer (Int32)}
     */
    static WS_ENDPOINT_POLICY_EXTENSION_TYPE => 1
}
