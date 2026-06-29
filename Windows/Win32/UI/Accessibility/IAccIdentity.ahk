#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a method that provides a unique identifier for an accessible element.
 * @see https://learn.microsoft.com/windows/win32/api/oleacc/nn-oleacc-iaccidentity
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IAccIdentity extends IUnknown {
    /**
     * The interface identifier for IAccIdentity
     * @type {Guid}
     */
    static IID := Guid("{7852b78d-1cfd-41c1-a615-9c0c85960b5f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAccIdentity interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetIdentityString : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAccIdentity.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a string of bytes (an identity string) that uniquely identifies an accessible element.
     * @remarks
     * The returned string should be considered opaque; clients should use it only as a whole, and should not attempt to dissect it or otherwise interpret it manually.
     * 
     * If a client knows or expects that a string is HWND—based, it can use <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nf-oleacc-iaccpropservices-decomposehwndidentitystring">IAccPropServices::DecomposeHwndIdentityString</a> to attempt to decompose the identity string.
     * @param {Integer} dwIDChild Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Specifies which child of the <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> object the caller wants to identify.
     * @param {Pointer<Pointer<Integer>>} ppIDString Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a>**</b>
     * 
     * Address of a variable that receives a pointer to a callee-allocated identity string. The callee allocates the identity string using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>; the caller must release the identity string by using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> when finished.
     * @param {Pointer<Integer>} pdwIDStringLen Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * Address of a variable that receives the length, in bytes, of the callee-allocated identity string.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Return S_OK, except under exceptional error conditions, such as low memory. If not supported, calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccidentity">IAccIdentity</a> should fail.
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccidentity-getidentitystring
     */
    GetIdentityString(dwIDChild, ppIDString, pdwIDStringLen) {
        ppIDStringMarshal := ppIDString is VarRef ? "ptr*" : "ptr"
        pdwIDStringLenMarshal := pdwIDStringLen is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", dwIDChild, ppIDStringMarshal, ppIDString, pdwIDStringLenMarshal, pdwIDStringLen, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAccIdentity.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetIdentityString := CallbackCreate(GetMethod(implObj, "GetIdentityString"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetIdentityString)
    }
}
