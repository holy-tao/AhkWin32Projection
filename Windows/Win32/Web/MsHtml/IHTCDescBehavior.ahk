#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTCDescBehavior extends IDispatch {
    /**
     * The interface identifier for IHTCDescBehavior
     * @type {Guid}
     */
    static IID := Guid("{3050f5dc-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTCDescBehavior
     * @type {Guid}
     */
    static CLSID := Guid("{3050f5dd-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTCDescBehavior interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_urn  : IntPtr
        get_name : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTCDescBehavior.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    urn {
        get => this.get_urn()
    }

    /**
     * @type {BSTR} 
     */
    name {
        get => this.get_name()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_urn() {
        p := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_name() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTCDescBehavior.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_urn := CallbackCreate(GetMethod(implObj, "get_urn"), flags, 2)
        this.vtbl.get_name := CallbackCreate(GetMethod(implObj, "get_name"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_urn)
        CallbackFree(this.vtbl.get_name)
    }
}
