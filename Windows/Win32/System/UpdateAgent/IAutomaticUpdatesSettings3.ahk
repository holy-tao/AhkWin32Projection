#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IAutomaticUpdatesSettings2.ahk" { IAutomaticUpdatesSettings2 }

/**
 * Contains the settings that are available in Automatic Updates. (IAutomaticUpdatesSettings3)
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iautomaticupdatessettings3
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IAutomaticUpdatesSettings3 extends IAutomaticUpdatesSettings2 {
    /**
     * The interface identifier for IAutomaticUpdatesSettings3
     * @type {Guid}
     */
    static IID := Guid("{b587f5c3-f57e-485f-bbf5-0d181c5cd0dc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAutomaticUpdatesSettings3 interfaces
    */
    struct Vtbl extends IAutomaticUpdatesSettings2.Vtbl {
        get_NonAdministratorsElevated : IntPtr
        put_NonAdministratorsElevated : IntPtr
        get_FeaturedUpdatesEnabled    : IntPtr
        put_FeaturedUpdatesEnabled    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAutomaticUpdatesSettings3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    NonAdministratorsElevated {
        get => this.get_NonAdministratorsElevated()
        set => this.put_NonAdministratorsElevated(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    FeaturedUpdatesEnabled {
        get => this.get_FeaturedUpdatesEnabled()
        set => this.put_FeaturedUpdatesEnabled(value)
    }

    /**
     * Gets and sets a Boolean value that indicates whether non-administrators can perform some update-related actions without administrator approval. (Get)
     * @remarks
     * The NonAdministratorsElevated property controls whether non-administrative users are allowed to perform some additional actions without elevation. It is equivalent to the “Allow all users to install updates on this computer” check box in the Windows Update settings dialog.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iautomaticupdatessettings3-get_nonadministratorselevated
     */
    get_NonAdministratorsElevated() {
        result := ComCall(20, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets and sets a Boolean value that indicates whether non-administrators can perform some update-related actions without administrator approval. (Put)
     * @remarks
     * The NonAdministratorsElevated property controls whether non-administrative users are allowed to perform some additional actions without elevation. It is equivalent to the “Allow all users to install updates on this computer” check box in the Windows Update settings dialog.
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iautomaticupdatessettings3-put_nonadministratorselevated
     */
    put_NonAdministratorsElevated(value) {
        result := ComCall(21, this, VARIANT_BOOL, value, "HRESULT")
        return result
    }

    /**
     * Not supported. (IAutomaticUpdatesSettings3.get_FeaturedUpdatesEnabled)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iautomaticupdatessettings3-get_featuredupdatesenabled
     */
    get_FeaturedUpdatesEnabled() {
        result := ComCall(22, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Not supported. (IAutomaticUpdatesSettings3.put_FeaturedUpdatesEnabled)
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iautomaticupdatessettings3-put_featuredupdatesenabled
     */
    put_FeaturedUpdatesEnabled(value) {
        result := ComCall(23, this, VARIANT_BOOL, value, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAutomaticUpdatesSettings3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_NonAdministratorsElevated := CallbackCreate(GetMethod(implObj, "get_NonAdministratorsElevated"), flags, 2)
        this.vtbl.put_NonAdministratorsElevated := CallbackCreate(GetMethod(implObj, "put_NonAdministratorsElevated"), flags, 2)
        this.vtbl.get_FeaturedUpdatesEnabled := CallbackCreate(GetMethod(implObj, "get_FeaturedUpdatesEnabled"), flags, 2)
        this.vtbl.put_FeaturedUpdatesEnabled := CallbackCreate(GetMethod(implObj, "put_FeaturedUpdatesEnabled"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_NonAdministratorsElevated)
        CallbackFree(this.vtbl.put_NonAdministratorsElevated)
        CallbackFree(this.vtbl.get_FeaturedUpdatesEnabled)
        CallbackFree(this.vtbl.put_FeaturedUpdatesEnabled)
    }
}
