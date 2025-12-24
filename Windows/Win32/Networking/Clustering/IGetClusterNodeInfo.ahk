#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IGetClusterNodeInfo interface is called by a Failover Cluster Administrator extension to retrieve information about a node.
 * @remarks
 * 
 * If the object being extended is not a node, queries for 
 *      <b>IGetClusterNodeInfo</b> methods will fail. Otherwise, 
 *      you can use the <b>IGetClusterNodeInfo</b> interface when 
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
 * Failover Cluster Administrator passes in an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointer, 
 *      <i>piData</i>. Use <i>piData</i> to call 
 *      <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> for one of the 
 *      <b>IGetClusterNodeInfo</b> methods.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//cluadmex/nn-cluadmex-igetclusternodeinfo
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class IGetClusterNodeInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGetClusterNodeInfo
     * @type {Guid}
     */
    static IID => Guid("{97dede53-fc6b-11cf-b5f5-00a0c90ab505}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNodeHandle"]

    /**
     * Returns a handle to a node.
     * @param {Integer} lObjIndex A number representing the zero-based index of the target node. <i>lObjIndex</i> is 
     *        restricted to the number that can be retrieved by calling 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nf-cluadmex-igetclusterdatainfo-getobjectcount">IGetClusterDataInfo::GetObjectCount</a>.
     * @returns {HNODE} If <b>GetNodeHandle</b> is successful, 
     *        it returns a handle for the node represented by <i>lObjIndex</i>.
     * 
     * If <b>GetNodeHandle</b> is not 
     *        successful, it returns <b>NULL</b>. For more information about the error, call the function 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//cluadmex/nf-cluadmex-igetclusternodeinfo-getnodehandle
     */
    GetNodeHandle(lObjIndex) {
        result := ComCall(3, this, "int", lObjIndex, "ptr")
        return result
    }
}
