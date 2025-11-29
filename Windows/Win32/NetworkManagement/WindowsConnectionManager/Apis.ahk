#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\Foundation\HANDLE.ahk

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
     * @param {Pointer<Guid>} pInterface Type: <b>const GUID*</b>
     * 
     * The interface to query. For global properties, this parameter is NULL.
     * @param {PWSTR} strProfileName Type: <b>LPCWSTR</b>
     * 
     * The name of the profile. If querying a non-global property (<b>connection_cost</b>, <b>dataplan_status</b>, or <b>hotspot_profile</b>), the profile must be specified or the call will fail.
     * @param {Integer} Property Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wcmapi/ne-wcmapi-wcm_property">WCM_PROPERTY</a></b>
     * 
     * The WCM property to query.
     * @param {Pointer<Integer>} pdwDataSize Type: <b>PDWORD</b>
     * 
     * The size of the returned property value.
     * @param {Pointer<Pointer<Integer>>} ppData Type: <b>PBYTE*</b>
     * 
     * The returned property value.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * Returns ERROR_SUCCESS if successful, or an error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//wcmapi/nf-wcmapi-wcmqueryproperty
     * @since windows8.0
     */
    static WcmQueryProperty(pInterface, strProfileName, Property, pdwDataSize, ppData) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        strProfileName := strProfileName is String ? StrPtr(strProfileName) : strProfileName

        pdwDataSizeMarshal := pdwDataSize is VarRef ? "uint*" : "ptr"
        ppDataMarshal := ppData is VarRef ? "ptr*" : "ptr"

        result := DllCall("wcmapi.dll\WcmQueryProperty", "ptr", pInterface, "ptr", strProfileName, "int", Property, "ptr", pReserved, pdwDataSizeMarshal, pdwDataSize, ppDataMarshal, ppData, "uint")
        return result
    }

    /**
     * Sets the value of a WCM property.
     * @param {Pointer<Guid>} pInterface Type: <b>const GUID*</b>
     * 
     * The interface to set. For global properties, this parameter is NULL.
     * @param {PWSTR} strProfileName Type: <b>LPCWSTR</b>
     * 
     * The profile name.
     * @param {Integer} Property Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wcmapi/ne-wcmapi-wcm_property">WCM_PROPERTY</a></b>
     * 
     * The WCM property to set.
     * @param {Integer} dwDataSize Type: <b>DWORD</b>
     * 
     * The size of the new property value.
     * @param {Pointer<Integer>} pbData Type: <b>const BYTE*</b>
     * 
     * The new property value.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * Returns ERROR_SUCCESS if successful, or an error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//wcmapi/nf-wcmapi-wcmsetproperty
     * @since windows8.0
     */
    static WcmSetProperty(pInterface, strProfileName, Property, dwDataSize, pbData) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        strProfileName := strProfileName is String ? StrPtr(strProfileName) : strProfileName

        pbDataMarshal := pbData is VarRef ? "char*" : "ptr"

        result := DllCall("wcmapi.dll\WcmSetProperty", "ptr", pInterface, "ptr", strProfileName, "int", Property, "ptr", pReserved, "uint", dwDataSize, pbDataMarshal, pbData, "uint")
        return result
    }

    /**
     * Retrieves a list of profiles in preferred order.
     * @param {Pointer<Pointer<WCM_PROFILE_INFO_LIST>>} ppProfileList Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wcmapi/ns-wcmapi-wcm_profile_info_list">PWCM_PROFILE_INFO_LIST</a>*</b>
     * 
     * The list of profiles.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * Returns ERROR_SUCCESS if successful, or an error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//wcmapi/nf-wcmapi-wcmgetprofilelist
     * @since windows8.0
     */
    static WcmGetProfileList(ppProfileList) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        ppProfileListMarshal := ppProfileList is VarRef ? "ptr*" : "ptr"

        result := DllCall("wcmapi.dll\WcmGetProfileList", "ptr", pReserved, ppProfileListMarshal, ppProfileList, "uint")
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
     * @param {BOOL} fIgnoreUnknownProfiles Type: <b>BOOL</b>
     * 
     * True if any profiles in <i>pProfileList</i> which do not exist should be ignored; the call will proceed with the remainder of the list. False if the call should fail without modifying the profile order if any profiles in <i>pProfileList</i> do not exist.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * Returns ERROR_SUCCESS if successful, or an error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//wcmapi/nf-wcmapi-wcmsetprofilelist
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
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wcmapi/nf-wcmapi-wcmfreememory
     * @since windows8.0
     */
    static WcmFreeMemory(pMemory) {
        pMemoryMarshal := pMemory is VarRef ? "ptr" : "ptr"

        DllCall("wcmapi.dll\WcmFreeMemory", pMemoryMarshal, pMemory)
    }

    /**
     * The OnDemandGetRoutingHint function looks up a destination in the Route Request cache and, if a match is found, return the corresponding Interface ID.
     * @param {PWSTR} destinationHostName An PWSTR describing the target host name for a network communication.
     * @returns {Integer} The interface index of the network adapter to be used for communicating with the target host.
     * @see https://docs.microsoft.com/windows/win32/api//ondemandconnroutehelper/nf-ondemandconnroutehelper-ondemandgetroutinghint
     * @since windows8.1
     */
    static OnDemandGetRoutingHint(destinationHostName) {
        destinationHostName := destinationHostName is String ? StrPtr(destinationHostName) : destinationHostName

        result := DllCall("OnDemandConnRouteHelper.dll\OnDemandGetRoutingHint", "ptr", destinationHostName, "uint*", &interfaceIndex := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return interfaceIndex
    }

    /**
     * The OnDemandRegisterNotification function allows an application to register to be notified when the Route Requests cache is modified.
     * @param {Pointer<ONDEMAND_NOTIFICATION_CALLBACK>} callback A pointer to a function of type O<b>ONDEMAND_NOTIFICATION_CALLBACK</b> to receive the notifications.
     * @param {Pointer<Void>} callbackContext A pointer to a memory location containing optional context to be passed to the callback.
     * @returns {HANDLE} A pointer to a HANDLE to receive a handle to the registration in case of success.
     * @see https://docs.microsoft.com/windows/win32/api//ondemandconnroutehelper/nf-ondemandconnroutehelper-ondemandregisternotification
     * @since windows8.1
     */
    static OnDemandRegisterNotification(callback, callbackContext) {
        callbackContextMarshal := callbackContext is VarRef ? "ptr" : "ptr"

        registrationHandle := HANDLE()
        result := DllCall("OnDemandConnRouteHelper.dll\OnDemandRegisterNotification", "ptr", callback, callbackContextMarshal, callbackContext, "ptr", registrationHandle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return registrationHandle
    }

    /**
     * 
     * @param {HANDLE} registrationHandle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ondemandconnroutehelper/nf-ondemandconnroutehelper-ondemandunregisternotification
     * @since windows8.1
     */
    static OnDemandUnRegisterNotification(registrationHandle) {
        registrationHandle := registrationHandle is Win32Handle ? NumGet(registrationHandle, "ptr") : registrationHandle

        result := DllCall("OnDemandConnRouteHelper.dll\OnDemandUnRegisterNotification", "ptr", registrationHandle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * This function retrieves an interface context table for the given hostname and connection profile filter.
     * @param {PWSTR} HostName The destination hostname.
     * @param {PWSTR} ProxyName The HTTP proxy name.
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
     * @returns {Pointer<NET_INTERFACE_CONTEXT_TABLE>} This is set to the list of <a href="https://docs.microsoft.com/windows/win32/api/ondemandconnroutehelper/ns-ondemandconnroutehelper-net_interface_context">NET_INTERFACE_CONTEXT</a> structures containing the interface indices and configuration names that can be used for the hostname and filter.
     * @see https://docs.microsoft.com/windows/win32/api//ondemandconnroutehelper/nf-ondemandconnroutehelper-getinterfacecontexttableforhostname
     * @since windows10.0.10240
     */
    static GetInterfaceContextTableForHostName(HostName, ProxyName, Flags, ConnectionProfileFilterRawData, ConnectionProfileFilterRawDataSize) {
        HostName := HostName is String ? StrPtr(HostName) : HostName
        ProxyName := ProxyName is String ? StrPtr(ProxyName) : ProxyName

        result := DllCall("OnDemandConnRouteHelper.dll\GetInterfaceContextTableForHostName", "ptr", HostName, "ptr", ProxyName, "uint", Flags, "ptr", ConnectionProfileFilterRawData, "uint", ConnectionProfileFilterRawDataSize, "ptr*", &InterfaceContextTable := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InterfaceContextTable
    }

    /**
     * This function frees the interface context table retrieved using the GetInterfaceContextTableForHostName function.
     * @param {Pointer<NET_INTERFACE_CONTEXT_TABLE>} InterfaceContextTable The interface context table retrieved using the <a href="https://docs.microsoft.com/windows/desktop/api/ondemandconnroutehelper/nf-ondemandconnroutehelper-getinterfacecontexttableforhostname">GetInterfaceContextTableForHostName</a> function.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//ondemandconnroutehelper/nf-ondemandconnroutehelper-freeinterfacecontexttable
     * @since windows10.0.10240
     */
    static FreeInterfaceContextTable(InterfaceContextTable) {
        DllCall("OnDemandConnRouteHelper.dll\FreeInterfaceContextTable", "ptr", InterfaceContextTable)
    }

;@endregion Methods
}
