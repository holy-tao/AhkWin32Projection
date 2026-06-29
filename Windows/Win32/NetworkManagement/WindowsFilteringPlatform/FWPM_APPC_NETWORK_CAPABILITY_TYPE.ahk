#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of app container network capability that is associated with the object or traffic in question.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ne-fwpmtypes-fwpm_appc_network_capability_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_APPC_NETWORK_CAPABILITY_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Allows the app container to make network requests to servers on the Internet. It acts as a client.
     * @type {Integer (Int32)}
     */
    static FWPM_APPC_NETWORK_CAPABILITY_INTERNET_CLIENT => 0

    /**
     * Allows the app container to make requests and to receive requests to and from the Internet. It acts as a client and also as a server.
     * @type {Integer (Int32)}
     */
    static FWPM_APPC_NETWORK_CAPABILITY_INTERNET_CLIENT_SERVER => 1

    /**
     * Allows the app container to make requests and to receive requests to and from private networks (such as a home network, work network, or the corporate domain network of the computer). It acts as a client and also as a server.
     * @type {Integer (Int32)}
     */
    static FWPM_APPC_NETWORK_CAPABILITY_INTERNET_PRIVATE_NETWORK => 2
}
