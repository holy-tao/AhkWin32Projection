#Requires AutoHotkey v2.0.0 64-bit

/**
 * Represents the type of action Function Discovery is performing on the specified function instance. This information is used by the client program's change notification handler.
 * @remarks
 * 
 * When a client program implements the <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctiondiscoverynotification">IFunctionDiscoveryNotification</a> interface and passes the address of the interface to one of the Query methods, Function Discovery calls the client program's <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscoverynotification-onupdate">IFunctionDiscoveryNotification::OnUpdate</a> method to notify the client program when a function instance which meets the query parameters has been added, removed, or modified.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryapi/ne-functiondiscoveryapi-queryupdateaction
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 * @version v4.0.30319
 */
class QueryUpdateAction{

    /**
     * Function Discovery is adding the specified function instance.
     * @type {Integer (Int32)}
     */
    static QUA_ADD => 0

    /**
     * Function Discovery is removing the specified function instance.
     * @type {Integer (Int32)}
     */
    static QUA_REMOVE => 1

    /**
     * Function Discovery is modifying the specified function instance.
     * @type {Integer (Int32)}
     */
    static QUA_CHANGE => 2
}
