#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLAreasCollection.ahk" { IHTMLAreasCollection }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLMapElement extends IDispatch {
    /**
     * The interface identifier for IHTMLMapElement
     * @type {Guid}
     */
    static IID := Guid("{3050f266-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLMapElement
     * @type {Guid}
     */
    static CLSID := Guid("{3050f271-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLMapElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_areas : IntPtr
        put_name  : IntPtr
        get_name  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLMapElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IHTMLAreasCollection} 
     */
    areas {
        get => this.get_areas()
    }

    /**
     * @type {BSTR} 
     */
    name {
        get => this.get_name()
        set => this.put_name(value)
    }

    /**
     * 
     * @returns {IHTMLAreasCollection} 
     */
    get_areas() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLAreasCollection(p)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_name(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(8, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_name() {
        p := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLMapElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_areas := CallbackCreate(GetMethod(implObj, "get_areas"), flags, 2)
        this.vtbl.put_name := CallbackCreate(GetMethod(implObj, "put_name"), flags, 2)
        this.vtbl.get_name := CallbackCreate(GetMethod(implObj, "get_name"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_areas)
        CallbackFree(this.vtbl.put_name)
        CallbackFree(this.vtbl.get_name)
    }
}
