#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IElementNamespace extends IUnknown {
    /**
     * The interface identifier for IElementNamespace
     * @type {Guid}
     */
    static IID := Guid("{3050f671-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IElementNamespace interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddTag : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IElementNamespace.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} bstrTagName 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     */
    AddTag(bstrTagName, lFlags) {
        bstrTagName := bstrTagName is String ? BSTR.Alloc(bstrTagName).Value : bstrTagName

        result := ComCall(3, this, BSTR, bstrTagName, "int", lFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IElementNamespace.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddTag := CallbackCreate(GetMethod(implObj, "AddTag"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddTag)
    }
}
