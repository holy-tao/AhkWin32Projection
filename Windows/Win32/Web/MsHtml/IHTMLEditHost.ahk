#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLElement.ahk" { IHTMLElement }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ELEMENT_CORNER.ahk" { ELEMENT_CORNER }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLEditHost extends IUnknown {
    /**
     * The interface identifier for IHTMLEditHost
     * @type {Guid}
     */
    static IID := Guid("{3050f6a0-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLEditHost interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SnapRect : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLEditHost.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IHTMLElement} pIElement 
     * @param {Pointer<RECT>} prcNew 
     * @param {ELEMENT_CORNER} eHandle 
     * @returns {HRESULT} 
     */
    SnapRect(pIElement, prcNew, eHandle) {
        result := ComCall(3, this, "ptr", pIElement, RECT.Ptr, prcNew, ELEMENT_CORNER, eHandle, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHTMLEditHost.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SnapRect := CallbackCreate(GetMethod(implObj, "SnapRect"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SnapRect)
    }
}
