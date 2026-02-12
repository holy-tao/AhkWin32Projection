#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implement the IWEExtendWizard interface to add wizard pages to Failover Cluster Administrator's New Resource Wizard or Cluster Application Wizard.
 * @remarks
 * To support Wizard97 wizards and wizard pages, implement the 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nn-cluadmex-iweextendwizard97">IWEExtendWizard97</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api//content/cluadmex/nn-cluadmex-iweextendwizard
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class IWEExtendWizard extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWEExtendWizard
     * @type {Guid}
     */
    static IID => Guid("{97dede63-fc6b-11cf-b5f5-00a0c90ab505}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWizardPages"]

    /**
     * Allows you to create wizard pages and add them to Failover Cluster Administrator's New Resource Wizard or Cluster Application Wizard.
     * @remarks
     * To add Wizard97 wizard pages, use the 
     *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nf-cluadmex-iweextendwizard97-createwizard97pages">IWEExtendWizard97::CreateWizard97Pages</a> 
     *      method.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * <p class="proch"><b>For each property page to be added</b>
     * 
     * <ol>
     * <li>Use <i>piData</i> to call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> and retrieve an interface 
     *        pointer for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-objects">cluster object</a> associated with the new 
     *        page. For example, if you are adding a property page for a resource, you want to retrieve a pointer to the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nn-cluadmex-igetclusterresourceinfo">IGetClusterResourceInfo</a> interface. 
     *        Although it is possible to successfully query for interfaces that retrieve data unrelated to the object being 
     *        extended, you should expect to receive errors when you attempt to call the methods.</li>
     * <li>
     * To create the page, call the function 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/prsht/nf-prsht-createpropertysheetpagea">CreatePropertySheetPage</a>. To produce pages 
     *        that look like the pages provided by Cluster Administrator, each new property page should be no larger than 252 
     *        dialog units wide and 218 dialog units high, and should contain two standard controls:
     * 
     * <ul>
     * <li>For the object icon, an icon control positioned at (8,7) with a size of (18,20).</li>
     * <li>For the object name, a static control positioned at (38,12) with a size of (247,10).</li>
     * </ul>
     * </li>
     * <li>To add the page to a Cluster Administrator Wizard, call 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nf-cluadmex-iwcwizardcallback-addwizardpage">IWCWizardCallback::AddWizardPage</a> 
     *        using the <i>piCallback</i> pointer.</li>
     * </ol>
     * @param {IUnknown} piData <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface pointer for retrieving information 
     *        relating to the wizard pages to be added. By calling 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a> with the 
     *        <i>piData</i> pointer, the following interfaces are available:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nn-cluadmex-igetclusteruiinfo">IGetClusterUIInfo</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nn-cluadmex-igetclusterdatainfo">IGetClusterDataInfo</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nn-cluadmex-igetclusterobjectinfo">IGetClusterObjectInfo</a>
     * </li>
     * </ul>
     * Depending on the type of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/c-gly">cluster object</a> for 
     *        which the wizard page is being created, a pointer to one of the following interfaces is also available:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nn-cluadmex-igetclusternodeinfo">IGetClusterNodeInfo</a>, if the property page 
     *         relates to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/nodes">node</a>.</li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nn-cluadmex-igetclustergroupinfo">IGetClusterGroupInfo</a>, if the property page 
     *         relates to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/groups">group</a>.</li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nn-cluadmex-igetclusternetworkinfo">IGetClusterNetworkInfo</a>, if the property 
     *         page relates to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/networks">network</a>.</li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nn-cluadmex-igetclusternetinterfaceinfo">IGetClusterNetInterfaceInfo</a>, if the 
     *         property page relates to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/network-interfaces">network interface</a>.</li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nn-cluadmex-igetclusterresourceinfo">IGetClusterResourceInfo</a>, if the property 
     *         page relates to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resources">resource</a>.</li>
     * </ul>
     * @param {IWCWizardCallback} piCallback Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nn-cluadmex-iwcwizardcallback">IWCWizardCallback</a> interface 
     *        implementation used to add the new property pages to the wizard.
     * @returns {HRESULT} Return one of the following values or any <b>HRESULT</b> that describes the results of 
     *        the operation.
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
     * At least one of the parameters is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * <dt>0x80004001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The extension does not support adding a property page to the Create Group Wizard or Create Resource 
     *          Wizard.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/cluadmex/nf-cluadmex-iweextendwizard-createwizardpages
     */
    CreateWizardPages(piData, piCallback) {
        result := ComCall(3, this, "ptr", piData, "ptr", piCallback, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
