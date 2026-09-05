#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The NLM_NETWORK_PROPERTY_CHANGE enumeration is a set of flags that define changes made to the properties of a network.
 * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/ne-netlistmgr-nlm_network_property_change
 * @namespace Windows.Win32.Networking.NetworkListManager
 */
class NLM_NETWORK_PROPERTY_CHANGE extends Win32Enum {

    /**
     * A connection to this network has been added or removed.
     * Native name: NLM_NETWORK_PROPERTY_CHANGE_CONNECTION
     * @type {Integer (Int32)}
     */
    static CONNECTION => 1

    /**
     * The description of the network has changed.
     * Native name: NLM_NETWORK_PROPERTY_CHANGE_DESCRIPTION
     * @type {Integer (Int32)}
     */
    static DESCRIPTION => 2

    /**
     * The name of the network has changed.
     * Native name: NLM_NETWORK_PROPERTY_CHANGE_NAME
     * @type {Integer (Int32)}
     */
    static NAME => 4

    /**
     * Native name: NLM_NETWORK_PROPERTY_CHANGE_ICON
     * @type {Integer (Int32)}
     */
    static ICON => 8

    /**
     * The category of the network has changed.
     * Native name: NLM_NETWORK_PROPERTY_CHANGE_CATEGORY_VALUE
     * @type {Integer (Int32)}
     */
    static CATEGORY_VALUE => 16
}
