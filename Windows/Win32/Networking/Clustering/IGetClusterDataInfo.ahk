#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\HCLUSTER.ahk" { HCLUSTER }

/**
 * The IGetClusterDataInfo interface is called by a Failover Cluster Administrator extension to retrieve information about a cluster.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/cluadmex/nn-cluadmex-igetclusterdatainfo
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct IGetClusterDataInfo extends IUnknown {
    /**
     * The interface identifier for IGetClusterDataInfo
     * @type {Guid}
     */
    static IID := Guid("{97dede51-fc6b-11cf-b5f5-00a0c90ab505}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGetClusterDataInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetClusterName   : IntPtr
        GetClusterHandle : IntPtr
        GetObjectCount   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGetClusterDataInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns the name of the cluster. (IGetClusterDataInfo.GetClusterName)
     * @remarks
     * If the <i>lpszName</i> parameter is set to <b>NULL</b> and the 
     *      <i>pcchName</i> parameter is not set to <b>NULL</b>, the 
     *      <b>GetClusterName</b> method returns 
     *      <b>NOERROR</b>.
     * @param {BSTR} lpszName Pointer to a null-terminated Unicode string containing the name of the cluster; or 
     *        <b>NULL</b> to indicate that the caller is requesting only the length of the name. Although 
     *        declared as a <b>BSTR</b>, this parameter is implemented as an 
     *        <b>LPWSTR</b>.
     * @param {Pointer<Integer>} pcchName On input, pointer to the size of the buffer, in characters, pointed to by the 
     *        <i>lpszName</i> parameter. On output, pointer to the total number of characters in the 
     *        buffer including the <b>NULL</b>-terminating character.
     * @returns {HRESULT} If <b>GetClusterName</b> is not 
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
     *          <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nf-cluadmex-igetclusterdatainfo-getclustername">GetClusterName</a> returns the 
     *          required number of characters in the content of <i>pcchName</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/cluadmex/nf-cluadmex-igetclusterdatainfo-getclustername
     */
    GetClusterName(lpszName, pcchName) {
        lpszName := lpszName is String ? BSTR.Alloc(lpszName).Value : lpszName

        pcchNameMarshal := pcchName is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, BSTR, lpszName, pcchNameMarshal, pcchName, "HRESULT")
        return result
    }

    /**
     * Returns a handle to the cluster.
     * @returns {HCLUSTER} A cluster handle.
     * @see https://learn.microsoft.com/windows/win32/api/cluadmex/nf-cluadmex-igetclusterdatainfo-getclusterhandle
     */
    GetClusterHandle() {
        result := ComCall(4, this, HCLUSTER)
        return result
    }

    /**
     * Returns a count of the number of selected cluster objects.
     * @remarks
     * Because <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-administrator">Failover Cluster Administrator</a> supports 
     *      only one selected object, the 
     *      <b>GetObjectCount</b> method always returns 
     *      1.
     * @returns {Integer} A count of the number of selected objects.
     * @see https://learn.microsoft.com/windows/win32/api/cluadmex/nf-cluadmex-igetclusterdatainfo-getobjectcount
     */
    GetObjectCount() {
        result := ComCall(5, this, Int32)
        return result
    }

    Query(iid) {
        if (IGetClusterDataInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetClusterName := CallbackCreate(GetMethod(implObj, "GetClusterName"), flags, 3)
        this.vtbl.GetClusterHandle := CallbackCreate(GetMethod(implObj, "GetClusterHandle"), flags, 1)
        this.vtbl.GetObjectCount := CallbackCreate(GetMethod(implObj, "GetObjectCount"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetClusterName)
        CallbackFree(this.vtbl.GetClusterHandle)
        CallbackFree(this.vtbl.GetObjectCount)
    }
}
