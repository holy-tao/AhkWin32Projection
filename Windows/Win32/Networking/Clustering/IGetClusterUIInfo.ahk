#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\Graphics\Gdi\HFONT.ahk
#Include ..\..\UI\WindowsAndMessaging\HICON.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Called by a Failover Cluster Administrator extension to retrieve information about Failover Cluster Administrator's user interface.
 * @remarks
 * 
  * You can use the <b>IGetClusterUIInfo</b> interface when 
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
  *      <b>IGetClusterUIInfo</b> methods.
  * 
  * Do not obtain other information interfaces, such as 
  *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nn-cluadmex-igetclustergroupinfo">IGetClusterGroupInfo</a>, from the 
  *      <b>IGetClusterUIInfo</b> interface. While 
  *      <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> will return a valid interface, 
  *      the operation is not valid in the context of the cluster, and the result is an interface that represents no real 
  *      cluster object. For an illustration, see 
  *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nn-cluadmex-igetclusterresourceinfo">IGetClusterResourceInfo</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//cluadmex/nn-cluadmex-igetclusteruiinfo
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class IGetClusterUIInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGetClusterUIInfo
     * @type {Guid}
     */
    static IID => Guid("{97dede50-fc6b-11cf-b5f5-00a0c90ab505}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetClusterName", "GetLocale", "GetFont", "GetIcon"]

    /**
     * 
     * @param {BSTR} lpszName 
     * @param {Pointer<Integer>} pcchName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cluadmex/nf-cluadmex-igetclusteruiinfo-getclustername
     */
    GetClusterName(lpszName, pcchName) {
        lpszName := lpszName is String ? BSTR.Alloc(lpszName).Value : lpszName

        pcchNameMarshal := pcchName is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", lpszName, pcchNameMarshal, pcchName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/cluadmex/nf-cluadmex-igetclusteruiinfo-getlocale
     */
    GetLocale() {
        result := ComCall(4, this, "uint")
        return result
    }

    /**
     * 
     * @returns {HFONT} 
     * @see https://learn.microsoft.com/windows/win32/api/cluadmex/nf-cluadmex-igetclusteruiinfo-getfont
     */
    GetFont() {
        result := ComCall(5, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {HICON} 
     * @see https://learn.microsoft.com/windows/win32/api/cluadmex/nf-cluadmex-igetclusteruiinfo-geticon
     */
    GetIcon() {
        result := ComCall(6, this, "ptr")
        return result
    }
}
