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
     * Returns the name of a cluster object.
     * @param {Integer} lObjIndex A number representing the zero-based index of the target object. <i>lObjIndex</i> is 
     *        restricted to the number that can be retrieved by calling 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nf-cluadmex-igetclusterdatainfo-getobjectcount">IGetClusterDataInfo::GetObjectCount</a>.
     * @param {BSTR} lpszName Pointer to a null-terminated Unicode string containing the name of the object associated with 
     *        <i>lObjIndex</i>. The <i>lpszName</i> parameter can be 
     *        <b>NULL</b>, indicating that the caller is requesting only the name length. Although 
     *        declared as a <b>BSTR</b>, this parameter is implemented as an 
     *        <b>LPWSTR</b>.
     * @param {Pointer<Integer>} pcchName On input, pointer to the count of characters in the buffer pointed to by the 
     *        <i>lpszName</i> parameter. The <i>pcchName</i> parameter cannot be 
     *        <b>NULL</b>. On output, pointer to the count of characters in the name stored in the content 
     *        of <i>lpszName</i>, including the <b>NULL</b>-terminating character.
     * @returns {HRESULT} If <b>GetObjectName</b> is not 
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
     * One or more of the parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_MORE_DATA)</b></dt>
     * <dt>0x800700ea</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by <i>lpszName</i> is too small to hold the requested name. 
     *          <a href="/previous-versions/windows/desktop/api/cluadmex/nf-cluadmex-igetclusterobjectinfo-getobjectname">GetObjectName</a> returns the 
     *          required number of characters in the content of <i>pcchName</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//cluadmex/nf-cluadmex-igetclusterobjectinfo-getobjectname
     */
    GetObjectName(lObjIndex, lpszName, pcchName) {
        lpszName := lpszName is String ? BSTR.Alloc(lpszName).Value : lpszName

        pcchNameMarshal := pcchName is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "int", lObjIndex, "ptr", lpszName, pcchNameMarshal, pcchName, "HRESULT")
        return result
    }

    /**
     * Returns the type of a cluster object.
     * @param {Integer} lObjIndex A number representing the zero-based index of the target object. This parameter is restricted to the number 
     *        that can be retrieved by calling 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nf-cluadmex-igetclusterdatainfo-getobjectcount">IGetClusterDataInfo::GetObjectCount</a>.
     * @returns {Integer} If <a href="/previous-versions/windows/desktop/api/cluadmex/nf-cluadmex-igetclusterobjectinfo-getobjecttype">GetObjectType</a> is 
     *         successful, it returns one of the following values enumerated by the 
     *         <b>CLUADMEX_OBJECT_TYPE</b> enumeration representing the object types:
     * 
     * 
     * 
     * If <b>GetObjectType</b> is not 
     *        successful, it returns –1. For more information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//cluadmex/nf-cluadmex-igetclusterobjectinfo-getobjecttype
     */
    GetObjectType(lObjIndex) {
        result := ComCall(4, this, "int", lObjIndex, "int")
        return result
    }
}
