#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Gets and sets the numeric value (Code Page identifier) of the ANSI code page.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-iquerycodepage
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IQueryCodePage extends IUnknown {
    /**
     * The interface identifier for IQueryCodePage
     * @type {Guid}
     */
    static IID := Guid("{c7b236ce-ee80-11d0-985f-006008059382}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IQueryCodePage interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCodePage : IntPtr
        SetCodePage : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IQueryCodePage.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the numeric value (Code Page identifier) of the ANSI code page.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * The numeric value (Code Page identifier) of the ANSI code page.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iquerycodepage-getcodepage
     */
    GetCodePage() {
        result := ComCall(3, this, "uint*", &puiCodePage := 0, "HRESULT")
        return puiCodePage
    }

    /**
     * Sets the numeric value of the ANSI code page to a specified code page identifier.
     * @param {Integer} uiCodePage Type: <b>UINT</b>
     * 
     * The numeric value of the ANSI code page you want to set.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iquerycodepage-setcodepage
     */
    SetCodePage(uiCodePage) {
        result := ComCall(4, this, "uint", uiCodePage, "HRESULT")
        return result
    }

    Query(iid) {
        if (IQueryCodePage.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCodePage := CallbackCreate(GetMethod(implObj, "GetCodePage"), flags, 2)
        this.vtbl.SetCodePage := CallbackCreate(GetMethod(implObj, "SetCodePage"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCodePage)
        CallbackFree(this.vtbl.SetCodePage)
    }
}
