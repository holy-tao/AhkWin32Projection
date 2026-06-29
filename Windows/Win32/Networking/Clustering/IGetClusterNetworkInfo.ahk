#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\HNETWORK.ahk" { HNETWORK }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Called by a Failover Cluster Administrator extension to retrieve information about a network.
 * @remarks
 * If the object being extended is not a network, queries for 
 *      <b>IGetClusterNetworkInfo</b> methods will fail. 
 *      Otherwise, you can use the 
 *      <b>IGetClusterNetworkInfo</b> interface when Failover 
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
 *      <b>IGetClusterNetworkInfo</b> methods.
 * @see https://learn.microsoft.com/windows/win32/api/cluadmex/nn-cluadmex-igetclusternetworkinfo
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct IGetClusterNetworkInfo extends IUnknown {
    /**
     * The interface identifier for IGetClusterNetworkInfo
     * @type {Guid}
     */
    static IID := Guid("{97dede56-fc6b-11cf-b5f5-00a0c90ab505}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGetClusterNetworkInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetNetworkHandle : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGetClusterNetworkInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a handle to a network.
     * @remarks
     * Do not close the handle obtained through this method.
     * @param {Integer} lObjIndex A number representing the zero-based index of the target network. <i>lObjIndex</i> is 
     *        restricted to the number that can be retrieved by calling 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cluadmex/nf-cluadmex-igetclusterdatainfo-getobjectcount">IGetClusterDataInfo::GetObjectCount</a>.
     * @returns {HNETWORK} If <b>GetNetworkHandle</b> is 
     *        successful, it returns a handle for the network represented by <i>lObjIndex</i>.
     * 
     * If <b>GetNetworkHandle</b> is not 
     *        successful, it returns <b>NULL</b>. For more information about the error, call the function 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/cluadmex/nf-cluadmex-igetclusternetworkinfo-getnetworkhandle
     */
    GetNetworkHandle(lObjIndex) {
        result := ComCall(3, this, "int", lObjIndex, HNETWORK)
        return result
    }

    Query(iid) {
        if (IGetClusterNetworkInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetNetworkHandle := CallbackCreate(GetMethod(implObj, "GetNetworkHandle"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetNetworkHandle)
    }
}
