#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPropertyPage.ahk

/**
 * An extension to IPropertyPage to support initial selection of a property on a page.
 * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nn-ocidl-ipropertypage2
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
     * Specifies which field is to receive the focus when the property page is activated.
     * @remarks
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * If this method is called before a page is activated, the page should store the property and set the focus to it in the next call to <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipropertypage-activate">IPropertyPage::Activate</a>. If the page is already active, <b>EditProperty</b> should set the focus to the specific property field.
     * @param {Integer} dispID The property that is to receive the focus.
     * @returns {HRESULT} This method can return the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method is not currently implemented; the interface is probably provided in anticipation of future work on this page.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nf-ocidl-ipropertypage2-editproperty
     */
    EditProperty(dispID) {
        result := ComCall(14, this, "int", dispID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
