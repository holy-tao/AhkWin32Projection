#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWCWizardCallback interface is called by a Failover Cluster Administrator extension to add a property page to a Failover Cluster Administrator Wizard and to manage navigation.
 * @remarks
 * Use the <i>piCallback</i> pointer that you receive when Failover Cluster Administrator calls 
 *      your 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nf-cluadmex-iweextendwizard-createwizardpages">IWEExtendWizard::CreateWizardPages</a> 
 *      method to call the methods of the <b>IWCWizardCallback</b> 
 *      interface.
 * 
 * Use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nn-cluadmex-iwcwizard97callback">IWCWizard97Callback</a> to add Wizard97 pages.
 * @see https://learn.microsoft.com/windows/win32/api/cluadmex/nn-cluadmex-iwcwizardcallback
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct IWCWizardCallback extends IUnknown {
    /**
     * The interface identifier for IWCWizardCallback
     * @type {Guid}
     */
    static IID := Guid("{97dede62-fc6b-11cf-b5f5-00a0c90ab505}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWCWizardCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddWizardPage : IntPtr
        EnableNext    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWCWizardCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Adds a property page to a Failover Cluster Administrator Wizard.
     * @remarks
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-administrator">Failover Cluster Administrator</a> extensions call the 
     *      <b>AddWizardPage</b> method from their 
     *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nf-cluadmex-iweextendwizard-createwizardpages">IWEExtendWizard::CreateWizardPages</a> 
     *      methods. Before calling <b>AddWizardPage</b>, 
     *      extensions must call the function 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/prsht/nf-prsht-createpropertysheetpagea">CreatePropertySheetPage</a> to retrieve a 
     *      handle to pass in the <i>hpage</i> parameter.
     * 
     * Use 
     *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nf-cluadmex-iwcwizard97callback-addwizard97page">IWCWizard97Calllback::AddWizard97Page</a> 
     *      to add Wizard97 pages.
     * @param {Pointer<Integer>} hpage Handle to the property page to be added.
     * @returns {HRESULT} If <b>AddWizardPage</b> is not successful, 
     *        it can return other <b>HRESULT</b> values.
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
     * @see https://learn.microsoft.com/windows/win32/api/cluadmex/nf-cluadmex-iwcwizardcallback-addwizardpage
     */
    AddWizardPage(hpage) {
        hpageMarshal := hpage is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, hpageMarshal, hpage, "HRESULT")
        return result
    }

    /**
     * Enables or disables the Next or Finish button on a Failover Cluster Administrator Wizard page, depending on whether the current page is last.
     * @remarks
     * Extensions should call the <b>EnableNext</b> 
     *      method in their handling of the <b>PSN_SETACTIVE</b> message for a property page that 
     *      they have added to the Failover Cluster Administrator Wizard. 
     *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-administrator">Failover Cluster Administrator</a> determines whether 
     *      the <b>Next</b> or <b>Finish</b> button should be displayed based on 
     *      the page specified in the <i>hpage</i> parameter.
     * 
     * For Wizard97 pages, use 
     *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nf-cluadmex-iwcwizard97callback-enablenext">IWCWizard97Callback::EnableNext</a>.
     * @param {Pointer<Integer>} hpage Handle to the property page containing the button to be enabled or disabled.
     * @param {BOOL} bEnable Value indicating whether to enable or disable the button. If <i>bEnable</i> is set to 
     *        <b>TRUE</b>, the appropriate button is enabled. If <i>bEnable</i> is set 
     *        to <b>FALSE</b>, it is disabled.
     * @returns {HRESULT} If <b>EnableNext</b> is not successful, it 
     *        can return other <b>HRESULT</b> values.
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
     * @see https://learn.microsoft.com/windows/win32/api/cluadmex/nf-cluadmex-iwcwizardcallback-enablenext
     */
    EnableNext(hpage, bEnable) {
        hpageMarshal := hpage is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, hpageMarshal, hpage, BOOL, bEnable, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWCWizardCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddWizardPage := CallbackCreate(GetMethod(implObj, "AddWizardPage"), flags, 2)
        this.vtbl.EnableNext := CallbackCreate(GetMethod(implObj, "EnableNext"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddWizardPage)
        CallbackFree(this.vtbl.EnableNext)
    }
}
