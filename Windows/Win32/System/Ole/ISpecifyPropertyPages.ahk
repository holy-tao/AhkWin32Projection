#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\CAUUID.ahk" { CAUUID }

/**
 * Indicates that an object supports property pages.
 * @remarks
 * A property page object manages a particular page within a property sheet. A property page implements at least <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ipropertypage">IPropertyPage</a> and can optionally implement <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ipropertypage2">IPropertyPage2</a> if selection of a specific property is supported.
 * 
 * An object specifies its support for property pages by implementing <b>ISpecifyPropertyPages</b>. Through this interface the caller can obtain a list of CLSIDs identifying the specific property pages that the object supports. If the object specifies a property page CLSID, the object must be able to receive property changes from the property page.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/nn-ocidl-ispecifypropertypages
 * @namespace Windows.Win32.System.Ole
 */
export default struct ISpecifyPropertyPages extends IUnknown {
    /**
     * The interface identifier for ISpecifyPropertyPages
     * @type {Guid}
     */
    static IID := Guid("{b196b28b-bab4-101a-b69c-00aa00341d07}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpecifyPropertyPages interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPages : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpecifyPropertyPages.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a list of property pages that can be displayed in this object's property sheet.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ns-ocidl-cauuid">CAUUID</a> structure is caller-allocated, but is not initialized by the caller. The <b>GetPages</b> method fills the <b>cElements</b> member in the structure. This method also allocates memory for the array pointed to by the <b>pElems</b> member using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>. Then, it fills the newly allocated array. After this method returns successfully, the structure contains a counted array of UUIDs, each UUID specifying a property page CLSID.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * The caller must release the memory pointed to by the <b>pElems</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ns-ocidl-cauuid">CAUUID</a>, using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> when it is no longer needed.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * E_NOTIMPL is not allowed as a return value, because an object with no property pages should not expose the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ispecifypropertypages">ISpecifyPropertyPages</a> interface.
     * @returns {CAUUID} A pointer to a caller-allocated <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ns-ocidl-cauuid">CAUUID</a> structure that must be initialized and filled before returning. The <b>pElems</b> member in the structure is allocated by the callee with <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> and freed by the caller with <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ispecifypropertypages-getpages
     */
    GetPages() {
        pPages := CAUUID()
        result := ComCall(3, this, CAUUID.Ptr, pPages, "HRESULT")
        return pPages
    }

    Query(iid) {
        if (ISpecifyPropertyPages.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPages := CallbackCreate(GetMethod(implObj, "GetPages"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPages)
    }
}
