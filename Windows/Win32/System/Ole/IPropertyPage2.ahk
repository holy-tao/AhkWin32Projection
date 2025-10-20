#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPropertyPage.ahk

/**
 * An extension to IPropertyPage to support initial selection of a property on a page.
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-ipropertypage2
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IPropertyPage2 extends IPropertyPage{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertyPage2
     * @type {Guid}
     */
    static IID => Guid("{01e44665-24ac-101b-84ed-08002b2ec713}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EditProperty"]

    /**
     * 
     * @param {Integer} dispID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipropertypage2-editproperty
     */
    EditProperty(dispID) {
        result := ComCall(14, this, "int", dispID, "HRESULT")
        return result
    }
}
