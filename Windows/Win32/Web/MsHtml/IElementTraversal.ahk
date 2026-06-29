#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLElement.ahk" { IHTMLElement }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IElementTraversal extends IDispatch {
    /**
     * The interface identifier for IElementTraversal
     * @type {Guid}
     */
    static IID := Guid("{30510736-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IElementTraversal interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_firstElementChild      : IntPtr
        get_lastElementChild       : IntPtr
        get_previousElementSibling : IntPtr
        get_nextElementSibling     : IntPtr
        get_childElementCount      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IElementTraversal.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IHTMLElement} 
     */
    firstElementChild {
        get => this.get_firstElementChild()
    }

    /**
     * @type {IHTMLElement} 
     */
    lastElementChild {
        get => this.get_lastElementChild()
    }

    /**
     * @type {IHTMLElement} 
     */
    previousElementSibling {
        get => this.get_previousElementSibling()
    }

    /**
     * @type {IHTMLElement} 
     */
    nextElementSibling {
        get => this.get_nextElementSibling()
    }

    /**
     * @type {Integer} 
     */
    childElementCount {
        get => this.get_childElementCount()
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    get_firstElementChild() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElement(p)
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    get_lastElementChild() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElement(p)
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    get_previousElementSibling() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElement(p)
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    get_nextElementSibling() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElement(p)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_childElementCount() {
        result := ComCall(11, this, "int*", &p := 0, "HRESULT")
        return p
    }

    Query(iid) {
        if (IElementTraversal.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_firstElementChild := CallbackCreate(GetMethod(implObj, "get_firstElementChild"), flags, 2)
        this.vtbl.get_lastElementChild := CallbackCreate(GetMethod(implObj, "get_lastElementChild"), flags, 2)
        this.vtbl.get_previousElementSibling := CallbackCreate(GetMethod(implObj, "get_previousElementSibling"), flags, 2)
        this.vtbl.get_nextElementSibling := CallbackCreate(GetMethod(implObj, "get_nextElementSibling"), flags, 2)
        this.vtbl.get_childElementCount := CallbackCreate(GetMethod(implObj, "get_childElementCount"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_firstElementChild)
        CallbackFree(this.vtbl.get_lastElementChild)
        CallbackFree(this.vtbl.get_previousElementSibling)
        CallbackFree(this.vtbl.get_nextElementSibling)
        CallbackFree(this.vtbl.get_childElementCount)
    }
}
