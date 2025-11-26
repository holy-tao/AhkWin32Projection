#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWCWizardCallback interface is called by a Failover Cluster Administrator extension to add a property page to a Failover Cluster Administrator Wizard and to manage navigation.
 * @remarks
 * 
 * Use the <i>piCallback</i> pointer that you receive when Failover Cluster Administrator calls 
 *      your 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nf-cluadmex-iweextendwizard-createwizardpages">IWEExtendWizard::CreateWizardPages</a> 
 *      method to call the methods of the <b>IWCWizardCallback</b> 
 *      interface.
 * 
 * Use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nn-cluadmex-iwcwizard97callback">IWCWizard97Callback</a> to add Wizard97 pages.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//cluadmex/nn-cluadmex-iwcwizardcallback
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class IWCWizardCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWCWizardCallback
     * @type {Guid}
     */
    static IID => Guid("{97dede62-fc6b-11cf-b5f5-00a0c90ab505}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddWizardPage", "EnableNext"]

    /**
     * Adds a property page to a Failover Cluster Administrator Wizard.
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
     * @see https://docs.microsoft.com/windows/win32/api//cluadmex/nf-cluadmex-iwcwizardcallback-addwizardpage
     */
    AddWizardPage(hpage) {
        hpageMarshal := hpage is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, hpageMarshal, hpage, "HRESULT")
        return result
    }

    /**
     * Enables or disables the Next or Finish button on a Failover Cluster Administrator Wizard page, depending on whether the current page is last.
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
     * @see https://docs.microsoft.com/windows/win32/api//cluadmex/nf-cluadmex-iwcwizardcallback-enablenext
     */
    EnableNext(hpage, bEnable) {
        hpageMarshal := hpage is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, hpageMarshal, hpage, "int", bEnable, "HRESULT")
        return result
    }
}
