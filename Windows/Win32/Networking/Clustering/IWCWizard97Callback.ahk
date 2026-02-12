#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWCWizard97Callback interface is called by a Failover Cluster Administrator extension to add a Wizard97 property page to a Wizard97 wizard, such as the Cluster Application Wizard.
 * @remarks
 * Use the piCallback pointer that you receive when Cluster Administrator calls your 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nf-cluadmex-iweextendwizard97-createwizard97pages">IWEExtendWizard97::CreateWizard97Pages</a> 
 *      method to call the methods of the 
 *      <b>IWCWizard97Callback</b> interface.
 * 
 * To add non-Wizard97 pages use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nn-cluadmex-iwcwizardcallback">IWCWizardCallback</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/cluadmex/nn-cluadmex-iwcwizard97callback
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class IWCWizard97Callback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWCWizard97Callback
     * @type {Guid}
     */
    static IID => Guid("{97dede67-fc6b-11cf-b5f5-00a0c90ab505}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddWizard97Page", "EnableNext"]

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
     * @see https://learn.microsoft.com/windows/win32/api//content/cluadmex/nf-cluadmex-iwcwizard97callback-addwizard97page
     */
    AddWizard97Page(hpage) {
        hpageMarshal := hpage is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, hpageMarshal, hpage, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/cluadmex/nf-cluadmex-iwcwizard97callback-enablenext
     */
    EnableNext(hpage, bEnable) {
        hpageMarshal := hpage is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, hpageMarshal, hpage, "int", bEnable, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
