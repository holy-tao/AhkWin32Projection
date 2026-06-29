#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the source that provides connection cost information.
 * @see https://learn.microsoft.com/windows/win32/api/wcmapi/ne-wcmapi-wcm_connection_cost_source
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectionManager
 */
export default struct WCM_CONNECTION_COST_SOURCE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Default source.
     * @type {Integer (Int32)}
     */
    static WCM_CONNECTION_COST_SOURCE_DEFAULT => 0

    /**
     * The source for the connection cost  is Group Policy.
     * @type {Integer (Int32)}
     */
    static WCM_CONNECTION_COST_SOURCE_GP => 1

    /**
     * The source for the connection cost is the user.
     * @type {Integer (Int32)}
     */
    static WCM_CONNECTION_COST_SOURCE_USER => 2

    /**
     * The source for the connection cost  is the operator.
     * @type {Integer (Int32)}
     */
    static WCM_CONNECTION_COST_SOURCE_OPERATOR => 3
}
