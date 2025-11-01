#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Indicates that an object supports property pages.
 * @remarks
 * 
  *  A property page object manages a particular page within a property sheet. A property page implements at least <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ipropertypage">IPropertyPage</a> and can optionally implement <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ipropertypage2">IPropertyPage2</a> if selection of a specific property is supported.
  * 
  * An object specifies its support for property pages by implementing <b>ISpecifyPropertyPages</b>. Through this interface the caller can obtain a list of CLSIDs identifying the specific property pages that the object supports. If the object specifies a property page CLSID, the object must be able to receive property changes from the property page.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-ispecifypropertypages
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
     * 
     * @param {Pointer<CAUUID>} pPages 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ispecifypropertypages-getpages
     */
    GetPages(pPages) {
        result := ComCall(3, this, "ptr", pPages, "HRESULT")
        return result
    }
}
