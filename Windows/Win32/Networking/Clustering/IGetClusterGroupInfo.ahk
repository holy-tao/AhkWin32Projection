#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IGetClusterGroupInfo interface is called by a Failover Cluster Administrator extension to retrieve information about a group.
 * @remarks
 * 
  * If the object being extended is not a group, queries for 
  *      <b>IGetClusterGroupInfo</b> methods will fail. Otherwise, 
  *      you can use the <b>IGetClusterGroupInfo</b> interface when 
  *      Failover Cluster Administrator calls your implementations of the following methods:
  * 
  * <ul>
  * <li>
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nf-cluadmex-iweextendpropertysheet-createpropertysheetpages">IWEExtendPropertySheet::CreatePropertySheetPages</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nf-cluadmex-iweextendcontextmenu-addcontextmenuitems">IWEExtendContextMenu::AddContextMenuItems</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nf-cluadmex-iweextendwizard-createwizardpages">IWEExtendWizard::CreateWizardPages</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nf-cluadmex-iweextendwizard97-createwizard97pages">IWEExtendWizard97::CreateWizard97Pages</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nf-cluadmex-iweinvokecommand-invokecommand">IWEInvokeCommand::InvokeCommand</a>
  * </li>
  * </ul>
  * Failover Cluster Administrator passes in an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> 
  *      interface pointer, <i>piData</i>. Use <i>piData</i> to call 
  *      <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> for one of the 
  *      <b>IGetClusterGroupInfo</b> methods.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//cluadmex/nn-cluadmex-igetclustergroupinfo
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class IGetClusterGroupInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGetClusterGroupInfo
     * @type {Guid}
     */
    static IID => Guid("{97dede54-fc6b-11cf-b5f5-00a0c90ab505}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetGroupHandle"]

    /**
     * 
     * @param {Integer} lObjIndex 
     * @returns {HGROUP} 
     * @see https://learn.microsoft.com/windows/win32/api/cluadmex/nf-cluadmex-igetclustergroupinfo-getgrouphandle
     */
    GetGroupHandle(lObjIndex) {
        result := ComCall(3, this, "int", lObjIndex, "ptr")
        return result
    }
}
