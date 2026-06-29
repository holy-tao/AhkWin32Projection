#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The NLM_NETWORK_PROPERTY_CHANGE enumeration is a set of flags that define changes made to the properties of a network.
 * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/ne-netlistmgr-nlm_network_property_change
 * @namespace Windows.Win32.Networking.NetworkListManager
 */
export default struct NLM_NETWORK_PROPERTY_CHANGE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * A connection to this network has been added or removed.
     * @type {Integer (Int32)}
     */
    static NLM_NETWORK_PROPERTY_CHANGE_CONNECTION => 1

    /**
     * The description of the network has changed.
     * @type {Integer (Int32)}
     */
    static NLM_NETWORK_PROPERTY_CHANGE_DESCRIPTION => 2

    /**
     * The name of the network has changed.
     * @type {Integer (Int32)}
     */
    static NLM_NETWORK_PROPERTY_CHANGE_NAME => 4

    /**
     * @type {Integer (Int32)}
     */
    static NLM_NETWORK_PROPERTY_CHANGE_ICON => 8

    /**
     * The category of the network has changed.
     * @type {Integer (Int32)}
     */
    static NLM_NETWORK_PROPERTY_CHANGE_CATEGORY_VALUE => 16
}
