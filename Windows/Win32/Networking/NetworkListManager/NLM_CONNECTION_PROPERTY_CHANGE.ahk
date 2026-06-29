#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The NLM_CONNECTION PROPERTY_CHANGE enumeration is a set of flags that define changes made to the properties of a network connection.
 * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/ne-netlistmgr-nlm_connection_property_change
 * @namespace Windows.Win32.Networking.NetworkListManager
 */
export default struct NLM_CONNECTION_PROPERTY_CHANGE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The Authentication (Domain Type) of this Network Connection has changed.
     * @type {Integer (Int32)}
     */
    static NLM_CONNECTION_PROPERTY_CHANGE_AUTHENTICATION => 1
}
