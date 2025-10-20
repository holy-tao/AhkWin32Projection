#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Handle.ahk

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
     * @param {Pointer<BOOL>} hasExpandedResources True if  the app is running in Game Mode; otherwise, false.
     * @returns {HRESULT} The result of the operation.
     * @see https://docs.microsoft.com/windows/win32/api//expandedresources/nf-expandedresources-hasexpandedresources
     */
    static HasExpandedResources(hasExpandedResources) {
        result := DllCall("api-ms-win-gaming-expandedresources-l1-1-0.dll\HasExpandedResources", "ptr", hasExpandedResources, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets the expected number of exclusive CPU sets that are available to the app when in Game Mode.
     * @param {Pointer<Integer>} exclusiveCpuCount The expected number of exclusive CPU sets that are available to the app when in Game Mode.
     * @returns {HRESULT} The result of the operation.
     * @see https://docs.microsoft.com/windows/win32/api//expandedresources/nf-expandedresources-getexpandedresourceexclusivecpucount
     */
    static GetExpandedResourceExclusiveCpuCount(exclusiveCpuCount) {
        result := DllCall("api-ms-win-gaming-expandedresources-l1-1-0.dll\GetExpandedResourceExclusiveCpuCount", "uint*", exclusiveCpuCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Opts out of CPU exclusivity, giving the app access to all cores, but at the cost of having to share them with other processes.
     * @returns {HRESULT} The result of the operation.
     * @see https://docs.microsoft.com/windows/win32/api//expandedresources/nf-expandedresources-releaseexclusivecpusets
     */
    static ReleaseExclusiveCpuSets() {
        result := DllCall("api-ms-win-gaming-expandedresources-l1-1-0.dll\ReleaseExclusiveCpuSets", "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets information about the device that the game is running on.
     * @param {Pointer<GAMING_DEVICE_MODEL_INFORMATION>} information A structure containing information about the device that the game is running on.
     * @returns {HRESULT} This function does not return a value.
     * @see https://docs.microsoft.com/windows/win32/api//gamingdeviceinformation/nf-gamingdeviceinformation-getgamingdevicemodelinformation
     */
    static GetGamingDeviceModelInformation(information) {
        result := DllCall("api-ms-win-gaming-deviceinformation-l1-1-0.dll\GetGamingDeviceModelInformation", "ptr", information, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Do not use. This API is only supported for Xbox developers.
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
     * @param {Pointer<Void>} context Type: <b>void*</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @see https://docs.microsoft.com/windows/win32/api//gamingtcui/nf-gamingtcui-showgameinviteui
     */
    static ShowGameInviteUI(serviceConfigurationId, sessionTemplateName, sessionId, invitationDisplayText, completionRoutine, context) {
        serviceConfigurationId := serviceConfigurationId is Win32Handle ? NumGet(serviceConfigurationId, "ptr") : serviceConfigurationId
        sessionTemplateName := sessionTemplateName is Win32Handle ? NumGet(sessionTemplateName, "ptr") : sessionTemplateName
        sessionId := sessionId is Win32Handle ? NumGet(sessionId, "ptr") : sessionId
        invitationDisplayText := invitationDisplayText is Win32Handle ? NumGet(invitationDisplayText, "ptr") : invitationDisplayText

        result := DllCall("api-ms-win-gaming-tcui-l1-1-0.dll\ShowGameInviteUI", "ptr", serviceConfigurationId, "ptr", sessionTemplateName, "ptr", sessionId, "ptr", invitationDisplayText, "ptr", completionRoutine, "ptr", context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Do not use. This API is only supported for Xbox developers.
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
     * @param {Pointer<Void>} context Type: <b>void*</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @see https://docs.microsoft.com/windows/win32/api//gamingtcui/nf-gamingtcui-showplayerpickerui
     */
    static ShowPlayerPickerUI(promptDisplayText, xuids, xuidsCount, preSelectedXuids, preSelectedXuidsCount, minSelectionCount, maxSelectionCount, completionRoutine, context) {
        promptDisplayText := promptDisplayText is Win32Handle ? NumGet(promptDisplayText, "ptr") : promptDisplayText

        result := DllCall("api-ms-win-gaming-tcui-l1-1-0.dll\ShowPlayerPickerUI", "ptr", promptDisplayText, "ptr", xuids, "ptr", xuidsCount, "ptr", preSelectedXuids, "ptr", preSelectedXuidsCount, "ptr", minSelectionCount, "ptr", maxSelectionCount, "ptr", completionRoutine, "ptr", context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Do not use. This API is only supported for Xbox developers.
     * @param {HSTRING} targetUserXuid Type: <b>HSTRING</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @param {Pointer<GameUICompletionRoutine>} completionRoutine Type: <b>GameUICompletionRoutine</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @param {Pointer<Void>} context Type: <b>void*</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @see https://docs.microsoft.com/windows/win32/api//gamingtcui/nf-gamingtcui-showprofilecardui
     */
    static ShowProfileCardUI(targetUserXuid, completionRoutine, context) {
        targetUserXuid := targetUserXuid is Win32Handle ? NumGet(targetUserXuid, "ptr") : targetUserXuid

        result := DllCall("api-ms-win-gaming-tcui-l1-1-0.dll\ShowProfileCardUI", "ptr", targetUserXuid, "ptr", completionRoutine, "ptr", context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Do not use. This API is only supported for Xbox developers.
     * @param {HSTRING} targetUserXuid Type: <b>HSTRING</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @param {Pointer<GameUICompletionRoutine>} completionRoutine Type: <b>GameUICompletionRoutine</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @param {Pointer<Void>} context Type: <b>void*</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @see https://docs.microsoft.com/windows/win32/api//gamingtcui/nf-gamingtcui-showchangefriendrelationshipui
     */
    static ShowChangeFriendRelationshipUI(targetUserXuid, completionRoutine, context) {
        targetUserXuid := targetUserXuid is Win32Handle ? NumGet(targetUserXuid, "ptr") : targetUserXuid

        result := DllCall("api-ms-win-gaming-tcui-l1-1-0.dll\ShowChangeFriendRelationshipUI", "ptr", targetUserXuid, "ptr", completionRoutine, "ptr", context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Do not use. This API is only supported for Xbox developers.
     * @param {Integer} titleId Type: <b>UINT32</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @param {Pointer<GameUICompletionRoutine>} completionRoutine Type: <b>GameUICompletionRoutine</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @param {Pointer<Void>} context Type: <b>void*</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @see https://docs.microsoft.com/windows/win32/api//gamingtcui/nf-gamingtcui-showtitleachievementsui
     */
    static ShowTitleAchievementsUI(titleId, completionRoutine, context) {
        result := DllCall("api-ms-win-gaming-tcui-l1-1-0.dll\ShowTitleAchievementsUI", "uint", titleId, "ptr", completionRoutine, "ptr", context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Do not use. This API is only supported for Xbox developers.
     * @param {BOOL} waitForCompletion Type: <b>BOOL</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @see https://docs.microsoft.com/windows/win32/api//gamingtcui/nf-gamingtcui-processpendinggameui
     */
    static ProcessPendingGameUI(waitForCompletion) {
        result := DllCall("api-ms-win-gaming-tcui-l1-1-0.dll\ProcessPendingGameUI", "int", waitForCompletion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Do not use. This API is only supported for Xbox developers.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @see https://docs.microsoft.com/windows/win32/api//gamingtcui/nf-gamingtcui-trycancelpendinggameui
     */
    static TryCancelPendingGameUI() {
        result := DllCall("api-ms-win-gaming-tcui-l1-1-0.dll\TryCancelPendingGameUI", "int")
        return result
    }

    /**
     * Do not use. This API is only supported for Xbox developers.
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
     * @param {Pointer<Void>} context Type: <b>void*</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @see https://docs.microsoft.com/windows/win32/api//gamingtcui/nf-gamingtcui-checkgamingprivilegewithui
     */
    static CheckGamingPrivilegeWithUI(privilegeId, scope, policy, friendlyMessage, completionRoutine, context) {
        scope := scope is Win32Handle ? NumGet(scope, "ptr") : scope
        policy := policy is Win32Handle ? NumGet(policy, "ptr") : policy
        friendlyMessage := friendlyMessage is Win32Handle ? NumGet(friendlyMessage, "ptr") : friendlyMessage

        result := DllCall("api-ms-win-gaming-tcui-l1-1-1.dll\CheckGamingPrivilegeWithUI", "uint", privilegeId, "ptr", scope, "ptr", policy, "ptr", friendlyMessage, "ptr", completionRoutine, "ptr", context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Do not use. This API is only supported for Xbox developers.
     * @param {Integer} privilegeId Type: <b>UINT32</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @param {HSTRING} scope Type: <b>HSTRING</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @param {HSTRING} policy Type: <b>HSTRING</b>
     * 
     * Specifies a HSTRING that ... TBD
     * @param {Pointer<BOOL>} hasPrivilege Type: <b>BOOL*</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @see https://docs.microsoft.com/windows/win32/api//gamingtcui/nf-gamingtcui-checkgamingprivilegesilently
     */
    static CheckGamingPrivilegeSilently(privilegeId, scope, policy, hasPrivilege) {
        scope := scope is Win32Handle ? NumGet(scope, "ptr") : scope
        policy := policy is Win32Handle ? NumGet(policy, "ptr") : policy

        result := DllCall("api-ms-win-gaming-tcui-l1-1-1.dll\CheckGamingPrivilegeSilently", "uint", privilegeId, "ptr", scope, "ptr", policy, "ptr", hasPrivilege, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {IInspectable} user 
     * @param {HSTRING} serviceConfigurationId 
     * @param {HSTRING} sessionTemplateName 
     * @param {HSTRING} sessionId 
     * @param {HSTRING} invitationDisplayText 
     * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
     * @param {Pointer<Void>} context 
     * @returns {HRESULT} 
     */
    static ShowGameInviteUIForUser(user, serviceConfigurationId, sessionTemplateName, sessionId, invitationDisplayText, completionRoutine, context) {
        serviceConfigurationId := serviceConfigurationId is Win32Handle ? NumGet(serviceConfigurationId, "ptr") : serviceConfigurationId
        sessionTemplateName := sessionTemplateName is Win32Handle ? NumGet(sessionTemplateName, "ptr") : sessionTemplateName
        sessionId := sessionId is Win32Handle ? NumGet(sessionId, "ptr") : sessionId
        invitationDisplayText := invitationDisplayText is Win32Handle ? NumGet(invitationDisplayText, "ptr") : invitationDisplayText

        result := DllCall("api-ms-win-gaming-tcui-l1-1-2.dll\ShowGameInviteUIForUser", "ptr", user, "ptr", serviceConfigurationId, "ptr", sessionTemplateName, "ptr", sessionId, "ptr", invitationDisplayText, "ptr", completionRoutine, "ptr", context, "int")
        if(result != 0)
            throw OSError(result)

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
     * @param {Pointer<Void>} context 
     * @returns {HRESULT} 
     */
    static ShowPlayerPickerUIForUser(user, promptDisplayText, xuids, xuidsCount, preSelectedXuids, preSelectedXuidsCount, minSelectionCount, maxSelectionCount, completionRoutine, context) {
        promptDisplayText := promptDisplayText is Win32Handle ? NumGet(promptDisplayText, "ptr") : promptDisplayText

        result := DllCall("api-ms-win-gaming-tcui-l1-1-2.dll\ShowPlayerPickerUIForUser", "ptr", user, "ptr", promptDisplayText, "ptr", xuids, "ptr", xuidsCount, "ptr", preSelectedXuids, "ptr", preSelectedXuidsCount, "ptr", minSelectionCount, "ptr", maxSelectionCount, "ptr", completionRoutine, "ptr", context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {IInspectable} user 
     * @param {HSTRING} targetUserXuid 
     * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
     * @param {Pointer<Void>} context 
     * @returns {HRESULT} 
     */
    static ShowProfileCardUIForUser(user, targetUserXuid, completionRoutine, context) {
        targetUserXuid := targetUserXuid is Win32Handle ? NumGet(targetUserXuid, "ptr") : targetUserXuid

        result := DllCall("api-ms-win-gaming-tcui-l1-1-2.dll\ShowProfileCardUIForUser", "ptr", user, "ptr", targetUserXuid, "ptr", completionRoutine, "ptr", context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {IInspectable} user 
     * @param {HSTRING} targetUserXuid 
     * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
     * @param {Pointer<Void>} context 
     * @returns {HRESULT} 
     */
    static ShowChangeFriendRelationshipUIForUser(user, targetUserXuid, completionRoutine, context) {
        targetUserXuid := targetUserXuid is Win32Handle ? NumGet(targetUserXuid, "ptr") : targetUserXuid

        result := DllCall("api-ms-win-gaming-tcui-l1-1-2.dll\ShowChangeFriendRelationshipUIForUser", "ptr", user, "ptr", targetUserXuid, "ptr", completionRoutine, "ptr", context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {IInspectable} user 
     * @param {Integer} titleId 
     * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
     * @param {Pointer<Void>} context 
     * @returns {HRESULT} 
     */
    static ShowTitleAchievementsUIForUser(user, titleId, completionRoutine, context) {
        result := DllCall("api-ms-win-gaming-tcui-l1-1-2.dll\ShowTitleAchievementsUIForUser", "ptr", user, "uint", titleId, "ptr", completionRoutine, "ptr", context, "int")
        if(result != 0)
            throw OSError(result)

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
     * @param {Pointer<Void>} context 
     * @returns {HRESULT} 
     */
    static CheckGamingPrivilegeWithUIForUser(user, privilegeId, scope, policy, friendlyMessage, completionRoutine, context) {
        scope := scope is Win32Handle ? NumGet(scope, "ptr") : scope
        policy := policy is Win32Handle ? NumGet(policy, "ptr") : policy
        friendlyMessage := friendlyMessage is Win32Handle ? NumGet(friendlyMessage, "ptr") : friendlyMessage

        result := DllCall("api-ms-win-gaming-tcui-l1-1-2.dll\CheckGamingPrivilegeWithUIForUser", "ptr", user, "uint", privilegeId, "ptr", scope, "ptr", policy, "ptr", friendlyMessage, "ptr", completionRoutine, "ptr", context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {IInspectable} user 
     * @param {Integer} privilegeId 
     * @param {HSTRING} scope 
     * @param {HSTRING} policy 
     * @param {Pointer<BOOL>} hasPrivilege 
     * @returns {HRESULT} 
     */
    static CheckGamingPrivilegeSilentlyForUser(user, privilegeId, scope, policy, hasPrivilege) {
        scope := scope is Win32Handle ? NumGet(scope, "ptr") : scope
        policy := policy is Win32Handle ? NumGet(policy, "ptr") : policy

        result := DllCall("api-ms-win-gaming-tcui-l1-1-2.dll\CheckGamingPrivilegeSilentlyForUser", "ptr", user, "uint", privilegeId, "ptr", scope, "ptr", policy, "ptr", hasPrivilege, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HSTRING} serviceConfigurationId 
     * @param {HSTRING} sessionTemplateName 
     * @param {HSTRING} sessionId 
     * @param {HSTRING} invitationDisplayText 
     * @param {HSTRING} customActivationContext 
     * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
     * @param {Pointer<Void>} context 
     * @returns {HRESULT} 
     */
    static ShowGameInviteUIWithContext(serviceConfigurationId, sessionTemplateName, sessionId, invitationDisplayText, customActivationContext, completionRoutine, context) {
        serviceConfigurationId := serviceConfigurationId is Win32Handle ? NumGet(serviceConfigurationId, "ptr") : serviceConfigurationId
        sessionTemplateName := sessionTemplateName is Win32Handle ? NumGet(sessionTemplateName, "ptr") : sessionTemplateName
        sessionId := sessionId is Win32Handle ? NumGet(sessionId, "ptr") : sessionId
        invitationDisplayText := invitationDisplayText is Win32Handle ? NumGet(invitationDisplayText, "ptr") : invitationDisplayText
        customActivationContext := customActivationContext is Win32Handle ? NumGet(customActivationContext, "ptr") : customActivationContext

        result := DllCall("api-ms-win-gaming-tcui-l1-1-3.dll\ShowGameInviteUIWithContext", "ptr", serviceConfigurationId, "ptr", sessionTemplateName, "ptr", sessionId, "ptr", invitationDisplayText, "ptr", customActivationContext, "ptr", completionRoutine, "ptr", context, "int")
        if(result != 0)
            throw OSError(result)

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
     * @param {Pointer<Void>} context 
     * @returns {HRESULT} 
     */
    static ShowGameInviteUIWithContextForUser(user, serviceConfigurationId, sessionTemplateName, sessionId, invitationDisplayText, customActivationContext, completionRoutine, context) {
        serviceConfigurationId := serviceConfigurationId is Win32Handle ? NumGet(serviceConfigurationId, "ptr") : serviceConfigurationId
        sessionTemplateName := sessionTemplateName is Win32Handle ? NumGet(sessionTemplateName, "ptr") : sessionTemplateName
        sessionId := sessionId is Win32Handle ? NumGet(sessionId, "ptr") : sessionId
        invitationDisplayText := invitationDisplayText is Win32Handle ? NumGet(invitationDisplayText, "ptr") : invitationDisplayText
        customActivationContext := customActivationContext is Win32Handle ? NumGet(customActivationContext, "ptr") : customActivationContext

        result := DllCall("api-ms-win-gaming-tcui-l1-1-3.dll\ShowGameInviteUIWithContextForUser", "ptr", user, "ptr", serviceConfigurationId, "ptr", sessionTemplateName, "ptr", sessionId, "ptr", invitationDisplayText, "ptr", customActivationContext, "ptr", completionRoutine, "ptr", context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} titleId 
     * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
     * @param {Pointer<Void>} context 
     * @returns {HRESULT} 
     */
    static ShowGameInfoUI(titleId, completionRoutine, context) {
        result := DllCall("api-ms-win-gaming-tcui-l1-1-4.dll\ShowGameInfoUI", "uint", titleId, "ptr", completionRoutine, "ptr", context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {IInspectable} user 
     * @param {Integer} titleId 
     * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
     * @param {Pointer<Void>} context 
     * @returns {HRESULT} 
     */
    static ShowGameInfoUIForUser(user, titleId, completionRoutine, context) {
        result := DllCall("api-ms-win-gaming-tcui-l1-1-4.dll\ShowGameInfoUIForUser", "ptr", user, "uint", titleId, "ptr", completionRoutine, "ptr", context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
     * @param {Pointer<Void>} context 
     * @returns {HRESULT} 
     */
    static ShowFindFriendsUI(completionRoutine, context) {
        result := DllCall("api-ms-win-gaming-tcui-l1-1-4.dll\ShowFindFriendsUI", "ptr", completionRoutine, "ptr", context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {IInspectable} user 
     * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
     * @param {Pointer<Void>} context 
     * @returns {HRESULT} 
     */
    static ShowFindFriendsUIForUser(user, completionRoutine, context) {
        result := DllCall("api-ms-win-gaming-tcui-l1-1-4.dll\ShowFindFriendsUIForUser", "ptr", user, "ptr", completionRoutine, "ptr", context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
     * @param {Pointer<Void>} context 
     * @returns {HRESULT} 
     */
    static ShowCustomizeUserProfileUI(completionRoutine, context) {
        result := DllCall("api-ms-win-gaming-tcui-l1-1-4.dll\ShowCustomizeUserProfileUI", "ptr", completionRoutine, "ptr", context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {IInspectable} user 
     * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
     * @param {Pointer<Void>} context 
     * @returns {HRESULT} 
     */
    static ShowCustomizeUserProfileUIForUser(user, completionRoutine, context) {
        result := DllCall("api-ms-win-gaming-tcui-l1-1-4.dll\ShowCustomizeUserProfileUIForUser", "ptr", user, "ptr", completionRoutine, "ptr", context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
     * @param {Pointer<Void>} context 
     * @returns {HRESULT} 
     */
    static ShowUserSettingsUI(completionRoutine, context) {
        result := DllCall("api-ms-win-gaming-tcui-l1-1-4.dll\ShowUserSettingsUI", "ptr", completionRoutine, "ptr", context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {IInspectable} user 
     * @param {Pointer<GameUICompletionRoutine>} completionRoutine 
     * @param {Pointer<Void>} context 
     * @returns {HRESULT} 
     */
    static ShowUserSettingsUIForUser(user, completionRoutine, context) {
        result := DllCall("api-ms-win-gaming-tcui-l1-1-4.dll\ShowUserSettingsUIForUser", "ptr", user, "ptr", completionRoutine, "ptr", context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
