#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IAutomaticUpdatesSettings.ahk" { IAutomaticUpdatesSettings }
#Import ".\AutomaticUpdatesPermissionType.ahk" { AutomaticUpdatesPermissionType }
#Import ".\AutomaticUpdatesUserType.ahk" { AutomaticUpdatesUserType }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Contains the settings that are available in Automatic Updates. (IAutomaticUpdatesSettings2)
 * @remarks
 * The <b>IAutomaticUpdatesSettings2</b> interface  may require you to update the Windows Update Agent (WUA). For more information, see <a href="https://docs.microsoft.com/windows/desktop/Wua_Sdk/updating-the-windows-update-agent">Updating Windows Update Agent</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iautomaticupdatessettings2
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IAutomaticUpdatesSettings2 extends IAutomaticUpdatesSettings {
    /**
     * The interface identifier for IAutomaticUpdatesSettings2
     * @type {Guid}
     */
    static IID := Guid("{6abc136a-c3ca-4384-8171-cb2b1e59b8dc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAutomaticUpdatesSettings2 interfaces
    */
    struct Vtbl extends IAutomaticUpdatesSettings.Vtbl {
        get_IncludeRecommendedUpdates : IntPtr
        put_IncludeRecommendedUpdates : IntPtr
        CheckPermission               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAutomaticUpdatesSettings2.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iautomaticupdatessettings2-get_includerecommendedupdates
     */
    get_IncludeRecommendedUpdates() {
        result := ComCall(17, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iautomaticupdatessettings2-put_includerecommendedupdates
     */
    put_IncludeRecommendedUpdates(value) {
        result := ComCall(18, this, VARIANT_BOOL, value, "HRESULT")
        return result
    }

    /**
     * Determines whether a specific user or type of user has permission to perform a selected action.
     * @remarks
     * This method can be used to determine whether User Access Control (UAC) must be used to perform an action in the agent, which may obviate the need for prompting if the user type does not have permission to perform the action.  For example, unless the agent has elevated permission, the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iautomaticupdatessettings-get_readonly">ReadOnly</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iautomaticupdatessettings">IAutomaticUpdatesSettings</a> interface will always be <b>VARIANT_TRUE</b>.  However, even after a user has been elevated, the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/ne-wuapi-automaticupdatesnotificationlevel">NotificationLevel</a> (for example) may still be read-only due to Group Policy settings.  The <b>CheckPermission</b> method can determine this before elevation is done to prevent prompting in cases where the setting cannot be changed.
     * @param {AutomaticUpdatesUserType} userType An enumeration that indicates the type of user to verify permissions.
     * @param {AutomaticUpdatesPermissionType} permissionType An enumeration that indicates the user's permission level.
     * @returns {VARIANT_BOOL} True if the user has the specified permission type; otherwise, false.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iautomaticupdatessettings2-checkpermission
     */
    CheckPermission(userType, permissionType) {
        result := ComCall(19, this, AutomaticUpdatesUserType, userType, AutomaticUpdatesPermissionType, permissionType, VARIANT_BOOL.Ptr, &userHasPermission := 0, "HRESULT")
        return userHasPermission
    }

    Query(iid) {
        if (IAutomaticUpdatesSettings2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_IncludeRecommendedUpdates := CallbackCreate(GetMethod(implObj, "get_IncludeRecommendedUpdates"), flags, 2)
        this.vtbl.put_IncludeRecommendedUpdates := CallbackCreate(GetMethod(implObj, "put_IncludeRecommendedUpdates"), flags, 2)
        this.vtbl.CheckPermission := CallbackCreate(GetMethod(implObj, "CheckPermission"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_IncludeRecommendedUpdates)
        CallbackFree(this.vtbl.put_IncludeRecommendedUpdates)
        CallbackFree(this.vtbl.CheckPermission)
    }
}
