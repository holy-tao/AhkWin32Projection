#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IHTMLEventObj.ahk" { IHTMLEventObj }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IElementBehaviorSiteOM extends IUnknown {
    /**
     * The interface identifier for IElementBehaviorSiteOM
     * @type {Guid}
     */
    static IID := Guid("{3050f489-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IElementBehaviorSiteOM interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RegisterEvent     : IntPtr
        GetEventCookie    : IntPtr
        FireEvent         : IntPtr
        CreateEventObject : IntPtr
        RegisterName      : IntPtr
        RegisterUrn       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IElementBehaviorSiteOM.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pchEvent 
     * @param {Integer} lFlags 
     * @returns {Integer} 
     */
    RegisterEvent(pchEvent, lFlags) {
        pchEvent := pchEvent is String ? StrPtr(pchEvent) : pchEvent

        result := ComCall(3, this, "ptr", pchEvent, "int", lFlags, "int*", &plCookie := 0, "HRESULT")
        return plCookie
    }

    /**
     * 
     * @param {PWSTR} pchEvent 
     * @returns {Integer} 
     */
    GetEventCookie(pchEvent) {
        pchEvent := pchEvent is String ? StrPtr(pchEvent) : pchEvent

        result := ComCall(4, this, "ptr", pchEvent, "int*", &plCookie := 0, "HRESULT")
        return plCookie
    }

    /**
     * 
     * @param {Integer} lCookie 
     * @param {IHTMLEventObj} pEventObject 
     * @returns {HRESULT} 
     */
    FireEvent(lCookie, pEventObject) {
        result := ComCall(5, this, "int", lCookie, "ptr", pEventObject, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IHTMLEventObj} 
     */
    CreateEventObject() {
        result := ComCall(6, this, "ptr*", &ppEventObject := 0, "HRESULT")
        return IHTMLEventObj(ppEventObject)
    }

    /**
     * 
     * @param {PWSTR} pchName 
     * @returns {HRESULT} 
     */
    RegisterName(pchName) {
        pchName := pchName is String ? StrPtr(pchName) : pchName

        result := ComCall(7, this, "ptr", pchName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pchUrn 
     * @returns {HRESULT} 
     */
    RegisterUrn(pchUrn) {
        pchUrn := pchUrn is String ? StrPtr(pchUrn) : pchUrn

        result := ComCall(8, this, "ptr", pchUrn, "HRESULT")
        return result
    }

    Query(iid) {
        if (IElementBehaviorSiteOM.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RegisterEvent := CallbackCreate(GetMethod(implObj, "RegisterEvent"), flags, 4)
        this.vtbl.GetEventCookie := CallbackCreate(GetMethod(implObj, "GetEventCookie"), flags, 3)
        this.vtbl.FireEvent := CallbackCreate(GetMethod(implObj, "FireEvent"), flags, 3)
        this.vtbl.CreateEventObject := CallbackCreate(GetMethod(implObj, "CreateEventObject"), flags, 2)
        this.vtbl.RegisterName := CallbackCreate(GetMethod(implObj, "RegisterName"), flags, 2)
        this.vtbl.RegisterUrn := CallbackCreate(GetMethod(implObj, "RegisterUrn"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RegisterEvent)
        CallbackFree(this.vtbl.GetEventCookie)
        CallbackFree(this.vtbl.FireEvent)
        CallbackFree(this.vtbl.CreateEventObject)
        CallbackFree(this.vtbl.RegisterName)
        CallbackFree(this.vtbl.RegisterUrn)
    }
}
