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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetResourceHandle", "GetResourceTypeName", "GetResourceNetworkName"]

    /**
     * Returns a handle to a resource.
     * @param {Integer} lObjIndex A number representing the zero-based index of the target resource. <i>lObjIndex</i> is 
     *        restricted to the number that can be retrieved by calling 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nf-cluadmex-igetclusterdatainfo-getobjectcount">IGetClusterDataInfo::GetObjectCount</a>.
     * @returns {HRESOURCE} If <b>GetResourceHandle</b> is 
     *        successful, it returns a handle for the resource represented by <i>lObjIndex</i>.
     * 
     * If <b>GetResourceHandle</b> is 
     *        not successful, it returns <b>NULL</b>. For more information about the error, call the 
     *        function <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//cluadmex/nf-cluadmex-igetclusterresourceinfo-getresourcehandle
     */
    GetResourceHandle(lObjIndex) {
        result := ComCall(3, this, "int", lObjIndex, "ptr")
        return result
    }

    /**
     * Returns the type of a resource.
     * @param {Integer} lObjIndex A number representing the zero-based index of the target resource. <i>lObjIndex</i> is 
     *        restricted to the number that can be retrieved by calling 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nf-cluadmex-igetclusterdatainfo-getobjectcount">IGetClusterDataInfo::GetObjectCount</a>.
     * @param {BSTR} lpszResTypeName Pointer to the type of the resource associated with <i>lObjIndex</i>. The 
     *        <i>lpResTypeName</i> parameter can be <b>NULL</b>, indicating that the 
     *        caller is requesting only the length of the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-types">resource type</a>. Although declared as a 
     *        <b>BSTR</b>, this parameter is implemented as an <b>LPWSTR</b>.
     * @param {Pointer<Integer>} pcchResTypeName On input, pointer to the count of characters in the buffer pointed to by the 
     *        <i>lpResTypeName</i> parameter. The <i>pcchResTypeName</i> parameter 
     *        cannot be <b>NULL</b>. On output, pointer to the count of characters in the resource type 
     *        name stored in the content of <i>lpResTypeName</i>, including the 
     *        <b>NULL</b>-terminating character.
     * @returns {HRESULT} If <b>GetResourceTypeName</b> 
     *        is not successful, it can return other <b>HRESULT</b> values.
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
     * The buffer pointed to by <i>lpResTypeName</i> is too small to hold the requested 
     *          resource type. 
     *          <a href="/previous-versions/windows/desktop/api/cluadmex/nf-cluadmex-igetclusterresourceinfo-getresourcetypename">GetResourceTypeName</a> 
     *          returns the required number of characters in the content of <i>pcchResTypeName</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//cluadmex/nf-cluadmex-igetclusterresourceinfo-getresourcetypename
     */
    GetResourceTypeName(lObjIndex, lpszResTypeName, pcchResTypeName) {
        lpszResTypeName := lpszResTypeName is String ? BSTR.Alloc(lpszResTypeName).Value : lpszResTypeName

        pcchResTypeNameMarshal := pcchResTypeName is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "int", lObjIndex, "ptr", lpszResTypeName, pcchResTypeNameMarshal, pcchResTypeName, "HRESULT")
        return result
    }

    /**
     * Returns the name of the network managed by the Network Name resource on which a resource depends.
     * @param {Integer} lObjIndex A number representing the zero-based index of the target resource. The target resource may or may not depend 
     *        on a Network Name resource. <i>lObjIndex</i> is restricted to the number that can be 
     *        retrieved by calling 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nf-cluadmex-igetclusterdatainfo-getobjectcount">IGetClusterDataInfo::GetObjectCount</a>.
     * @param {BSTR} lpszNetName Pointer to a null-terminated Unicode string containing the name of the network upon which the resource 
     *        indexed by <i>lObjIndex</i> depends. Although declared as a 
     *        <b>BSTR</b>, this parameter is implemented as an <b>LPWSTR</b>.
     * @param {Pointer<Integer>} pcchNetName Pointer to the maximum count in characters of the buffer pointed to by <i>lpszNetName</i>. 
     *        On input, this value should be large enough to contain <b>MAX_COMPUTERNAME_LENGTH</b> + 1 
     *        characters. On output, <i>pcchNetName</i> points to the actual number of characters copied 
     *        to the content of <i>lpszNetName</i>.
     * @returns {BOOL} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource indexed by <i>lObjIndex</i> has a 
     *          <a href="/previous-versions/windows/desktop/mscs/resource-dependencies">dependency</a> on a 
     *          <a href="/previous-versions/windows/desktop/mscs/network-name">Network Name</a> resource, and the name of the 
     *          network was successfully returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource indexed by <i>lObjIndex</i> does not have a dependency on a Network Name 
     *          resource.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//cluadmex/nf-cluadmex-igetclusterresourceinfo-getresourcenetworkname
     */
    GetResourceNetworkName(lObjIndex, lpszNetName, pcchNetName) {
        lpszNetName := lpszNetName is String ? BSTR.Alloc(lpszNetName).Value : lpszNetName

        pcchNetNameMarshal := pcchNetName is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "int", lObjIndex, "ptr", lpszNetName, pcchNetNameMarshal, pcchNetName, "int")
        return result
    }
}
