#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Called by a Failover Cluster Administrator extension to retrieve information about a cluster object.
 * @remarks
 * 
  * You can use the <b>IGetClusterObjectInfo</b> interface 
  *      when Failover Cluster Administrator calls your implementations of the following methods:
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
  *      <b>IGetClusterObjectInfo</b> methods.
  * 
  * Do not obtain other information interfaces, such as 
  *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nn-cluadmex-igetclustergroupinfo">IGetClusterGroupInfo</a>, from the 
  *      <b>IGetClusterObjectInfo</b> interface. While 
  *      <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> will return a valid interface, 
  *      the operation is not valid in the context of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/c-gly">cluster</a>, 
  *      and the result is an interface that represents no real cluster object. For an illustration, see 
  *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nn-cluadmex-igetclusterresourceinfo">IGetClusterResourceInfo</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//cluadmex/nn-cluadmex-igetclusterobjectinfo
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class IGetClusterObjectInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGetClusterObjectInfo
     * @type {Guid}
     */
    static IID => Guid("{97dede52-fc6b-11cf-b5f5-00a0c90ab505}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetObjectName", "GetObjectType"]

    /**
     * 
     * @param {Integer} lObjIndex 
     * @param {BSTR} lpszName 
     * @param {Pointer<Integer>} pcchName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cluadmex/nf-cluadmex-igetclusterobjectinfo-getobjectname
     */
    GetObjectName(lObjIndex, lpszName, pcchName) {
        lpszName := lpszName is String ? BSTR.Alloc(lpszName).Value : lpszName

        result := ComCall(3, this, "int", lObjIndex, "ptr", lpszName, "int*", pcchName, "HRESULT")
        return result
    }

    /**
     * The GetObjectType retrieves the type of the specified object.
     * @param {Integer} lObjIndex 
     * @returns {Integer} If the function succeeds, the return value identifies the object. This value can be one of the following.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>OBJ_BITMAP</td>
     * <td>Bitmap</td>
     * </tr>
     * <tr>
     * <td>OBJ_BRUSH</td>
     * <td>Brush</td>
     * </tr>
     * <tr>
     * <td>OBJ_COLORSPACE</td>
     * <td>Color space</td>
     * </tr>
     * <tr>
     * <td>OBJ_DC</td>
     * <td>Device context</td>
     * </tr>
     * <tr>
     * <td>OBJ_ENHMETADC</td>
     * <td>Enhanced metafile DC</td>
     * </tr>
     * <tr>
     * <td>OBJ_ENHMETAFILE</td>
     * <td>Enhanced metafile</td>
     * </tr>
     * <tr>
     * <td>OBJ_EXTPEN</td>
     * <td>Extended pen</td>
     * </tr>
     * <tr>
     * <td>OBJ_FONT</td>
     * <td>Font</td>
     * </tr>
     * <tr>
     * <td>OBJ_MEMDC</td>
     * <td>Memory DC</td>
     * </tr>
     * <tr>
     * <td>OBJ_METAFILE</td>
     * <td>Metafile</td>
     * </tr>
     * <tr>
     * <td>OBJ_METADC</td>
     * <td>Metafile DC</td>
     * </tr>
     * <tr>
     * <td>OBJ_PAL</td>
     * <td>Palette</td>
     * </tr>
     * <tr>
     * <td>OBJ_PEN</td>
     * <td>Pen</td>
     * </tr>
     * <tr>
     * <td>OBJ_REGION</td>
     * <td>Region</td>
     * </tr>
     * </table>
     *  
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getobjecttype
     */
    GetObjectType(lObjIndex) {
        result := ComCall(4, this, "int", lObjIndex, "int")
        return result
    }
}
