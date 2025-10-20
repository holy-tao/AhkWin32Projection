#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Called by a Failover Cluster Administrator extension to retrieve information about a resource.
 * @remarks
 * 
  * If the object being extended is not a resource, queries for 
  *      <b>IGetClusterResourceInfo</b> methods will fail. 
  *      Otherwise, you can use the 
  *      <b>IGetClusterResourceInfo</b> interface when Failover 
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
  * Failover Cluster Administrator passes in an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointer, 
  *      <i>piData</i>. Use <i>piData</i> to call 
  *      <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> for one of the 
  *      <b>IGetClusterResourceInfo</b> methods.
  * 
  * Use the <b>IGetClusterResourceInfo</b> interface only 
  *      in the context of a resource extension. Do not obtain other information interfaces, such as 
  *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nn-cluadmex-igetclustergroupinfo">IGetClusterGroupInfo</a>, from the 
  *      <b>IGetClusterResourceInfo</b> interface. While 
  *      <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> will return a valid interface, 
  *      the operation is not valid in the context of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/c-gly">cluster</a>, 
  *      and the result is an interface that represents no real cluster object.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//cluadmex/nn-cluadmex-igetclusterresourceinfo
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class IGetClusterResourceInfo extends IUnknown{
    /**
     * The interface identifier for IGetClusterResourceInfo
     * @type {Guid}
     */
    static IID => Guid("{97dede55-fc6b-11cf-b5f5-00a0c90ab505}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} lObjIndex 
     * @returns {HRESOURCE} 
     */
    GetResourceHandle(lObjIndex) {
        result := ComCall(3, this, "int", lObjIndex, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} lObjIndex 
     * @param {BSTR} lpszResTypeName 
     * @param {Pointer<Int32>} pcchResTypeName 
     * @returns {HRESULT} 
     */
    GetResourceTypeName(lObjIndex, lpszResTypeName, pcchResTypeName) {
        lpszResTypeName := lpszResTypeName is String ? BSTR.Alloc(lpszResTypeName).Value : lpszResTypeName

        result := ComCall(4, this, "int", lObjIndex, "ptr", lpszResTypeName, "int*", pcchResTypeName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lObjIndex 
     * @param {BSTR} lpszNetName 
     * @param {Pointer<UInt32>} pcchNetName 
     * @returns {BOOL} 
     */
    GetResourceNetworkName(lObjIndex, lpszNetName, pcchNetName) {
        lpszNetName := lpszNetName is String ? BSTR.Alloc(lpszNetName).Value : lpszNetName

        result := ComCall(5, this, "int", lObjIndex, "ptr", lpszNetName, "uint*", pcchNetName, "int")
        return result
    }
}
