#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPropertyPage.ahk" { IPropertyPage }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * An extension to IPropertyPage to support initial selection of a property on a page.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/nn-ocidl-ipropertypage2
 * @namespace Windows.Win32.System.Ole
 */
export default struct IPropertyPage2 extends IPropertyPage {
    /**
     * The interface identifier for IPropertyPage2
     * @type {Guid}
     */
    static IID := Guid("{01e44665-24ac-101b-84ed-08002b2ec713}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPropertyPage2 interfaces
    */
    struct Vtbl extends IPropertyPage.Vtbl {
        EditProperty : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPropertyPage2.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipropertypage2-editproperty
     */
    EditProperty(dispID) {
        result := ComCall(14, this, "int", dispID, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPropertyPage2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EditProperty := CallbackCreate(GetMethod(implObj, "EditProperty"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EditProperty)
    }
}
