#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IGetClusterDataInfo interface is called by a Failover Cluster Administrator extension to retrieve information about a cluster.
 * @remarks
 * 
  * You can use the <b>IGetClusterDataInfo</b> interface when 
  *      Cluster Administrator calls your implementations of the following methods:
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
  * Failover Cluster Administrator passes in an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointer as the 
  *      <i>piData</i> parameter for these methods. Use <i>piData</i> to call the 
  *      <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method for one of the 
  *      <b>IGetClusterDataInfo</b> methods.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//cluadmex/nn-cluadmex-igetclusterdatainfo
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class IGetClusterDataInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGetClusterDataInfo
     * @type {Guid}
     */
    static IID => Guid("{97dede51-fc6b-11cf-b5f5-00a0c90ab505}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetClusterName", "GetClusterHandle", "GetObjectCount"]

    /**
     * 
     * @param {BSTR} lpszName 
     * @param {Pointer<Integer>} pcchName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cluadmex/nf-cluadmex-igetclusterdatainfo-getclustername
     */
    GetClusterName(lpszName, pcchName) {
        lpszName := lpszName is String ? BSTR.Alloc(lpszName).Value : lpszName

        pcchNameMarshal := pcchName is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", lpszName, pcchNameMarshal, pcchName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HCLUSTER} 
     * @see https://learn.microsoft.com/windows/win32/api/cluadmex/nf-cluadmex-igetclusterdatainfo-getclusterhandle
     */
    GetClusterHandle() {
        result := ComCall(4, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/cluadmex/nf-cluadmex-igetclusterdatainfo-getobjectcount
     */
    GetObjectCount() {
        result := ComCall(5, this, "int")
        return result
    }
}
