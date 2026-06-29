#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IRTCEnumUserSearchResults.ahk" { IRTCEnumUserSearchResults }
#Import ".\IRTCUserSearchQuery.ahk" { IRTCUserSearchQuery }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\IRTCProfile2.ahk" { IRTCProfile2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRTCCollection.ahk" { IRTCCollection }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCUserSearchResultsEvent extends IDispatch {
    /**
     * The interface identifier for IRTCUserSearchResultsEvent
     * @type {Guid}
     */
    static IID := Guid("{d8c8c3cd-7fac-4088-81c5-c24cbc0938e3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCUserSearchResultsEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        EnumerateResults  : IntPtr
        get_Results       : IntPtr
        get_Profile       : IntPtr
        get_Query         : IntPtr
        get_Cookie        : IntPtr
        get_StatusCode    : IntPtr
        get_MoreAvailable : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCUserSearchResultsEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IRTCCollection} 
     */
    Results {
        get => this.get_Results()
    }

    /**
     * @type {IRTCProfile2} 
     */
    Profile {
        get => this.get_Profile()
    }

    /**
     * @type {IRTCUserSearchQuery} 
     */
    Query {
        get => this.get_Query()
    }

    /**
     * @type {Pointer} 
     */
    Cookie {
        get => this.get_Cookie()
    }

    /**
     * @type {Integer} 
     */
    StatusCode {
        get => this.get_StatusCode()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    MoreAvailable {
        get => this.get_MoreAvailable()
    }

    /**
     * 
     * @returns {IRTCEnumUserSearchResults} 
     */
    EnumerateResults() {
        result := ComCall(7, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IRTCEnumUserSearchResults(ppEnum)
    }

    /**
     * 
     * @returns {IRTCCollection} 
     */
    get_Results() {
        result := ComCall(8, this, "ptr*", &ppCollection := 0, "HRESULT")
        return IRTCCollection(ppCollection)
    }

    /**
     * 
     * @returns {IRTCProfile2} 
     */
    get_Profile() {
        result := ComCall(9, this, "ptr*", &ppProfile := 0, "HRESULT")
        return IRTCProfile2(ppProfile)
    }

    /**
     * 
     * @returns {IRTCUserSearchQuery} 
     */
    get_Query() {
        result := ComCall(10, this, "ptr*", &ppQuery := 0, "HRESULT")
        return IRTCUserSearchQuery(ppQuery)
    }

    /**
     * 
     * @returns {Pointer} 
     */
    get_Cookie() {
        result := ComCall(11, this, "ptr*", &plCookie := 0, "HRESULT")
        return plCookie
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StatusCode() {
        result := ComCall(12, this, "int*", &plStatusCode := 0, "HRESULT")
        return plStatusCode
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_MoreAvailable() {
        result := ComCall(13, this, VARIANT_BOOL.Ptr, &pfMoreAvailable := 0, "HRESULT")
        return pfMoreAvailable
    }

    Query(iid) {
        if (IRTCUserSearchResultsEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumerateResults := CallbackCreate(GetMethod(implObj, "EnumerateResults"), flags, 2)
        this.vtbl.get_Results := CallbackCreate(GetMethod(implObj, "get_Results"), flags, 2)
        this.vtbl.get_Profile := CallbackCreate(GetMethod(implObj, "get_Profile"), flags, 2)
        this.vtbl.get_Query := CallbackCreate(GetMethod(implObj, "get_Query"), flags, 2)
        this.vtbl.get_Cookie := CallbackCreate(GetMethod(implObj, "get_Cookie"), flags, 2)
        this.vtbl.get_StatusCode := CallbackCreate(GetMethod(implObj, "get_StatusCode"), flags, 2)
        this.vtbl.get_MoreAvailable := CallbackCreate(GetMethod(implObj, "get_MoreAvailable"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumerateResults)
        CallbackFree(this.vtbl.get_Results)
        CallbackFree(this.vtbl.get_Profile)
        CallbackFree(this.vtbl.get_Query)
        CallbackFree(this.vtbl.get_Cookie)
        CallbackFree(this.vtbl.get_StatusCode)
        CallbackFree(this.vtbl.get_MoreAvailable)
    }
}
