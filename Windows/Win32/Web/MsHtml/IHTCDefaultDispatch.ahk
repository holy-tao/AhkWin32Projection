#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLElement.ahk" { IHTMLElement }
#Import ".\IHTMLEventObj.ahk" { IHTMLEventObj }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTCDefaultDispatch extends IDispatch {
    /**
     * The interface identifier for IHTCDefaultDispatch
     * @type {Guid}
     */
    static IID := Guid("{3050f4fd-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTCDefaultDispatch
     * @type {Guid}
     */
    static CLSID := Guid("{3050f4fc-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTCDefaultDispatch interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_element       : IntPtr
        createEventObject : IntPtr
        get_defaults      : IntPtr
        get_document      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTCDefaultDispatch.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IHTMLElement} 
     */
    element {
        get => this.get_element()
    }

    /**
     * @type {IDispatch} 
     */
    defaults {
        get => this.get_defaults()
    }

    /**
     * @type {IDispatch} 
     */
    document {
        get => this.get_document()
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    get_element() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElement(p)
    }

    /**
     * 
     * @returns {IHTMLEventObj} 
     */
    createEventObject() {
        result := ComCall(8, this, "ptr*", &eventObj := 0, "HRESULT")
        return IHTMLEventObj(eventObj)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_defaults() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_document() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    Query(iid) {
        if (IHTCDefaultDispatch.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_element := CallbackCreate(GetMethod(implObj, "get_element"), flags, 2)
        this.vtbl.createEventObject := CallbackCreate(GetMethod(implObj, "createEventObject"), flags, 2)
        this.vtbl.get_defaults := CallbackCreate(GetMethod(implObj, "get_defaults"), flags, 2)
        this.vtbl.get_document := CallbackCreate(GetMethod(implObj, "get_document"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_element)
        CallbackFree(this.vtbl.createEventObject)
        CallbackFree(this.vtbl.get_defaults)
        CallbackFree(this.vtbl.get_document)
    }
}
