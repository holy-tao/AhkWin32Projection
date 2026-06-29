#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Contains the read-only properties that describe Automatic Updates.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iautomaticupdatesresults
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IAutomaticUpdatesResults extends IDispatch {
    /**
     * The interface identifier for IAutomaticUpdatesResults
     * @type {Guid}
     */
    static IID := Guid("{e7a4d634-7942-4dd9-a111-82228ba33901}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAutomaticUpdatesResults interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_LastSearchSuccessDate       : IntPtr
        get_LastInstallationSuccessDate : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAutomaticUpdatesResults.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    LastSearchSuccessDate {
        get => this.get_LastSearchSuccessDate()
    }

    /**
     * @type {VARIANT} 
     */
    LastInstallationSuccessDate {
        get => this.get_LastInstallationSuccessDate()
    }

    /**
     * Gets the last time and Coordinated Universal Time (UTC) date when AutomaticUpdates successfully searched for updates.
     * @remarks
     * Calls to <b>LastSearchSuccessDate</b> by public users do not update this property. Only the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iautomaticupdates">AutomaticUpdates</a> object will update this property.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iautomaticupdatesresults-get_lastsearchsuccessdate
     */
    get_LastSearchSuccessDate() {
        retval := VARIANT()
        result := ComCall(7, this, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets the last time and Coordinated Universal Time (UTC) date when Automatic Updates successfully installed any updates, even if some failures occurred.
     * @remarks
     * Calls to <b>LastInstallationSuccessDate</b> by public users do not update this property. Only the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iautomaticupdates">AutomaticUpdates</a> object will update this property.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iautomaticupdatesresults-get_lastinstallationsuccessdate
     */
    get_LastInstallationSuccessDate() {
        retval := VARIANT()
        result := ComCall(8, this, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    Query(iid) {
        if (IAutomaticUpdatesResults.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_LastSearchSuccessDate := CallbackCreate(GetMethod(implObj, "get_LastSearchSuccessDate"), flags, 2)
        this.vtbl.get_LastInstallationSuccessDate := CallbackCreate(GetMethod(implObj, "get_LastInstallationSuccessDate"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_LastSearchSuccessDate)
        CallbackFree(this.vtbl.get_LastInstallationSuccessDate)
    }
}
