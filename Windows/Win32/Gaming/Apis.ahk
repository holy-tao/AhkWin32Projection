#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Gaming
 * @version v4.0.30319
 */
class Gaming {

;@region Constants

    /**
     * @type {String}
     */
    static ID_GDF_XML_STR => "__GDF_XML"

    /**
     * @type {String}
     */
    static ID_GDF_THUMBNAIL_STR => "__GDF_THUMBNAIL"
;@endregion Constants

;@region Methods
    /**
     * Gets the current resource state (that is, whether the app is running in Game Mode or shared mode).
     * @remarks
     * This is a Win32 API that's supported in UWP desktop and Xbox apps, as well as Win32 apps.
     * 
     * This function should be called during each iteration of the game loop to check when the app enters and exits Game Mode so that the appropriate settings can be applied.
     * 
     * The app must be in the foreground and have focus before exclusive resources are granted.
     * @param {Pointer<Int32>} hasExpandedResources True if  the app is running in Game Mode; otherwise, false.
     * @returns {Integer} The result of the operation.
     * @see https://learn.microsoft.com/windows/win32/api/expandedresources/nf-expandedresources-hasexpandedresources
     */
    static HasExpandedResources(hasExpandedResources) {
        result := DllCall("api-ms-win-gaming-expandedresources-l1-1-0.dll\HasExpandedResources", "int*", hasExpandedResources, "int")
        return result
    }

    /**
     * Gets the expected number of exclusive CPU sets that are available to the app when in Game Mode.
     * @remarks
     * This is a Win32 API that's supported in UWP desktop and Xbox apps, as well as Win32 apps.
     * 
     * You can use this function to determine what resources are available to your app, and use this information to decide whether to enter Game Mode or shared mode.
     * 
     * This function returns 0 if no exclusive CPU sets are available, or if the customer opted out of Game Mode via the Settings in Windows 10.
     * 
     * The app must be in the foreground and have focus before exclusive resources are granted.
     * @param {Pointer<UInt32>} exclusiveCpuCount The expected number of exclusive CPU sets that are available to the app when in Game Mode.
     * @returns {Integer} The result of the operation.
     * @see https://learn.microsoft.com/windows/win32/api/expandedresources/nf-expandedresources-getexpandedresourceexclusivecpucount
     */
    static GetExpandedResourceExclusiveCpuCount(exclusiveCpuCount) {
        result := DllCall("api-ms-win-gaming-expandedresources-l1-1-0.dll\GetExpandedResourceExclusiveCpuCount", "uint*", exclusiveCpuCount, "int")
        return result
    }

    /**
     * Opts out of CPU exclusivity, giving the app access to all cores, but at the cost of having to share them with other processes.
     * @remarks
     * You should call this function when you want to transition to shared mode (for example, if the app is running on a low-end device).
     * 
     * After this function is called, the app will still have access to other Game Mode resources, such as increased GPU prioritization. The app will also still get state transitions via <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/expandedresources/nf-expandedresources-hasexpandedresources">HasExpandedResources</a>.
     * 
     * As with <a href="https://docs.microsoft.com/windows/desktop/ProcThread/setprocessdefaultcpusets">SetProcessDefaultCpuSets</a>, <b>ReleaseExclusiveCpuSets</b> applies to the whole process.
     * 
     * This is a Win32 API that's only supported in UWP desktop and Xbox apps. It also requires the <b>expandedResources</b> restricted capability, which you can select by opening <b>Package.appxmanifest</b> in Visual Studio and navigating to the <b>Capabilities</b> tab. Alternatively, you can edit the file's code directly:
     * 
     * 
     * ```xml
     * 
     * <Package
     * xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"
     * IgnorableNamespaces=" rescap">
     * 	...
     * 	<Capabilities>
     * 		<rescap:Capability Name="expandedResources" />
     * 	</Capabilities>
     * 	...
     * </Package>
     * ```
     * 
     * 
     * This capability is granted on a per-title basis; contact your account manager for more information. You can publish a UWP app with this capability to the Store if it targets desktop, but if it targets Xbox it will be rejected in certification.
     * 
     * The app must be in the foreground and have focus before exclusive resources are granted.
     * @returns {Integer} The result of the operation.
     * @see https://learn.microsoft.com/windows/win32/api/expandedresources/nf-expandedresources-releaseexclusivecpusets
     */
    static ReleaseExclusiveCpuSets() {
        result := DllCall("api-ms-win-gaming-expandedresources-l1-1-0.dll\ReleaseExclusiveCpuSets", "int")
        return result
    }

    /**
     * Gets information about the device that the game is running on.
     * @remarks
     * This is a Win32 API that's supported in both Win32 and UWP apps. While it works on any device family, it's only really of value on Xbox devices.
     * 
     * This function gets information about the console that the game is running on, including the type of console (Xbox One, Xbox One S, etc.) and the vendor. On non-Xbox devices, it returns <b>GAMING_DEVICE_DEVICE_ID_NONE</b> and <b>GAMING_DEVICE_VENDOR_ID_NONE</b>.
     * 
     * If the game is running in an emulation mode, the type of device being emulated is returned. For example, if the game is running on an Xbox One X dev kit in Xbox One emulation mode, <b>GAMING_DEVICE_DEVICE_ID_XBOX_ONE</b> is returned.
     * @param {Pointer<GAMING_DEVICE_MODEL_INFORMATION>} information A structure containing information about the device that the game is running on.
     * @returns {Integer} This function does not return a value.
     * @see https://learn.microsoft.com/windows/win32/api/gamingdeviceinformation/nf-gamingdeviceinformation-getgamingdevicemodelinformation
     */
    static GetGamingDeviceModelInformation(information) {
        result := DllCall("api-ms-win-gaming-deviceinformation-l1-1-0.dll\GetGamingDeviceModelInformation", "ptr", information, "int")
        return result
    }

    /**
     * Do not use. This API is only supported for Xbox developers. (ShowGameInviteUI)
     * @param {Pointer<Void>} serviceConfigurationId Type: <b>HSTRING</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @param {Pointer<Void>} sessionTemplateName Type: <b>HSTRING</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @param {Pointer<Void>} sessionId Type: <b>HSTRING</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @param {Pointer<Void>} invitationDisplayText Type: <b>HSTRING</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @param {Pointer<GameUICompletionRoutine>} completionRoutine Type: <b>GameUICompletionRoutine</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @param {Pointer<Void>} context Type: <b>void*</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @see https://learn.microsoft.com/windows/win32/api/gamingtcui/nf-gamingtcui-showgameinviteui
     */
    static ShowGameInviteUI(serviceConfigurationId, sessionTemplateName, sessionId, invitationDisplayText, completionRoutine, context) {
        result := DllCall("api-ms-win-gaming-tcui-l1-1-0.dll\ShowGameInviteUI", "ptr", serviceConfigurationId, "ptr", sessionTemplateName, "ptr", sessionId, "ptr", invitationDisplayText, "ptr", completionRoutine, "ptr", context, "int")
        return result
    }

    /**
     * Do not use. This API is only supported for Xbox developers. (ShowPlayerPickerUI)
     * @param {Pointer<Void>} promptDisplayText Type: <b>HSTRING</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @param {Pointer<Void>} xuids Type: <b>const HSTRING*</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @param {Pointer} xuidsCount Type: <b>size_t</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @param {Pointer<Void>} preSelectedXuids Type: <b>const HSTRING*</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @param {Pointer} preSelectedXuidsCount Type: <b>size_t</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @param {Pointer} minSelectionCount Type: <b>size_t</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @param {Pointer} maxSelectionCount Type: <b>size_t</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @param {Pointer<PlayerPickerUICompletionRoutine>} completionRoutine Type: <b>PlayerPickerUICompletionRoutine</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @param {Pointer<Void>} context Type: <b>void*</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @see https://learn.microsoft.com/windows/win32/api/gamingtcui/nf-gamingtcui-showplayerpickerui
     */
    static ShowPlayerPickerUI(promptDisplayText, xuids, xuidsCount, preSelectedXuids, preSelectedXuidsCount, minSelectionCount, maxSelectionCount, completionRoutine, context) {
        result := DllCall("api-ms-win-gaming-tcui-l1-1-0.dll\ShowPlayerPickerUI", "ptr", promptDisplayText, "ptr", xuids, "ptr", xuidsCount, "ptr", preSelectedXuids, "ptr", preSelectedXuidsCount, "ptr", minSelectionCount, "ptr", maxSelectionCount, "ptr", completionRoutine, "ptr", context, "int")
        return result
    }

    /**
     * Do not use. This API is only supported for Xbox developers. (ShowProfileCardUI)
     * @param {Pointer<Void>} targetUserXuid Type: <b>HSTRING</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @param {Pointer<GameUICompletionRoutine>} completionRoutine Type: <b>GameUICompletionRoutine</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @param {Pointer<Void>} context Type: <b>void*</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @see https://learn.microsoft.com/windows/win32/api/gamingtcui/nf-gamingtcui-showprofilecardui
     */
    static ShowProfileCardUI(targetUserXuid, completionRoutine, context) {
        result := DllCall("api-ms-win-gaming-tcui-l1-1-0.dll\ShowProfileCardUI", "ptr", targetUserXuid, "ptr", completionRoutine, "ptr", context, "int")
        return result
    }

    /**
     * Do not use. This API is only supported for Xbox developers. (ShowChangeFriendRelationshipUI)
     * @param {Pointer<Void>} targetUserXuid Type: <b>HSTRING</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @param {Pointer<GameUICompletionRoutine>} completionRoutine Type: <b>GameUICompletionRoutine</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @param {Pointer<Void>} context Type: <b>void*</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @see https://learn.microsoft.com/windows/win32/api/gamingtcui/nf-gamingtcui-showchangefriendrelationshipui
     */
    static ShowChangeFriendRelationshipUI(targetUserXuid, completionRoutine, context) {
        result := DllCall("api-ms-win-gaming-tcui-l1-1-0.dll\ShowChangeFriendRelationshipUI", "ptr", targetUserXuid, "ptr", completionRoutine, "ptr", context, "int")
        return result
    }

    /**
     * Do not use. This API is only supported for Xbox developers. (ShowTitleAchievementsUI)
     * @param {Integer} titleId Type: <b>UINT32</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @param {Pointer<GameUICompletionRoutine>} completionRoutine Type: <b>GameUICompletionRoutine</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @param {Pointer<Void>} context Type: <b>void*</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @see https://learn.microsoft.com/windows/win32/api/gamingtcui/nf-gamingtcui-showtitleachievementsui
     */
    static ShowTitleAchievementsUI(titleId, completionRoutine, context) {
        result := DllCall("api-ms-win-gaming-tcui-l1-1-0.dll\ShowTitleAchievementsUI", "uint", titleId, "ptr", completionRoutine, "ptr", context, "int")
        return result
    }

    /**
     * Do not use. This API is only supported for Xbox developers. (ProcessPendingGameUI)
     * @param {Integer} waitForCompletion Type: <b>BOOL</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @see https://learn.microsoft.com/windows/win32/api/gamingtcui/nf-gamingtcui-processpendinggameui
     */
    static ProcessPendingGameUI(waitForCompletion) {
        result := DllCall("api-ms-win-gaming-tcui-l1-1-0.dll\ProcessPendingGameUI", "int", waitForCompletion, "int")
        return result
    }

    /**
     * Do not use. This API is only supported for Xbox developers. (TryCancelPendingGameUI)
     * @returns {Integer} Type: <b>BOOL</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @see https://learn.microsoft.com/windows/win32/api/gamingtcui/nf-gamingtcui-trycancelpendinggameui
     */
    static TryCancelPendingGameUI() {
        result := DllCall("api-ms-win-gaming-tcui-l1-1-0.dll\TryCancelPendingGameUI", "int")
        return result
    }

    /**
     * Do not use. This API is only supported for Xbox developers. (CheckGamingPrivilegeWithUI)
     * @param {Integer} privilegeId Type: <b>UINT32</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @param {Pointer<Void>} scope Type: <b>HSTRING</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @param {Pointer<Void>} policy Type: <b>HSTRING</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @param {Pointer<Void>} friendlyMessage Type: <b>HSTRING</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @param {Pointer<GameUICompletionRoutine>} completionRoutine Type: <b>GameUICompletionRoutine</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @param {Pointer<Void>} context Type: <b>void*</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @see https://learn.microsoft.com/windows/win32/api/gamingtcui/nf-gamingtcui-checkgamingprivilegewithui
     */
    static CheckGamingPrivilegeWithUI(privilegeId, scope, policy, friendlyMessage, completionRoutine, context) {
        result := DllCall("api-ms-win-gaming-tcui-l1-1-1.dll\CheckGamingPrivilegeWithUI", "uint", privilegeId, "ptr", scope, "ptr", policy, "ptr", friendlyMessage, "ptr", completionRoutine, "ptr", context, "int")
        return result
    }

    /**
     * 
     * @param {Integer} privilegeId 
     * @param {Pointer<Void>} scope 
     * @param {Pointer<Void>} policy 
     * @param {Pointer<Int32>} hasPrivilege 
     * @returns {Integer} 
     */
    static CheckGamingPrivilegeSilently(privilegeId, scope, policy, hasPrivilege) {
        result := DllCall("api-ms-win-gaming-tcui-l1-1-1.dll\CheckGamingPrivilegeSilently", "uint", privilegeId, "ptr", scope, "ptr", policy, "int*", hasPrivilege, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IInspectable>} user 
     * @param {Pointer<Void>} serviceConfigurationId 
     * @param {Pointer<Void>} sessionTemplateName 
     * @param {Pointer<Void>} sessionId 
     * @param {Pointer<Void>} invitationDisplayText 
     * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
     * @param {Pointer<Void>} context 
     * @returns {Integer} 
     */
    static ShowGameInviteUIForUser(user, serviceConfigurationId, sessionTemplateName, sessionId, invitationDisplayText, completionRoutine, context) {
        result := DllCall("api-ms-win-gaming-tcui-l1-1-2.dll\ShowGameInviteUIForUser", "ptr", user, "ptr", serviceConfigurationId, "ptr", sessionTemplateName, "ptr", sessionId, "ptr", invitationDisplayText, "ptr", completionRoutine, "ptr", context, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IInspectable>} user 
     * @param {Pointer<Void>} promptDisplayText 
     * @param {Pointer<Void>} xuids 
     * @param {Pointer} xuidsCount 
     * @param {Pointer<Void>} preSelectedXuids 
     * @param {Pointer} preSelectedXuidsCount 
     * @param {Pointer} minSelectionCount 
     * @param {Pointer} maxSelectionCount 
     * @param {Pointer<PlayerPickerUICompletionRoutine>} completionRoutine 
     * @param {Pointer<Void>} context 
     * @returns {Integer} 
     */
    static ShowPlayerPickerUIForUser(user, promptDisplayText, xuids, xuidsCount, preSelectedXuids, preSelectedXuidsCount, minSelectionCount, maxSelectionCount, completionRoutine, context) {
        result := DllCall("api-ms-win-gaming-tcui-l1-1-2.dll\ShowPlayerPickerUIForUser", "ptr", user, "ptr", promptDisplayText, "ptr", xuids, "ptr", xuidsCount, "ptr", preSelectedXuids, "ptr", preSelectedXuidsCount, "ptr", minSelectionCount, "ptr", maxSelectionCount, "ptr", completionRoutine, "ptr", context, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IInspectable>} user 
     * @param {Pointer<Void>} targetUserXuid 
     * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
     * @param {Pointer<Void>} context 
     * @returns {Integer} 
     */
    static ShowProfileCardUIForUser(user, targetUserXuid, completionRoutine, context) {
        result := DllCall("api-ms-win-gaming-tcui-l1-1-2.dll\ShowProfileCardUIForUser", "ptr", user, "ptr", targetUserXuid, "ptr", completionRoutine, "ptr", context, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IInspectable>} user 
     * @param {Pointer<Void>} targetUserXuid 
     * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
     * @param {Pointer<Void>} context 
     * @returns {Integer} 
     */
    static ShowChangeFriendRelationshipUIForUser(user, targetUserXuid, completionRoutine, context) {
        result := DllCall("api-ms-win-gaming-tcui-l1-1-2.dll\ShowChangeFriendRelationshipUIForUser", "ptr", user, "ptr", targetUserXuid, "ptr", completionRoutine, "ptr", context, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IInspectable>} user 
     * @param {Integer} titleId 
     * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
     * @param {Pointer<Void>} context 
     * @returns {Integer} 
     */
    static ShowTitleAchievementsUIForUser(user, titleId, completionRoutine, context) {
        result := DllCall("api-ms-win-gaming-tcui-l1-1-2.dll\ShowTitleAchievementsUIForUser", "ptr", user, "uint", titleId, "ptr", completionRoutine, "ptr", context, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IInspectable>} user 
     * @param {Integer} privilegeId 
     * @param {Pointer<Void>} scope 
     * @param {Pointer<Void>} policy 
     * @param {Pointer<Void>} friendlyMessage 
     * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
     * @param {Pointer<Void>} context 
     * @returns {Integer} 
     */
    static CheckGamingPrivilegeWithUIForUser(user, privilegeId, scope, policy, friendlyMessage, completionRoutine, context) {
        result := DllCall("api-ms-win-gaming-tcui-l1-1-2.dll\CheckGamingPrivilegeWithUIForUser", "ptr", user, "uint", privilegeId, "ptr", scope, "ptr", policy, "ptr", friendlyMessage, "ptr", completionRoutine, "ptr", context, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IInspectable>} user 
     * @param {Integer} privilegeId 
     * @param {Pointer<Void>} scope 
     * @param {Pointer<Void>} policy 
     * @param {Pointer<Int32>} hasPrivilege 
     * @returns {Integer} 
     */
    static CheckGamingPrivilegeSilentlyForUser(user, privilegeId, scope, policy, hasPrivilege) {
        result := DllCall("api-ms-win-gaming-tcui-l1-1-2.dll\CheckGamingPrivilegeSilentlyForUser", "ptr", user, "uint", privilegeId, "ptr", scope, "ptr", policy, "int*", hasPrivilege, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} serviceConfigurationId 
     * @param {Pointer<Void>} sessionTemplateName 
     * @param {Pointer<Void>} sessionId 
     * @param {Pointer<Void>} invitationDisplayText 
     * @param {Pointer<Void>} customActivationContext 
     * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
     * @param {Pointer<Void>} context 
     * @returns {Integer} 
     */
    static ShowGameInviteUIWithContext(serviceConfigurationId, sessionTemplateName, sessionId, invitationDisplayText, customActivationContext, completionRoutine, context) {
        result := DllCall("api-ms-win-gaming-tcui-l1-1-3.dll\ShowGameInviteUIWithContext", "ptr", serviceConfigurationId, "ptr", sessionTemplateName, "ptr", sessionId, "ptr", invitationDisplayText, "ptr", customActivationContext, "ptr", completionRoutine, "ptr", context, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IInspectable>} user 
     * @param {Pointer<Void>} serviceConfigurationId 
     * @param {Pointer<Void>} sessionTemplateName 
     * @param {Pointer<Void>} sessionId 
     * @param {Pointer<Void>} invitationDisplayText 
     * @param {Pointer<Void>} customActivationContext 
     * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
     * @param {Pointer<Void>} context 
     * @returns {Integer} 
     */
    static ShowGameInviteUIWithContextForUser(user, serviceConfigurationId, sessionTemplateName, sessionId, invitationDisplayText, customActivationContext, completionRoutine, context) {
        result := DllCall("api-ms-win-gaming-tcui-l1-1-3.dll\ShowGameInviteUIWithContextForUser", "ptr", user, "ptr", serviceConfigurationId, "ptr", sessionTemplateName, "ptr", sessionId, "ptr", invitationDisplayText, "ptr", customActivationContext, "ptr", completionRoutine, "ptr", context, "int")
        return result
    }

    /**
     * 
     * @param {Integer} titleId 
     * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
     * @param {Pointer<Void>} context 
     * @returns {Integer} 
     */
    static ShowGameInfoUI(titleId, completionRoutine, context) {
        result := DllCall("api-ms-win-gaming-tcui-l1-1-4.dll\ShowGameInfoUI", "uint", titleId, "ptr", completionRoutine, "ptr", context, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IInspectable>} user 
     * @param {Integer} titleId 
     * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
     * @param {Pointer<Void>} context 
     * @returns {Integer} 
     */
    static ShowGameInfoUIForUser(user, titleId, completionRoutine, context) {
        result := DllCall("api-ms-win-gaming-tcui-l1-1-4.dll\ShowGameInfoUIForUser", "ptr", user, "uint", titleId, "ptr", completionRoutine, "ptr", context, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
     * @param {Pointer<Void>} context 
     * @returns {Integer} 
     */
    static ShowFindFriendsUI(completionRoutine, context) {
        result := DllCall("api-ms-win-gaming-tcui-l1-1-4.dll\ShowFindFriendsUI", "ptr", completionRoutine, "ptr", context, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IInspectable>} user 
     * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
     * @param {Pointer<Void>} context 
     * @returns {Integer} 
     */
    static ShowFindFriendsUIForUser(user, completionRoutine, context) {
        result := DllCall("api-ms-win-gaming-tcui-l1-1-4.dll\ShowFindFriendsUIForUser", "ptr", user, "ptr", completionRoutine, "ptr", context, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
     * @param {Pointer<Void>} context 
     * @returns {Integer} 
     */
    static ShowCustomizeUserProfileUI(completionRoutine, context) {
        result := DllCall("api-ms-win-gaming-tcui-l1-1-4.dll\ShowCustomizeUserProfileUI", "ptr", completionRoutine, "ptr", context, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IInspectable>} user 
     * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
     * @param {Pointer<Void>} context 
     * @returns {Integer} 
     */
    static ShowCustomizeUserProfileUIForUser(user, completionRoutine, context) {
        result := DllCall("api-ms-win-gaming-tcui-l1-1-4.dll\ShowCustomizeUserProfileUIForUser", "ptr", user, "ptr", completionRoutine, "ptr", context, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
     * @param {Pointer<Void>} context 
     * @returns {Integer} 
     */
    static ShowUserSettingsUI(completionRoutine, context) {
        result := DllCall("api-ms-win-gaming-tcui-l1-1-4.dll\ShowUserSettingsUI", "ptr", completionRoutine, "ptr", context, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IInspectable>} user 
     * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
     * @param {Pointer<Void>} context 
     * @returns {Integer} 
     */
    static ShowUserSettingsUIForUser(user, completionRoutine, context) {
        result := DllCall("api-ms-win-gaming-tcui-l1-1-4.dll\ShowUserSettingsUIForUser", "ptr", user, "ptr", completionRoutine, "ptr", context, "int")
        return result
    }

;@endregion Methods
}
