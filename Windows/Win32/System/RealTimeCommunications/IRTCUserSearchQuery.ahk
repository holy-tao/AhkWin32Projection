#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\RTC_USER_SEARCH_PREFERENCE.ahk" { RTC_USER_SEARCH_PREFERENCE }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCUserSearchQuery extends IUnknown {
    /**
     * The interface identifier for IRTCUserSearchQuery
     * @type {Guid}
     */
    static IID := Guid("{288300f5-d23a-4365-9a73-9985c98c2881}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCUserSearchQuery interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        put_SearchTerm       : IntPtr
        get_SearchTerm       : IntPtr
        get_SearchTerms      : IntPtr
        put_SearchPreference : IntPtr
        get_SearchPreference : IntPtr
        put_SearchDomain     : IntPtr
        get_SearchDomain     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCUserSearchQuery.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    SearchTerms {
        get => this.get_SearchTerms()
    }

    /**
     * @type {BSTR} 
     */
    SearchDomain {
        get => this.get_SearchDomain()
        set => this.put_SearchDomain(value)
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrValue 
     * @returns {HRESULT} 
     */
    put_SearchTerm(bstrName, bstrValue) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrValue := bstrValue is String ? BSTR.Alloc(bstrValue).Value : bstrValue

        result := ComCall(3, this, BSTR, bstrName, BSTR, bstrValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {BSTR} 
     */
    get_SearchTerm(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        pbstrValue := BSTR.Owned()
        result := ComCall(4, this, BSTR, bstrName, BSTR.Ptr, pbstrValue, "HRESULT")
        return pbstrValue
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_SearchTerms() {
        pbstrNames := BSTR.Owned()
        result := ComCall(5, this, BSTR.Ptr, pbstrNames, "HRESULT")
        return pbstrNames
    }

    /**
     * 
     * @param {RTC_USER_SEARCH_PREFERENCE} enPreference 
     * @param {Integer} lValue 
     * @returns {HRESULT} 
     */
    put_SearchPreference(enPreference, lValue) {
        result := ComCall(6, this, RTC_USER_SEARCH_PREFERENCE, enPreference, "int", lValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {RTC_USER_SEARCH_PREFERENCE} enPreference 
     * @returns {Integer} 
     */
    get_SearchPreference(enPreference) {
        result := ComCall(7, this, RTC_USER_SEARCH_PREFERENCE, enPreference, "int*", &plValue := 0, "HRESULT")
        return plValue
    }

    /**
     * 
     * @param {BSTR} bstrDomain 
     * @returns {HRESULT} 
     */
    put_SearchDomain(bstrDomain) {
        bstrDomain := bstrDomain is String ? BSTR.Alloc(bstrDomain).Value : bstrDomain

        result := ComCall(8, this, BSTR, bstrDomain, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_SearchDomain() {
        pbstrDomain := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbstrDomain, "HRESULT")
        return pbstrDomain
    }

    Query(iid) {
        if (IRTCUserSearchQuery.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_SearchTerm := CallbackCreate(GetMethod(implObj, "put_SearchTerm"), flags, 3)
        this.vtbl.get_SearchTerm := CallbackCreate(GetMethod(implObj, "get_SearchTerm"), flags, 3)
        this.vtbl.get_SearchTerms := CallbackCreate(GetMethod(implObj, "get_SearchTerms"), flags, 2)
        this.vtbl.put_SearchPreference := CallbackCreate(GetMethod(implObj, "put_SearchPreference"), flags, 3)
        this.vtbl.get_SearchPreference := CallbackCreate(GetMethod(implObj, "get_SearchPreference"), flags, 3)
        this.vtbl.put_SearchDomain := CallbackCreate(GetMethod(implObj, "put_SearchDomain"), flags, 2)
        this.vtbl.get_SearchDomain := CallbackCreate(GetMethod(implObj, "get_SearchDomain"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_SearchTerm)
        CallbackFree(this.vtbl.get_SearchTerm)
        CallbackFree(this.vtbl.get_SearchTerms)
        CallbackFree(this.vtbl.put_SearchPreference)
        CallbackFree(this.vtbl.get_SearchPreference)
        CallbackFree(this.vtbl.put_SearchDomain)
        CallbackFree(this.vtbl.get_SearchDomain)
    }
}
