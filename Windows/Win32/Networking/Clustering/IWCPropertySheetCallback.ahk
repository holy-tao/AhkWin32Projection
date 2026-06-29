#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWCPropertySheetCallback interface is called by a Failover Cluster Administrator extension to add property pages to a Failover Cluster Administrator property sheet.
 * @remarks
 * Use the <i>piCallback</i> pointer that you receive when Failover Cluster Administrator calls 
 *      your 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nf-cluadmex-iweextendpropertysheet-createpropertysheetpages">IWEExtendPropertySheet::CreatePropertySheetPages</a> 
 *      method to call the <b>IWCPropertySheetCallback</b> 
 *      interface.
 * @see https://learn.microsoft.com/windows/win32/api/cluadmex/nn-cluadmex-iwcpropertysheetcallback
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct IWCPropertySheetCallback extends IUnknown {
    /**
     * The interface identifier for IWCPropertySheetCallback
     * @type {Guid}
     */
    static IID := Guid("{97dede60-fc6b-11cf-b5f5-00a0c90ab505}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWCPropertySheetCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddPropertySheetPage : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWCPropertySheetCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Adds a property page to a Failover Cluster Administrator property sheet.
     * @remarks
     * Call the 
     *      <b>AddPropertySheetPage</b> 
     *      method from your 
     *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nf-cluadmex-iweextendpropertysheet-createpropertysheetpages">IWEExtendPropertySheet::CreatePropertySheetPages</a> 
     *      implementation. However, before you call 
     *      <b>AddPropertySheetPage</b>, 
     *      call the function <a href="https://docs.microsoft.com/windows/desktop/api/prsht/nf-prsht-createpropertysheetpagea">CreatePropertySheetPage</a> 
     *      to retrieve a handle to pass in the <i>hpage</i> parameter.
     * @param {Pointer<Integer>} hpage Handle to the property page to be added.
     * @returns {HRESULT} If 
     *        <b>AddPropertySheetPage</b> 
     *        was not successful, it can return other <b>HRESULT</b> values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NOERROR</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * <dt>0x80070057</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hpage</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/cluadmex/nf-cluadmex-iwcpropertysheetcallback-addpropertysheetpage
     */
    AddPropertySheetPage(hpage) {
        hpageMarshal := hpage is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, hpageMarshal, hpage, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWCPropertySheetCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddPropertySheetPage := CallbackCreate(GetMethod(implObj, "AddPropertySheetPage"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddPropertySheetPage)
    }
}
