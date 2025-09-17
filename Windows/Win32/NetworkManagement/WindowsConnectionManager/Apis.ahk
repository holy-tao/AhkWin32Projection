#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectionManager
 * @version v4.0.30319
 */
class WindowsConnectionManager {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static WCM_API_VERSION_1_0 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WCM_API_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WCM_UNKNOWN_DATAPLAN_STATUS => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static WCM_MAX_PROFILE_NAME => 256

    /**
     * @type {Integer (UInt32)}
     */
    static NET_INTERFACE_FLAG_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NET_INTERFACE_FLAG_CONNECT_IF_NEEDED => 1
;@endregion Constants

;@region Methods
    /**
     * Retrieves the value of a specified WCM property.
     * @remarks
     * The type of data stored in the <i>ppData</i> parameter will vary, depending on which property is being queried. This table shows the data type of each property.
     * 
     * <table>
     * <tr>
     * <th>Property name</th>
     * <th>Data type</th>
     * </tr>
     * <tr>
     * <td>wcm_global_property_domain_policy</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wcmapi/ns-wcmapi-wcm_policy_value">WCM_POLICY_VALUE</a>
     * </td>
     * </tr>
     * <tr>
     * <td>wcm_global_property_minimize_policy</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wcmapi/ns-wcmapi-wcm_policy_value">WCM_POLICY_VALUE</a>
     * </td>
     * </tr>
     * <tr>
     * <td>wcm_global_property_roaming_policy</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wcmapi/ns-wcmapi-wcm_policy_value">WCM_POLICY_VALUE</a>
     * </td>
     * </tr>
     * <tr>
     * <td>wcm_global_property_powermanagement_policy</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wcmapi/ns-wcmapi-wcm_policy_value">WCM_POLICY_VALUE</a>
     * </td>
     * </tr>
     * <tr>
     * <td>wcm_intf_property_connection_cost</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wcmapi/ns-wcmapi-wcm_connection_cost_data">WCM_CONNECTION_COST_DATA</a>
     * </td>
     * </tr>
     * <tr>
     * <td>wcm_intf_property_dataplan_status</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wcmapi/ns-wcmapi-wcm_dataplan_status">WCM_DATAPLAN_STATUS</a>
     * </td>
     * </tr>
     * <tr>
     * <td>wcm_intf_property_hotspot_profile</td>
     * <td>Contains zero-length output. </td>
     * </tr>
     * </table>
     * @param {Pointer<Guid>} pInterface Type: <b>const GUID*</b>
     * 
     * The interface to query. For global properties, this parameter is NULL.
     * @param {Pointer<Char>} strProfileName Type: <b>LPCWSTR</b>
     * 
     * The name of the profile. If querying a non-global property (<b>connection_cost</b>, <b>dataplan_status</b>, or <b>hotspot_profile</b>), the profile must be specified or the call will fail.
     * @param {Integer} Property Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wcmapi/ne-wcmapi-wcm_property">WCM_PROPERTY</a></b>
     * 
     * The WCM property to query.
     * @param {Pointer<UInt32>} pdwDataSize Type: <b>PDWORD</b>
     * 
     * The size of the returned property value.
     * @param {Pointer<Byte>} ppData Type: <b>PBYTE*</b>
     * 
     * The returned property value.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * Returns ERROR_SUCCESS if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/wcmapi/nf-wcmapi-wcmqueryproperty
     * @since windows8.0
     */
    static WcmQueryProperty(pInterface, strProfileName, Property, pdwDataSize, ppData) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        strProfileName := strProfileName is String? StrPtr(strProfileName) : strProfileName

        result := DllCall("wcmapi.dll\WcmQueryProperty", "ptr", pInterface, "ptr", strProfileName, "int", Property, "ptr", pReserved, "uint*", pdwDataSize, "ptr", ppData, "uint")
        return result
    }

    /**
     * Sets the value of a WCM property.
     * @remarks
     * The type of data stored in the <i>pbData</i> parameter will vary, depending on which property is being set. This table shows the data type of each property.
     * 
     * <table>
     * <tr>
     * <th>Property name</th>
     * <th>Data type</th>
     * </tr>
     * <tr>
     * <td>wcm_global_property_domain_policy</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wcmapi/ns-wcmapi-wcm_policy_value">WCM_POLICY_VALUE</a>
     * </td>
     * </tr>
     * <tr>
     * <td>wcm_global_property_minimize_policy</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wcmapi/ns-wcmapi-wcm_policy_value">WCM_POLICY_VALUE</a>
     * </td>
     * </tr>
     * <tr>
     * <td>wcm_global_property_roaming_policy</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wcmapi/ns-wcmapi-wcm_policy_value">WCM_POLICY_VALUE</a>
     * </td>
     * </tr>
     * <tr>
     * <td>wcm_global_property_powermanagement_policy</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wcmapi/ns-wcmapi-wcm_policy_value">WCM_POLICY_VALUE</a>
     * </td>
     * </tr>
     * <tr>
     * <td>wcm_intf_property_connection_cost</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wcmapi/ns-wcmapi-wcm_connection_cost_data">WCM_CONNECTION_COST_DATA</a>
     * </td>
     * </tr>
     * <tr>
     * <td>wcm_intf_property_dataplan_status</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wcmapi/ns-wcmapi-wcm_dataplan_status">WCM_DATAPLAN_STATUS</a>
     * </td>
     * </tr>
     * <tr>
     * <td>wcm_intf_property_hotspot_profile</td>
     * <td>Variable-length XML string. See the <a href="https://docs.microsoft.com/uwp/schemas/mobilebroadbandschema/hotspotprofile/schema-root">HotSpotProfile schema</a> for more information.</td>
     * </tr>
     * </table>
     * @param {Pointer<Guid>} pInterface Type: <b>const GUID*</b>
     * 
     * The interface to set. For global properties, this parameter is NULL.
     * @param {Pointer<Char>} strProfileName Type: <b>LPCWSTR</b>
     * 
     * The profile name.
     * @param {Integer} Property Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wcmapi/ne-wcmapi-wcm_property">WCM_PROPERTY</a></b>
     * 
     * The WCM property to set.
     * @param {Integer} dwDataSize Type: <b>DWORD</b>
     * 
     * The size of the new property value.
     * @param {Pointer<Byte>} pbData Type: <b>const BYTE*</b>
     * 
     * The new property value.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * Returns ERROR_SUCCESS if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/wcmapi/nf-wcmapi-wcmsetproperty
     * @since windows8.0
     */
    static WcmSetProperty(pInterface, strProfileName, Property, dwDataSize, pbData) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        strProfileName := strProfileName is String? StrPtr(strProfileName) : strProfileName

        result := DllCall("wcmapi.dll\WcmSetProperty", "ptr", pInterface, "ptr", strProfileName, "int", Property, "ptr", pReserved, "uint", dwDataSize, "char*", pbData, "uint")
        return result
    }

    /**
     * Retrieves a list of profiles in preferred order.
     * @param {Pointer<WCM_PROFILE_INFO_LIST>} ppProfileList Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wcmapi/ns-wcmapi-wcm_profile_info_list">PWCM_PROFILE_INFO_LIST</a>*</b>
     * 
     * The list of profiles.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * Returns ERROR_SUCCESS if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/wcmapi/nf-wcmapi-wcmgetprofilelist
     * @since windows8.0
     */
    static WcmGetProfileList(ppProfileList) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("wcmapi.dll\WcmGetProfileList", "ptr", pReserved, "ptr", ppProfileList, "uint")
        return result
    }

    /**
     * Reorders a profile list or a subset of a profile list.
     * @param {Pointer<WCM_PROFILE_INFO_LIST>} pProfileList Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wcmapi/ns-wcmapi-wcm_profile_info_list">WCM_PROFILE_INFO_LIST</a>*</b>
     * 
     * The list of profiles to be reordered, provided in the preferred order (descending from the most preferred to the least preferred).
     * @param {Integer} dwPosition Type: <b>DWORD</b>
     * 
     * Specifies the position in the list to start the reorder.
     * @param {Integer} fIgnoreUnknownProfiles Type: <b>BOOL</b>
     * 
     * True if any profiles in <i>pProfileList</i> which do not exist should be ignored; the call will proceed with the remainder of the list. False if the call should fail without modifying the profile order if any profiles in <i>pProfileList</i> do not exist.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * Returns ERROR_SUCCESS if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/wcmapi/nf-wcmapi-wcmsetprofilelist
     * @since windows8.0
     */
    static WcmSetProfileList(pProfileList, dwPosition, fIgnoreUnknownProfiles) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("wcmapi.dll\WcmSetProfileList", "ptr", pProfileList, "uint", dwPosition, "int", fIgnoreUnknownProfiles, "ptr", pReserved, "uint")
        return result
    }

    /**
     * Is used to release memory resources allocated by the WCM functions.
     * @param {Pointer<Void>} pMemory Pointer to the memory to be freed.
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmapi/nf-wcmapi-wcmfreememory
     * @since windows8.0
     */
    static WcmFreeMemory(pMemory) {
        result := DllCall("wcmapi.dll\WcmFreeMemory", "ptr", pMemory)
        return result
    }

    /**
     * The OnDemandGetRoutingHint function looks up a destination in the Route Request cache and, if a match is found, return the corresponding Interface ID.
     * @param {Pointer<Char>} destinationHostName An PWSTR describing the target host name for a network communication.
     * @param {Pointer<UInt32>} interfaceIndex The interface index of the network adapter to be used for communicating with the target host.
     * @returns {Integer} This function returns the following to indicate operation results:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A match was found in the dll cache. The <i>pdwInterfaceIndex</i> will contain the index of the interface to be used to communicate with the target host.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A match was not found in the dll cache for the specified host name.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ondemandconnroutehelper/nf-ondemandconnroutehelper-ondemandgetroutinghint
     * @since windows8.1
     */
    static OnDemandGetRoutingHint(destinationHostName, interfaceIndex) {
        destinationHostName := destinationHostName is String? StrPtr(destinationHostName) : destinationHostName

        result := DllCall("OnDemandConnRouteHelper.dll\OnDemandGetRoutingHint", "ptr", destinationHostName, "uint*", interfaceIndex, "int")
        return result
    }

    /**
     * The OnDemandRegisterNotification function allows an application to register to be notified when the Route Requests cache is modified.
     * @remarks
     * The <b>ONDEMAND_NOTIFICATION_CALLBACK</b> function is defined as:
     * 
     * 
     * ``` syntax
     * typedef void (WINAPI *ONDEMAND_NOTIFICATION_CALLBACK) (PVOID);
     * ```
     * @param {Pointer<ONDEMAND_NOTIFICATION_CALLBACK>} callback A pointer to a function of type <b>ONDEMAND_NOTIFICATION_CALLBACK</b> to receive the notifications.
     * @param {Pointer<Void>} callbackContext A pointer to a memory location containing optional context to be passed to the callback.
     * @param {Pointer<Void>} registrationHandle A pointer to a HANDLE to receive a handle to the registration in case of success.
     * @returns {Integer} Returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api/ondemandconnroutehelper/nf-ondemandconnroutehelper-ondemandregisternotification
     * @since windows8.1
     */
    static OnDemandRegisterNotification(callback, callbackContext, registrationHandle) {
        result := DllCall("OnDemandConnRouteHelper.dll\OnDemandRegisterNotification", "ptr", callback, "ptr", callbackContext, "ptr", registrationHandle, "int")
        return result
    }

    /**
     * The OnDemandUnregisterNotification function allows an application to unregister for notifications and clean up resources.
     * @param {Pointer<Void>} registrationHandle A HANDLE obtained from a successful <a href="https://docs.microsoft.com/windows/desktop/api/ondemandconnroutehelper/nf-ondemandconnroutehelper-ondemandregisternotification">OnDemandRegisterNotification</a>  call.
     * @returns {Integer} Returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api/ondemandconnroutehelper/nf-ondemandconnroutehelper-ondemandunregisternotification
     * @since windows8.1
     */
    static OnDemandUnRegisterNotification(registrationHandle) {
        result := DllCall("OnDemandConnRouteHelper.dll\OnDemandUnRegisterNotification", "ptr", registrationHandle, "int")
        return result
    }

    /**
     * This function retrieves an interface context table for the given hostname and connection profile filter.
     * @param {Pointer<Char>} HostName The destination hostname.
     * @param {Pointer<Char>} ProxyName The HTTP proxy name.
     * @param {Integer} Flags You can use the following flags.
     * 
     * <table></table>
     *  
     * 
     * <table>
     * <tr>
     * <td><b>Flag</b></td>
     * <td><b>Description</b></td>
     * </tr>
     * <tr>
     * <td><b>NET_INTERFACE_FLAG_NONE</b></td>
     * <td>Use the default behavior.</td>
     * </tr>
     * <tr>
     * <td><b>NET_INTERFACE_FLAG_CONNECT_IF_NEEDED</b></td>
     * <td>Indicates whether the underlying connection should be activated or not.</td>
     * </tr>
     * </table>
     * @param {Pointer} ConnectionProfileFilterRawData The connection profile filter blog which is a byte cast of wcm_selection_filters.
     * @param {Integer} ConnectionProfileFilterRawDataSize The size of the <i>ConnectionProfileFilterRawData</i> in bytes.
     * @param {Pointer<NET_INTERFACE_CONTEXT_TABLE>} InterfaceContextTable This is set to the list of <a href="https://docs.microsoft.com/windows/win32/api/ondemandconnroutehelper/ns-ondemandconnroutehelper-net_interface_context">NET_INTERFACE_CONTEXT</a> structures containing the interface indices and configuration names that can be used for the hostname and filter.
     * @returns {Integer} This function returns the following <b>HRESULT</b> values depending on the status.
     * 
     * <table></table>
     *  
     * 
     * <table>
     * <tr>
     * <td><b>HRESULT</b></td>
     * <td><b>Description</b></td>
     * </tr>
     * <tr>
     * <td><b>S_OK</b></td>
     * <td>
     * This is returned if a connection that satisfies the parameters and internal policies exists. <a href="https://docs.microsoft.com/windows/win32/api/ondemandconnroutehelper/ns-ondemandconnroutehelper-net_interface_context">NET_INTERFACE_CONTEXT_TABLE</a> will contain a list of interfaces indices and configuration names of those connections. When S_OK is returned, <a href="https://docs.microsoft.com/windows/desktop/api/ondemandconnroutehelper/nf-ondemandconnroutehelper-freeinterfacecontexttable">FreeInterfaceContextTable</a> should be called to release the context table.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>S_FALSE</b></td>
     * <td>
     * This is returned to indicate that any connection or default interface can be used for this hostname and filter. The <a href="https://docs.microsoft.com/windows/win32/api/ondemandconnroutehelper/ns-ondemandconnroutehelper-net_interface_context">NET_INTERFACE_CONTEXT_TABLE</a> will be null in this case because the caller can use the default route to satisfy the requirements.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>E_NOTFOUND</b></td>
     * <td>
     * This is returned if no connection is currently available or existing connection don't meet the connection filter and the internal policy for the host. The exact return code would be <b>HRESULT(ERROR_NOT_FOUND)</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>E_INVALIDARG</b></td>
     * <td>
     * This is returned if the caller passes an invalid argument, uses an unsupported flag, has a bad connection filter data, incorrect size or null <a href="https://docs.microsoft.com/windows/win32/api/ondemandconnroutehelper/ns-ondemandconnroutehelper-net_interface_context">NET_INTERFACE_CONTEXT_TABLE</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>E_OUTOFMEMORY</b></td>
     * <td>
     * This is returned if there is not enough memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>FAILED(HRESULT)</b></td>
     * <td>
     * This is returned because of failures that are outside the control of this function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ondemandconnroutehelper/nf-ondemandconnroutehelper-getinterfacecontexttableforhostname
     * @since windows10.0.10240
     */
    static GetInterfaceContextTableForHostName(HostName, ProxyName, Flags, ConnectionProfileFilterRawData, ConnectionProfileFilterRawDataSize, InterfaceContextTable) {
        HostName := HostName is String? StrPtr(HostName) : HostName
        ProxyName := ProxyName is String? StrPtr(ProxyName) : ProxyName

        result := DllCall("OnDemandConnRouteHelper.dll\GetInterfaceContextTableForHostName", "ptr", HostName, "ptr", ProxyName, "uint", Flags, "ptr", ConnectionProfileFilterRawData, "uint", ConnectionProfileFilterRawDataSize, "ptr", InterfaceContextTable, "int")
        return result
    }

    /**
     * This function frees the interface context table retrieved using the GetInterfaceContextTableForHostName function.
     * @param {Pointer<NET_INTERFACE_CONTEXT_TABLE>} InterfaceContextTable The interface context table retrieved using the <a href="https://docs.microsoft.com/windows/desktop/api/ondemandconnroutehelper/nf-ondemandconnroutehelper-getinterfacecontexttableforhostname">GetInterfaceContextTableForHostName</a> function.
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/ondemandconnroutehelper/nf-ondemandconnroutehelper-freeinterfacecontexttable
     * @since windows10.0.10240
     */
    static FreeInterfaceContextTable(InterfaceContextTable) {
        result := DllCall("OnDemandConnRouteHelper.dll\FreeInterfaceContextTable", "ptr", InterfaceContextTable)
        return result
    }

;@endregion Methods
}
