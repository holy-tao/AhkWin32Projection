#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the source that provides connection cost information.
 * @see https://learn.microsoft.com/windows/win32/api/wcmapi/ne-wcmapi-wcm_connection_cost_source
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectionManager
 */
class WCM_CONNECTION_COST_SOURCE extends Win32Enum {

    /**
     * Default source.
     * Native name: WCM_CONNECTION_COST_SOURCE_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * The source for the connection cost  is Group Policy.
     * Native name: WCM_CONNECTION_COST_SOURCE_GP
     * @type {Integer (Int32)}
     */
    static GP => 1

    /**
     * The source for the connection cost is the user.
     * Native name: WCM_CONNECTION_COST_SOURCE_USER
     * @type {Integer (Int32)}
     */
    static USER => 2

    /**
     * The source for the connection cost  is the operator.
     * Native name: WCM_CONNECTION_COST_SOURCE_OPERATOR
     * @type {Integer (Int32)}
     */
    static OPERATOR => 3
}
