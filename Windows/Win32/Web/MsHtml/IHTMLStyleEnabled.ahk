#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLStyleEnabled extends IDispatch {
    /**
     * The interface identifier for IHTMLStyleEnabled
     * @type {Guid}
     */
    static IID := Guid("{305104c2-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLStyleEnabled interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        msGetPropertyEnabled : IntPtr
        msPutPropertyEnabled : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLStyleEnabled.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {VARIANT_BOOL} 
     */
    msGetPropertyEnabled(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(7, this, BSTR, name, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {VARIANT_BOOL} b 
     * @returns {HRESULT} 
     */
    msPutPropertyEnabled(name, b) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(8, this, BSTR, name, VARIANT_BOOL, b, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHTMLStyleEnabled.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.msGetPropertyEnabled := CallbackCreate(GetMethod(implObj, "msGetPropertyEnabled"), flags, 3)
        this.vtbl.msPutPropertyEnabled := CallbackCreate(GetMethod(implObj, "msPutPropertyEnabled"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.msGetPropertyEnabled)
        CallbackFree(this.vtbl.msPutPropertyEnabled)
    }
}
