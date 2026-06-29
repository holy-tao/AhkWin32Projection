#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IRTCUserSearchQuery.ahk" { IRTCUserSearchQuery }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRTCProfile.ahk" { IRTCProfile }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCUserSearch extends IUnknown {
    /**
     * The interface identifier for IRTCUserSearch
     * @type {Guid}
     */
    static IID := Guid("{b619882b-860c-4db4-be1b-693b6505bbe5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCUserSearch interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateQuery   : IntPtr
        ExecuteSearch : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCUserSearch.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IRTCUserSearchQuery} 
     */
    CreateQuery() {
        result := ComCall(3, this, "ptr*", &ppQuery := 0, "HRESULT")
        return IRTCUserSearchQuery(ppQuery)
    }

    /**
     * 
     * @param {IRTCUserSearchQuery} pQuery 
     * @param {IRTCProfile} pProfile 
     * @param {Pointer} lCookie 
     * @returns {HRESULT} 
     */
    ExecuteSearch(pQuery, pProfile, lCookie) {
        result := ComCall(4, this, "ptr", pQuery, "ptr", pProfile, "ptr", lCookie, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRTCUserSearch.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateQuery := CallbackCreate(GetMethod(implObj, "CreateQuery"), flags, 2)
        this.vtbl.ExecuteSearch := CallbackCreate(GetMethod(implObj, "ExecuteSearch"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateQuery)
        CallbackFree(this.vtbl.ExecuteSearch)
    }
}
