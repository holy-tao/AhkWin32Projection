#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWCWizard97Callback interface is called by a Failover Cluster Administrator extension to add a Wizard97 property page to a Wizard97 wizard, such as the Cluster Application Wizard.
 * @remarks
 * Use the piCallback pointer that you receive when Cluster Administrator calls your 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nf-cluadmex-iweextendwizard97-createwizard97pages">IWEExtendWizard97::CreateWizard97Pages</a> 
 *      method to call the methods of the 
 *      <b>IWCWizard97Callback</b> interface.
 * 
 * To add non-Wizard97 pages use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nn-cluadmex-iwcwizardcallback">IWCWizardCallback</a>.
 * @see https://learn.microsoft.com/windows/win32/api/cluadmex/nn-cluadmex-iwcwizard97callback
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct IWCWizard97Callback extends IUnknown {
    /**
     * The interface identifier for IWCWizard97Callback
     * @type {Guid}
     */
    static IID := Guid("{97dede67-fc6b-11cf-b5f5-00a0c90ab505}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWCWizard97Callback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddWizard97Page : IntPtr
        EnableNext      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWCWizard97Callback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Adds a Wizard97 property page to a Wizard97 wizard, such as the Failover Cluster Application Wizard.
     * @remarks
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-administrator">Failover Cluster Administrator</a> extensions call the 
     *      <b>AddWizard97Page</b> method from their 
     *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nf-cluadmex-iweextendwizard97-createwizard97pages">IWEExtendWizard97::CreateWizard97Pages</a> 
     *      methods. Before calling 
     *      <b>AddWizard97Page</b>, extensions must 
     *      call the function <a href="https://docs.microsoft.com/windows/desktop/api/prsht/nf-prsht-createpropertysheetpagea">CreatePropertySheetPage</a> 
     *      to retrieve a handle to pass in the <i>hpage</i> parameter.
     * 
     * To add non-Wizard97 pages, use 
     *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nf-cluadmex-iwcwizardcallback-addwizardpage">IWCWizardCallback::AddWizardPage</a>.
     * @param {Pointer<Integer>} hpage Handle to the property page to be added.
     * @returns {HRESULT} If <b>AddWizard97Page</b> is not 
     *        successful, it can return other <b>HRESULT</b> values.
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
     * The <i>hpage</i> parameter represents an unknown page.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/cluadmex/nf-cluadmex-iwcwizard97callback-addwizard97page
     */
    AddWizard97Page(hpage) {
        hpageMarshal := hpage is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, hpageMarshal, hpage, "HRESULT")
        return result
    }

    /**
     * Enables or disables the Next or Finish button on a Wizard97 wizard page, depending on whether the current page is last.
     * @remarks
     * Extensions should call the <b>EnableNext</b> 
     *      method in their handling of the <b>PSN_SETACTIVE</b> message for a property page that 
     *      they have added to the Failover Cluster Administrator Wizard. 
     *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-administrator">Failover Cluster Administrator</a> determines whether 
     *      the <b>Next</b> or <b>Finish</b> button should be displayed based on 
     *      the page specified in the <i>hpage</i> parameter.
     * 
     * For non-Wizard97 pages use 
     *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nf-cluadmex-iwcwizardcallback-enablenext">IWCWizardCallback::EnableNext</a>.
     * @param {Pointer<Integer>} hpage Handle to the property page containing the button to be enabled or disabled.
     * @param {BOOL} bEnable Value indicating whether to enable or disable the button. If <i>bEnable</i> is set to 
     *        <b>TRUE</b>, the appropriate button is enabled. If <i>bEnable</i> is set 
     *        to <b>FALSE</b>, it is disabled.
     * @returns {HRESULT} If <b>EnableNext</b> is not successful, it can return other 
     *        <b>HRESULT</b> values.
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
     * The <i>hpage</i> parameter represents an unknown page.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/cluadmex/nf-cluadmex-iwcwizard97callback-enablenext
     */
    EnableNext(hpage, bEnable) {
        hpageMarshal := hpage is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, hpageMarshal, hpage, BOOL, bEnable, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWCWizard97Callback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddWizard97Page := CallbackCreate(GetMethod(implObj, "AddWizard97Page"), flags, 2)
        this.vtbl.EnableNext := CallbackCreate(GetMethod(implObj, "EnableNext"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddWizard97Page)
        CallbackFree(this.vtbl.EnableNext)
    }
}
