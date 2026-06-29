#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\VDS_ISCSI_LOGIN_TYPE.ahk" { VDS_ISCSI_LOGIN_TYPE }
#Import ".\VDS_ISCSI_AUTH_TYPE.ahk" { VDS_ISCSI_AUTH_TYPE }
#Import ".\VDS_ISCSI_INITIATOR_ADAPTER_PROP.ahk" { VDS_ISCSI_INITIATOR_ADAPTER_PROP }
#Import ".\IVdsAsync.ahk" { IVdsAsync }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IEnumVdsObject.ahk" { IEnumVdsObject }

/**
 * Provides methods to query and interact with iSCSI initiator adapters on the local system.
 * @see https://learn.microsoft.com/windows/win32/api/vds/nn-vds-ivdsiscsiinitiatoradapter
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsIscsiInitiatorAdapter extends IUnknown {
    /**
     * The interface identifier for IVdsIscsiInitiatorAdapter
     * @type {Guid}
     */
    static IID := Guid("{b07fedd4-1682-4440-9189-a39b55194dc5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsIscsiInitiatorAdapter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetProperties         : IntPtr
        QueryInitiatorPortals : IntPtr
        LoginToTarget         : IntPtr
        LogoutFromTarget      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsIscsiInitiatorAdapter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns the properties of an initiator adapter.
     * @returns {VDS_ISCSI_INITIATOR_ADAPTER_PROP} The address of a 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_iscsi_initiator_adapter_prop">VDS_ISCSI_INITIATOR_ADAPTER_PROP</a> 
     *       structure allocated by the caller. VDS allocates memory for the <b>pwszName</b> member 
     *       string. Callers must free this string by using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsiscsiinitiatoradapter-getproperties
     */
    GetProperties() {
        pInitiatorAdapterProp := VDS_ISCSI_INITIATOR_ADAPTER_PROP()
        result := ComCall(3, this, VDS_ISCSI_INITIATOR_ADAPTER_PROP.Ptr, pInitiatorAdapterProp, "HRESULT")
        return pInitiatorAdapterProp
    }

    /**
     * Returns an object that enumerates the iSCSI initiator portals of the initiator adapter.
     * @returns {IEnumVdsObject} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ienumvdsobject">IEnumVdsObject</a> interface pointer that can be used to enumerate the  initiator portals  as <a href="https://docs.microsoft.com/windows/desktop/VDS/startup-and-service-objects">initiator portal objects</a>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VDS/working-with-enumeration-objects">Working with Enumeration Objects</a>. Callers must release the interface and each of the initiator portal objects when they are no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsiscsiinitiatoradapter-queryinitiatorportals
     */
    QueryInitiatorPortals() {
        result := ComCall(4, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }

    /**
     * Performs a manual login to an iSCSI target.
     * @param {VDS_ISCSI_LOGIN_TYPE} loginType The type of login that will be performed, enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_iscsi_login_type">VDS_ISCSI_LOGIN_TYPE</a>.
     * @param {Guid} targetId The <b>VDS_OBJECT_ID</b> of the target to login to. <b>GUID_NULL</b> 
     *       indicates that the initiator is to select the portal.
     * @param {Guid} targetPortalId The <b>VDS_OBJECT_ID</b> of the target portal by which the login operation is performed. 
     *       <b>GUID_NULL</b> indicates that the initiator is to select the portal.
     * @param {Guid} initiatorPortalId The <b>VDS_OBJECT_ID</b> of the initiator portal by which the login operation is 
     *       performed.
     * @param {Integer} ulLoginFlags Flags enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_iscsi_login_flag">VDS_ISCSI_LOGIN_FLAG</a> 
     *       specifying login options.
     * @param {BOOL} bHeaderDigest If <b>TRUE</b>, the initiator should enable header digest when logging into the target portal.
     * @param {BOOL} bDataDigest If <b>TRUE</b>, the initiator should enable data digest when logging into the target portal.
     * @param {VDS_ISCSI_AUTH_TYPE} authType The type of authentication required to log into the target, enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_iscsi_auth_type">VDS_ISCSI_AUTH_TYPE</a>.
     * @returns {IVdsAsync} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface pointer. VDS 
     *       initializes the interface on return. Callers must release the interface. Use this interface to cancel, wait 
     *       for, or query the status of the operation. If 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsasync-wait">IVdsAsync::Wait</a> is called on this interface and a success HRESULT value is returned, the 
     *       interfaces returned in the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_async_output">VDS_ASYNC_OUTPUT</a> 
     *       structure must be released by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on each interface pointer. However, if <b>Wait</b> returns a failure HRESULT value, or if the <i>pHrResult</i> parameter of <b>Wait</b> receives a failure HRESULT value, the interface pointers in the <b>VDS_ASYNC_OUTPUT</b> structure are <b>NULL</b> and do not need to be released. You can test for success or failure HRESULT values by using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-succeeded">SUCCEEDED</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-failed">FAILED</a> macros defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsiscsiinitiatoradapter-logintotarget
     */
    LoginToTarget(loginType, targetId, targetPortalId, initiatorPortalId, ulLoginFlags, bHeaderDigest, bDataDigest, authType) {
        result := ComCall(5, this, VDS_ISCSI_LOGIN_TYPE, loginType, Guid, targetId, Guid, targetPortalId, Guid, initiatorPortalId, "uint", ulLoginFlags, BOOL, bHeaderDigest, BOOL, bDataDigest, VDS_ISCSI_AUTH_TYPE, authType, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    /**
     * Performs a manual logout from an iSCSI target on all iSCSI sessions to the specified target.
     * @param {Guid} targetId The <b>VDS_OBJECT_ID</b> of the target to logout from.
     * @returns {IVdsAsync} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface pointer. VDS 
     *       initializes the interface on return. Callers must release the interface. Use this interface to cancel, wait 
     *       for, or query the status of the operation. If 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsasync-wait">IVdsAsync::Wait</a> is called on this interface and a success HRESULT value is returned, the 
     *       interfaces returned in the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_async_output">VDS_ASYNC_OUTPUT</a> 
     *       structure must be released by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on each interface pointer. However, if <b>Wait</b> returns a failure HRESULT value, or if the <i>pHrResult</i> parameter of <b>Wait</b> receives a failure HRESULT value, the interface pointers in the <b>VDS_ASYNC_OUTPUT</b> structure are <b>NULL</b> and do not need to be released. You can test for success or failure HRESULT values by using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-succeeded">SUCCEEDED</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-failed">FAILED</a> macros defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsiscsiinitiatoradapter-logoutfromtarget
     */
    LogoutFromTarget(targetId) {
        result := ComCall(6, this, Guid, targetId, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    Query(iid) {
        if (IVdsIscsiInitiatorAdapter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetProperties := CallbackCreate(GetMethod(implObj, "GetProperties"), flags, 2)
        this.vtbl.QueryInitiatorPortals := CallbackCreate(GetMethod(implObj, "QueryInitiatorPortals"), flags, 2)
        this.vtbl.LoginToTarget := CallbackCreate(GetMethod(implObj, "LoginToTarget"), flags, 10)
        this.vtbl.LogoutFromTarget := CallbackCreate(GetMethod(implObj, "LogoutFromTarget"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetProperties)
        CallbackFree(this.vtbl.QueryInitiatorPortals)
        CallbackFree(this.vtbl.LoginToTarget)
        CallbackFree(this.vtbl.LogoutFromTarget)
    }
}
