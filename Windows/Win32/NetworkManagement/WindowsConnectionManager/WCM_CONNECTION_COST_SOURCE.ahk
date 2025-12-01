#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the source that provides connection cost information.
 * @see https://learn.microsoft.com/windows/win32/api/wcmapi/ne-wcmapi-wcm_connection_cost_source
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectionManager
 * @version v4.0.30319
 */
class WCM_CONNECTION_COST_SOURCE extends Win32Enum{

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
