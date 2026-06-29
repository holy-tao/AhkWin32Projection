#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\GAMING_DEVICE_MODEL_INFORMATION.ahk" { GAMING_DEVICE_MODEL_INFORMATION }
#Import "..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\System\WinRT\IInspectable.ahk" { IInspectable }
#Import "..\System\WinRT\HSTRING.ahk" { HSTRING }
#Import "..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Gaming
 */

;@region Functions
/**
 * Gets the current resource state (that is, whether the app is running in Game Mode or shared mode).
 * @remarks
 * This is a Win32 API that's supported in UWP desktop and Xbox apps, as well as Win32 apps.
 * 
 * This function should be called during each iteration of the game loop to check when the app enters and exits Game Mode so that the appropriate settings can be applied.
 * 
 * The app must be in the foreground and have focus before exclusive resources are granted.
 * @returns {BOOL} True if  the app is running in Game Mode; otherwise, false.
 * @see https://learn.microsoft.com/windows/win32/api/expandedresources/nf-expandedresources-hasexpandedresources
 */
export HasExpandedResources() {
    result := DllCall("api-ms-win-gaming-expandedresources-l1-1-0.dll\HasExpandedResources", BOOL.Ptr, &hasExpandedResources := 0, "HRESULT")
    return hasExpandedResources
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
 * @returns {Integer} The expected number of exclusive CPU sets that are available to the app when in Game Mode.
 * @see https://learn.microsoft.com/windows/win32/api/expandedresources/nf-expandedresources-getexpandedresourceexclusivecpucount
 */
export GetExpandedResourceExclusiveCpuCount() {
    result := DllCall("api-ms-win-gaming-expandedresources-l1-1-0.dll\GetExpandedResourceExclusiveCpuCount", "uint*", &exclusiveCpuCount := 0, "HRESULT")
    return exclusiveCpuCount
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
 * @returns {HRESULT} The result of the operation.
 * @see https://learn.microsoft.com/windows/win32/api/expandedresources/nf-expandedresources-releaseexclusivecpusets
 */
export ReleaseExclusiveCpuSets() {
    result := DllCall("api-ms-win-gaming-expandedresources-l1-1-0.dll\ReleaseExclusiveCpuSets", "HRESULT")
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
 * @returns {HRESULT} This function does not return a value.
 * @see https://learn.microsoft.com/windows/win32/api/gamingdeviceinformation/nf-gamingdeviceinformation-getgamingdevicemodelinformation
 */
export GetGamingDeviceModelInformation(information) {
    result := DllCall("api-ms-win-gaming-deviceinformation-l1-1-0.dll\GetGamingDeviceModelInformation", GAMING_DEVICE_MODEL_INFORMATION.Ptr, information, "HRESULT")
    return result
}

/**
 * Do not use. This API is only supported for Xbox developers. (ShowGameInviteUI)
 * @param {HSTRING} serviceConfigurationId Type: <b>HSTRING</b>
 * 
 * Do not use. This API is only supported for Xbox developers.
 * @param {HSTRING} sessionTemplateName Type: <b>HSTRING</b>
 * 
 * Do not use. This API is only supported for Xbox developers.
 * @param {HSTRING} sessionId Type: <b>HSTRING</b>
 * 
 * Do not use. This API is only supported for Xbox developers.
 * @param {HSTRING} invitationDisplayText Type: <b>HSTRING</b>
 * 
 * Do not use. This API is only supported for Xbox developers.
 * @param {Pointer<GameUICompletionRoutine>} completionRoutine Type: <b>GameUICompletionRoutine</b>
 * 
 * Do not use. This API is only supported for Xbox developers.
 * @param {Pointer<Void>} _context Type: <b>void*</b>
 * 
 * Do not use. This API is only supported for Xbox developers.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
 * 
 * Do not use. This API is only supported for Xbox developers.
 * @see https://learn.microsoft.com/windows/win32/api/gamingtcui/nf-gamingtcui-showgameinviteui
 */
export ShowGameInviteUI(serviceConfigurationId, sessionTemplateName, sessionId, invitationDisplayText, completionRoutine, _context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("api-ms-win-gaming-tcui-l1-1-0.dll\ShowGameInviteUI", HSTRING, serviceConfigurationId, HSTRING, sessionTemplateName, HSTRING, sessionId, HSTRING, invitationDisplayText, "ptr", completionRoutine, _contextMarshal, _context, "HRESULT")
    return result
}

/**
 * Do not use. This API is only supported for Xbox developers. (ShowPlayerPickerUI)
 * @param {HSTRING} promptDisplayText Type: <b>HSTRING</b>
 * 
 * Do not use. This API is only supported for Xbox developers.
 * @param {Pointer<HSTRING>} xuids Type: <b>const HSTRING*</b>
 * 
 * Do not use. This API is only supported for Xbox developers.
 * @param {Pointer} xuidsCount Type: <b>size_t</b>
 * 
 * Do not use. This API is only supported for Xbox developers.
 * @param {Pointer<HSTRING>} preSelectedXuids Type: <b>const HSTRING*</b>
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
 * @param {Pointer<Void>} _context Type: <b>void*</b>
 * 
 * Do not use. This API is only supported for Xbox developers.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
 * 
 * Do not use. This API is only supported for Xbox developers.
 * @see https://learn.microsoft.com/windows/win32/api/gamingtcui/nf-gamingtcui-showplayerpickerui
 */
export ShowPlayerPickerUI(promptDisplayText, xuids, xuidsCount, preSelectedXuids, preSelectedXuidsCount, minSelectionCount, maxSelectionCount, completionRoutine, _context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("api-ms-win-gaming-tcui-l1-1-0.dll\ShowPlayerPickerUI", HSTRING, promptDisplayText, HSTRING.Ptr, xuids, "ptr", xuidsCount, HSTRING.Ptr, preSelectedXuids, "ptr", preSelectedXuidsCount, "ptr", minSelectionCount, "ptr", maxSelectionCount, "ptr", completionRoutine, _contextMarshal, _context, "HRESULT")
    return result
}

/**
 * Do not use. This API is only supported for Xbox developers. (ShowProfileCardUI)
 * @param {HSTRING} targetUserXuid Type: <b>HSTRING</b>
 * 
 * Do not use. This API is only supported for Xbox developers.
 * @param {Pointer<GameUICompletionRoutine>} completionRoutine Type: <b>GameUICompletionRoutine</b>
 * 
 * Do not use. This API is only supported for Xbox developers.
 * @param {Pointer<Void>} _context Type: <b>void*</b>
 * 
 * Do not use. This API is only supported for Xbox developers.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
 * 
 * Do not use. This API is only supported for Xbox developers.
 * @see https://learn.microsoft.com/windows/win32/api/gamingtcui/nf-gamingtcui-showprofilecardui
 */
export ShowProfileCardUI(targetUserXuid, completionRoutine, _context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("api-ms-win-gaming-tcui-l1-1-0.dll\ShowProfileCardUI", HSTRING, targetUserXuid, "ptr", completionRoutine, _contextMarshal, _context, "HRESULT")
    return result
}

/**
 * Do not use. This API is only supported for Xbox developers. (ShowChangeFriendRelationshipUI)
 * @param {HSTRING} targetUserXuid Type: <b>HSTRING</b>
 * 
 * Do not use. This API is only supported for Xbox developers.
 * @param {Pointer<GameUICompletionRoutine>} completionRoutine Type: <b>GameUICompletionRoutine</b>
 * 
 * Do not use. This API is only supported for Xbox developers.
 * @param {Pointer<Void>} _context Type: <b>void*</b>
 * 
 * Do not use. This API is only supported for Xbox developers.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
 * 
 * Do not use. This API is only supported for Xbox developers.
 * @see https://learn.microsoft.com/windows/win32/api/gamingtcui/nf-gamingtcui-showchangefriendrelationshipui
 */
export ShowChangeFriendRelationshipUI(targetUserXuid, completionRoutine, _context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("api-ms-win-gaming-tcui-l1-1-0.dll\ShowChangeFriendRelationshipUI", HSTRING, targetUserXuid, "ptr", completionRoutine, _contextMarshal, _context, "HRESULT")
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
 * @param {Pointer<Void>} _context Type: <b>void*</b>
 * 
 * Do not use. This API is only supported for Xbox developers.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
 * 
 * Do not use. This API is only supported for Xbox developers.
 * @see https://learn.microsoft.com/windows/win32/api/gamingtcui/nf-gamingtcui-showtitleachievementsui
 */
export ShowTitleAchievementsUI(titleId, completionRoutine, _context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("api-ms-win-gaming-tcui-l1-1-0.dll\ShowTitleAchievementsUI", "uint", titleId, "ptr", completionRoutine, _contextMarshal, _context, "HRESULT")
    return result
}

/**
 * Do not use. This API is only supported for Xbox developers. (ProcessPendingGameUI)
 * @param {BOOL} waitForCompletion Type: <b>BOOL</b>
 * 
 * Do not use. This API is only supported for Xbox developers.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
 * 
 * Do not use. This API is only supported for Xbox developers.
 * @see https://learn.microsoft.com/windows/win32/api/gamingtcui/nf-gamingtcui-processpendinggameui
 */
export ProcessPendingGameUI(waitForCompletion) {
    result := DllCall("api-ms-win-gaming-tcui-l1-1-0.dll\ProcessPendingGameUI", BOOL, waitForCompletion, "HRESULT")
    return result
}

/**
 * Do not use. This API is only supported for Xbox developers. (TryCancelPendingGameUI)
 * @returns {BOOL} Type: <b>BOOL</b>
 * 
 * Do not use. This API is only supported for Xbox developers.
 * @see https://learn.microsoft.com/windows/win32/api/gamingtcui/nf-gamingtcui-trycancelpendinggameui
 */
export TryCancelPendingGameUI() {
    result := DllCall("api-ms-win-gaming-tcui-l1-1-0.dll\TryCancelPendingGameUI", BOOL)
    return result
}

/**
 * Do not use. This API is only supported for Xbox developers. (CheckGamingPrivilegeWithUI)
 * @param {Integer} privilegeId Type: <b>UINT32</b>
 * 
 * Do not use. This API is only supported for Xbox developers.
 * @param {HSTRING} scope Type: <b>HSTRING</b>
 * 
 * Do not use. This API is only supported for Xbox developers.
 * @param {HSTRING} policy Type: <b>HSTRING</b>
 * 
 * Do not use. This API is only supported for Xbox developers.
 * @param {HSTRING} friendlyMessage Type: <b>HSTRING</b>
 * 
 * Do not use. This API is only supported for Xbox developers.
 * @param {Pointer<GameUICompletionRoutine>} completionRoutine Type: <b>GameUICompletionRoutine</b>
 * 
 * Do not use. This API is only supported for Xbox developers.
 * @param {Pointer<Void>} _context Type: <b>void*</b>
 * 
 * Do not use. This API is only supported for Xbox developers.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
 * 
 * Do not use. This API is only supported for Xbox developers.
 * @see https://learn.microsoft.com/windows/win32/api/gamingtcui/nf-gamingtcui-checkgamingprivilegewithui
 */
export CheckGamingPrivilegeWithUI(privilegeId, scope, policy, friendlyMessage, completionRoutine, _context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("api-ms-win-gaming-tcui-l1-1-1.dll\CheckGamingPrivilegeWithUI", "uint", privilegeId, HSTRING, scope, HSTRING, policy, HSTRING, friendlyMessage, "ptr", completionRoutine, _contextMarshal, _context, "HRESULT")
    return result
}

/**
 * 
 * @param {Integer} privilegeId 
 * @param {HSTRING} scope 
 * @param {HSTRING} policy 
 * @returns {BOOL} 
 */
export CheckGamingPrivilegeSilently(privilegeId, scope, policy) {
    result := DllCall("api-ms-win-gaming-tcui-l1-1-1.dll\CheckGamingPrivilegeSilently", "uint", privilegeId, HSTRING, scope, HSTRING, policy, BOOL.Ptr, &hasPrivilege := 0, "HRESULT")
    return hasPrivilege
}

/**
 * 
 * @param {IInspectable} user 
 * @param {HSTRING} serviceConfigurationId 
 * @param {HSTRING} sessionTemplateName 
 * @param {HSTRING} sessionId 
 * @param {HSTRING} invitationDisplayText 
 * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
 * @param {Pointer<Void>} _context 
 * @returns {HRESULT} 
 */
export ShowGameInviteUIForUser(user, serviceConfigurationId, sessionTemplateName, sessionId, invitationDisplayText, completionRoutine, _context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("api-ms-win-gaming-tcui-l1-1-2.dll\ShowGameInviteUIForUser", "ptr", user, HSTRING, serviceConfigurationId, HSTRING, sessionTemplateName, HSTRING, sessionId, HSTRING, invitationDisplayText, "ptr", completionRoutine, _contextMarshal, _context, "HRESULT")
    return result
}

/**
 * 
 * @param {IInspectable} user 
 * @param {HSTRING} promptDisplayText 
 * @param {Pointer<HSTRING>} xuids 
 * @param {Pointer} xuidsCount 
 * @param {Pointer<HSTRING>} preSelectedXuids 
 * @param {Pointer} preSelectedXuidsCount 
 * @param {Pointer} minSelectionCount 
 * @param {Pointer} maxSelectionCount 
 * @param {Pointer<PlayerPickerUICompletionRoutine>} completionRoutine 
 * @param {Pointer<Void>} _context 
 * @returns {HRESULT} 
 */
export ShowPlayerPickerUIForUser(user, promptDisplayText, xuids, xuidsCount, preSelectedXuids, preSelectedXuidsCount, minSelectionCount, maxSelectionCount, completionRoutine, _context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("api-ms-win-gaming-tcui-l1-1-2.dll\ShowPlayerPickerUIForUser", "ptr", user, HSTRING, promptDisplayText, HSTRING.Ptr, xuids, "ptr", xuidsCount, HSTRING.Ptr, preSelectedXuids, "ptr", preSelectedXuidsCount, "ptr", minSelectionCount, "ptr", maxSelectionCount, "ptr", completionRoutine, _contextMarshal, _context, "HRESULT")
    return result
}

/**
 * 
 * @param {IInspectable} user 
 * @param {HSTRING} targetUserXuid 
 * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
 * @param {Pointer<Void>} _context 
 * @returns {HRESULT} 
 */
export ShowProfileCardUIForUser(user, targetUserXuid, completionRoutine, _context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("api-ms-win-gaming-tcui-l1-1-2.dll\ShowProfileCardUIForUser", "ptr", user, HSTRING, targetUserXuid, "ptr", completionRoutine, _contextMarshal, _context, "HRESULT")
    return result
}

/**
 * 
 * @param {IInspectable} user 
 * @param {HSTRING} targetUserXuid 
 * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
 * @param {Pointer<Void>} _context 
 * @returns {HRESULT} 
 */
export ShowChangeFriendRelationshipUIForUser(user, targetUserXuid, completionRoutine, _context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("api-ms-win-gaming-tcui-l1-1-2.dll\ShowChangeFriendRelationshipUIForUser", "ptr", user, HSTRING, targetUserXuid, "ptr", completionRoutine, _contextMarshal, _context, "HRESULT")
    return result
}

/**
 * 
 * @param {IInspectable} user 
 * @param {Integer} titleId 
 * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
 * @param {Pointer<Void>} _context 
 * @returns {HRESULT} 
 */
export ShowTitleAchievementsUIForUser(user, titleId, completionRoutine, _context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("api-ms-win-gaming-tcui-l1-1-2.dll\ShowTitleAchievementsUIForUser", "ptr", user, "uint", titleId, "ptr", completionRoutine, _contextMarshal, _context, "HRESULT")
    return result
}

/**
 * 
 * @param {IInspectable} user 
 * @param {Integer} privilegeId 
 * @param {HSTRING} scope 
 * @param {HSTRING} policy 
 * @param {HSTRING} friendlyMessage 
 * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
 * @param {Pointer<Void>} _context 
 * @returns {HRESULT} 
 */
export CheckGamingPrivilegeWithUIForUser(user, privilegeId, scope, policy, friendlyMessage, completionRoutine, _context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("api-ms-win-gaming-tcui-l1-1-2.dll\CheckGamingPrivilegeWithUIForUser", "ptr", user, "uint", privilegeId, HSTRING, scope, HSTRING, policy, HSTRING, friendlyMessage, "ptr", completionRoutine, _contextMarshal, _context, "HRESULT")
    return result
}

/**
 * 
 * @param {IInspectable} user 
 * @param {Integer} privilegeId 
 * @param {HSTRING} scope 
 * @param {HSTRING} policy 
 * @returns {BOOL} 
 */
export CheckGamingPrivilegeSilentlyForUser(user, privilegeId, scope, policy) {
    result := DllCall("api-ms-win-gaming-tcui-l1-1-2.dll\CheckGamingPrivilegeSilentlyForUser", "ptr", user, "uint", privilegeId, HSTRING, scope, HSTRING, policy, BOOL.Ptr, &hasPrivilege := 0, "HRESULT")
    return hasPrivilege
}

/**
 * 
 * @param {HSTRING} serviceConfigurationId 
 * @param {HSTRING} sessionTemplateName 
 * @param {HSTRING} sessionId 
 * @param {HSTRING} invitationDisplayText 
 * @param {HSTRING} customActivationContext 
 * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
 * @param {Pointer<Void>} _context 
 * @returns {HRESULT} 
 */
export ShowGameInviteUIWithContext(serviceConfigurationId, sessionTemplateName, sessionId, invitationDisplayText, customActivationContext, completionRoutine, _context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("api-ms-win-gaming-tcui-l1-1-3.dll\ShowGameInviteUIWithContext", HSTRING, serviceConfigurationId, HSTRING, sessionTemplateName, HSTRING, sessionId, HSTRING, invitationDisplayText, HSTRING, customActivationContext, "ptr", completionRoutine, _contextMarshal, _context, "HRESULT")
    return result
}

/**
 * 
 * @param {IInspectable} user 
 * @param {HSTRING} serviceConfigurationId 
 * @param {HSTRING} sessionTemplateName 
 * @param {HSTRING} sessionId 
 * @param {HSTRING} invitationDisplayText 
 * @param {HSTRING} customActivationContext 
 * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
 * @param {Pointer<Void>} _context 
 * @returns {HRESULT} 
 */
export ShowGameInviteUIWithContextForUser(user, serviceConfigurationId, sessionTemplateName, sessionId, invitationDisplayText, customActivationContext, completionRoutine, _context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("api-ms-win-gaming-tcui-l1-1-3.dll\ShowGameInviteUIWithContextForUser", "ptr", user, HSTRING, serviceConfigurationId, HSTRING, sessionTemplateName, HSTRING, sessionId, HSTRING, invitationDisplayText, HSTRING, customActivationContext, "ptr", completionRoutine, _contextMarshal, _context, "HRESULT")
    return result
}

/**
 * 
 * @param {Integer} titleId 
 * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
 * @param {Pointer<Void>} _context 
 * @returns {HRESULT} 
 */
export ShowGameInfoUI(titleId, completionRoutine, _context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("api-ms-win-gaming-tcui-l1-1-4.dll\ShowGameInfoUI", "uint", titleId, "ptr", completionRoutine, _contextMarshal, _context, "HRESULT")
    return result
}

/**
 * 
 * @param {IInspectable} user 
 * @param {Integer} titleId 
 * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
 * @param {Pointer<Void>} _context 
 * @returns {HRESULT} 
 */
export ShowGameInfoUIForUser(user, titleId, completionRoutine, _context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("api-ms-win-gaming-tcui-l1-1-4.dll\ShowGameInfoUIForUser", "ptr", user, "uint", titleId, "ptr", completionRoutine, _contextMarshal, _context, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
 * @param {Pointer<Void>} _context 
 * @returns {HRESULT} 
 */
export ShowFindFriendsUI(completionRoutine, _context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("api-ms-win-gaming-tcui-l1-1-4.dll\ShowFindFriendsUI", "ptr", completionRoutine, _contextMarshal, _context, "HRESULT")
    return result
}

/**
 * 
 * @param {IInspectable} user 
 * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
 * @param {Pointer<Void>} _context 
 * @returns {HRESULT} 
 */
export ShowFindFriendsUIForUser(user, completionRoutine, _context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("api-ms-win-gaming-tcui-l1-1-4.dll\ShowFindFriendsUIForUser", "ptr", user, "ptr", completionRoutine, _contextMarshal, _context, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
 * @param {Pointer<Void>} _context 
 * @returns {HRESULT} 
 */
export ShowCustomizeUserProfileUI(completionRoutine, _context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("api-ms-win-gaming-tcui-l1-1-4.dll\ShowCustomizeUserProfileUI", "ptr", completionRoutine, _contextMarshal, _context, "HRESULT")
    return result
}

/**
 * 
 * @param {IInspectable} user 
 * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
 * @param {Pointer<Void>} _context 
 * @returns {HRESULT} 
 */
export ShowCustomizeUserProfileUIForUser(user, completionRoutine, _context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("api-ms-win-gaming-tcui-l1-1-4.dll\ShowCustomizeUserProfileUIForUser", "ptr", user, "ptr", completionRoutine, _contextMarshal, _context, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
 * @param {Pointer<Void>} _context 
 * @returns {HRESULT} 
 */
export ShowUserSettingsUI(completionRoutine, _context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("api-ms-win-gaming-tcui-l1-1-4.dll\ShowUserSettingsUI", "ptr", completionRoutine, _contextMarshal, _context, "HRESULT")
    return result
}

/**
 * 
 * @param {IInspectable} user 
 * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
 * @param {Pointer<Void>} _context 
 * @returns {HRESULT} 
 */
export ShowUserSettingsUIForUser(user, completionRoutine, _context) {
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("api-ms-win-gaming-tcui-l1-1-4.dll\ShowUserSettingsUIForUser", "ptr", user, "ptr", completionRoutine, _contextMarshal, _context, "HRESULT")
    return result
}

;@endregion Functions
