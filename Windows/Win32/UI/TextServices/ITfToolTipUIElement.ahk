#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITfUIElement.ahk" { ITfUIElement }

/**
 * The ITfToolTipUIElement interface is implemented by a text service that wants to show a tooltip on its UI.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itftooltipuielement
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfToolTipUIElement extends ITfUIElement {
    /**
     * The interface identifier for ITfToolTipUIElement
     * @type {Guid}
     */
    static IID := Guid("{52b18b5c-555d-46b2-b00a-fa680144fbdb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfToolTipUIElement interfaces
    */
    struct Vtbl extends ITfUIElement.Vtbl {
        GetString : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfToolTipUIElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns the string of the tooltip.
     * @returns {BSTR} [out] A pointer to receive BSTR. This is the string for the tooltip.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itftooltipuielement-getstring
     */
    GetString() {
        _pstr := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, _pstr, "HRESULT")
        return _pstr
    }

    Query(iid) {
        if (ITfToolTipUIElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetString := CallbackCreate(GetMethod(implObj, "GetString"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetString)
    }
}
