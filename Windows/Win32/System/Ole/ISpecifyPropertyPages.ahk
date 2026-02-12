#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\CAUUID.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Indicates that an object supports property pages.
 * @remarks
 * A property page object manages a particular page within a property sheet. A property page implements at least <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ipropertypage">IPropertyPage</a> and can optionally implement <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ipropertypage2">IPropertyPage2</a> if selection of a specific property is supported.
 * 
 * An object specifies its support for property pages by implementing <b>ISpecifyPropertyPages</b>. Through this interface the caller can obtain a list of CLSIDs identifying the specific property pages that the object supports. If the object specifies a property page CLSID, the object must be able to receive property changes from the property page.
 * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nn-ocidl-ispecifypropertypages
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class ISpecifyPropertyPages extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpecifyPropertyPages
     * @type {Guid}
     */
    static IID => Guid("{b196b28b-bab4-101a-b69c-00aa00341d07}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPages"]

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
     * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nf-ocidl-ispecifypropertypages-getpages
     */
    GetPages() {
        pPages := CAUUID()
        result := ComCall(3, this, "ptr", pPages, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pPages
    }
}
