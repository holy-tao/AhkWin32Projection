#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IAutomaticUpdatesSettings.ahk

/**
 * Contains the settings that are available in Automatic Updates. (IAutomaticUpdatesSettings2)
 * @remarks
 * The <b>IAutomaticUpdatesSettings2</b> interface  may require you to update the Windows Update Agent (WUA). For more information, see <a href="https://docs.microsoft.com/windows/desktop/Wua_Sdk/updating-the-windows-update-agent">Updating Windows Update Agent</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/wuapi/nn-wuapi-iautomaticupdatessettings2
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IAutomaticUpdatesSettings2 extends IAutomaticUpdatesSettings{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAutomaticUpdatesSettings2
     * @type {Guid}
     */
    static IID => Guid("{6abc136a-c3ca-4384-8171-cb2b1e59b8dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IncludeRecommendedUpdates", "put_IncludeRecommendedUpdates", "CheckPermission"]

    /**
     * @type {VARIANT_BOOL} 
     */
    IncludeRecommendedUpdates {
        get => this.get_IncludeRecommendedUpdates()
        set => this.put_IncludeRecommendedUpdates(value)
    }

    /**
     * Gets and sets a Boolean value that indicates whether to include optional or recommended updates when a search for updates and installation of updates is performed. (Get)
     * @remarks
     * Only administrators can set this property.
     * 
     * The caller can modify the settings in  the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iautomaticupdatessettings2">IAutomaticUpdatesSettings2</a> interface only if the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iautomaticupdatessettings-get_readonly">ReadOnly</a> property is <b>VARIANT_TRUE</b>.
     * The <b>ReadOnly</b> property may change after the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iautomaticupdatessettings-refresh">Refresh</a> method is called.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wuapi/nf-wuapi-iautomaticupdatessettings2-get_includerecommendedupdates
     */
    get_IncludeRecommendedUpdates() {
        result := ComCall(17, this, "short*", &retval := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * Gets and sets a Boolean value that indicates whether to include optional or recommended updates when a search for updates and installation of updates is performed. (Put)
     * @remarks
     * Only administrators can set this property.
     * 
     * The caller can modify the settings in  the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iautomaticupdatessettings2">IAutomaticUpdatesSettings2</a> interface only if the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iautomaticupdatessettings-get_readonly">ReadOnly</a> property is <b>VARIANT_TRUE</b>.
     * The <b>ReadOnly</b> property may change after the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iautomaticupdatessettings-refresh">Refresh</a> method is called.
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wuapi/nf-wuapi-iautomaticupdatessettings2-put_includerecommendedupdates
     */
    put_IncludeRecommendedUpdates(value) {
        result := ComCall(18, this, "short", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Determines whether a specific user or type of user has permission to perform a selected action.
     * @remarks
     * This method can be used to determine whether User Access Control (UAC) must be used to perform an action in the agent, which may obviate the need for prompting if the user type does not have permission to perform the action.  For example, unless the agent has elevated permission, the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iautomaticupdatessettings-get_readonly">ReadOnly</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iautomaticupdatessettings">IAutomaticUpdatesSettings</a> interface will always be <b>VARIANT_TRUE</b>.  However, even after a user has been elevated, the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/ne-wuapi-automaticupdatesnotificationlevel">NotificationLevel</a> (for example) may still be read-only due to Group Policy settings.  The <b>CheckPermission</b> method can determine this before elevation is done to prevent prompting in cases where the setting cannot be changed.
     * @param {Integer} userType An enumeration that indicates the type of user to verify permissions.
     * @param {Integer} permissionType An enumeration that indicates the user's permission level.
     * @returns {VARIANT_BOOL} True if the user has the specified permission type; otherwise, false.
     * @see https://learn.microsoft.com/windows/win32/api//content/wuapi/nf-wuapi-iautomaticupdatessettings2-checkpermission
     */
    CheckPermission(userType, permissionType) {
        result := ComCall(19, this, "int", userType, "int", permissionType, "short*", &userHasPermission := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return userHasPermission
    }
}
