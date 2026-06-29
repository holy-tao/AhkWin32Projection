#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLAreasCollection3 extends IDispatch {
    /**
     * The interface identifier for IHTMLAreasCollection3
     * @type {Guid}
     */
    static IID := Guid("{3050f837-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLAreasCollection3 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        namedItem : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLAreasCollection3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {IDispatch} 
     */
    namedItem(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(7, this, BSTR, name, "ptr*", &pdisp := 0, "HRESULT")
        return IDispatch(pdisp)
    }

    Query(iid) {
        if (IHTMLAreasCollection3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.namedItem := CallbackCreate(GetMethod(implObj, "namedItem"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.namedItem)
    }
}
