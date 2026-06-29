#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISegment.ahk" { ISegment }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLElement.ahk" { IHTMLElement }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IElementSegment extends ISegment {
    /**
     * The interface identifier for IElementSegment
     * @type {Guid}
     */
    static IID := Guid("{3050f68f-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IElementSegment interfaces
    */
    struct Vtbl extends ISegment.Vtbl {
        GetElement : IntPtr
        SetPrimary : IntPtr
        IsPrimary  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IElementSegment.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    GetElement() {
        result := ComCall(4, this, "ptr*", &ppIElement := 0, "HRESULT")
        return IHTMLElement(ppIElement)
    }

    /**
     * 
     * @param {BOOL} fPrimary 
     * @returns {HRESULT} 
     */
    SetPrimary(fPrimary) {
        result := ComCall(5, this, BOOL, fPrimary, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsPrimary() {
        result := ComCall(6, this, BOOL.Ptr, &pfPrimary := 0, "HRESULT")
        return pfPrimary
    }

    Query(iid) {
        if (IElementSegment.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetElement := CallbackCreate(GetMethod(implObj, "GetElement"), flags, 2)
        this.vtbl.SetPrimary := CallbackCreate(GetMethod(implObj, "SetPrimary"), flags, 2)
        this.vtbl.IsPrimary := CallbackCreate(GetMethod(implObj, "IsPrimary"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetElement)
        CallbackFree(this.vtbl.SetPrimary)
        CallbackFree(this.vtbl.IsPrimary)
    }
}
