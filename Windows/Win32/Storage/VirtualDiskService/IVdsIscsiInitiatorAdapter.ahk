#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VDS_ISCSI_INITIATOR_ADAPTER_PROP.ahk
#Include .\IEnumVdsObject.ahk
#Include .\IVdsAsync.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to query and interact with iSCSI initiator adapters on the local system.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsiscsiinitiatoradapter
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsIscsiInitiatorAdapter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsIscsiInitiatorAdapter
     * @type {Guid}
     */
    static IID => Guid("{b07fedd4-1682-4440-9189-a39b55194dc5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperties", "QueryInitiatorPortals", "LoginToTarget", "LogoutFromTarget"]

    /**
     * Returns the properties of an initiator adapter.
     * @returns {VDS_ISCSI_INITIATOR_ADAPTER_PROP} The address of a 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_iscsi_initiator_adapter_prop">VDS_ISCSI_INITIATOR_ADAPTER_PROP</a> 
     *       structure allocated by the caller. VDS allocates memory for the <b>pwszName</b> member 
     *       string. Callers must free this string by using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsiscsiinitiatoradapter-getproperties
     */
    GetProperties() {
        pInitiatorAdapterProp := VDS_ISCSI_INITIATOR_ADAPTER_PROP()
        result := ComCall(3, this, "ptr", pInitiatorAdapterProp, "HRESULT")
        return pInitiatorAdapterProp
    }

    /**
     * Returns an object that enumerates the iSCSI initiator portals of the initiator adapter.
     * @returns {IEnumVdsObject} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ienumvdsobject">IEnumVdsObject</a> interface pointer that can be used to enumerate the  initiator portals  as <a href="https://docs.microsoft.com/windows/desktop/VDS/startup-and-service-objects">initiator portal objects</a>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VDS/working-with-enumeration-objects">Working with Enumeration Objects</a>. Callers must release the interface and each of the initiator portal objects when they are no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsiscsiinitiatoradapter-queryinitiatorportals
     */
    QueryInitiatorPortals() {
        result := ComCall(4, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }

    /**
     * Performs a manual login to an iSCSI target.
     * @param {Integer} loginType The type of login that will be performed, enumerated by 
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
     * @param {Integer} authType The type of authentication required to log into the target, enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_iscsi_auth_type">VDS_ISCSI_AUTH_TYPE</a>.
     * @returns {IVdsAsync} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface pointer. VDS 
     *       initializes the interface on return. Callers must release the interface. Use this interface to cancel, wait 
     *       for, or query the status of the operation. If 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsasync-wait">IVdsAsync::Wait</a> is called on this interface and a success HRESULT value is returned, the 
     *       interfaces returned in the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_async_output">VDS_ASYNC_OUTPUT</a> 
     *       structure must be released by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on each interface pointer. However, if <b>Wait</b> returns a failure HRESULT value, or if the <i>pHrResult</i> parameter of <b>Wait</b> receives a failure HRESULT value, the interface pointers in the <b>VDS_ASYNC_OUTPUT</b> structure are <b>NULL</b> and do not need to be released. You can test for success or failure HRESULT values by using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-succeeded">SUCCEEDED</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-failed">FAILED</a> macros defined in Winerror.h.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsiscsiinitiatoradapter-logintotarget
     */
    LoginToTarget(loginType, targetId, targetPortalId, initiatorPortalId, ulLoginFlags, bHeaderDigest, bDataDigest, authType) {
        result := ComCall(5, this, "int", loginType, "ptr", targetId, "ptr", targetPortalId, "ptr", initiatorPortalId, "uint", ulLoginFlags, "int", bHeaderDigest, "int", bDataDigest, "int", authType, "ptr*", &ppAsync := 0, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsiscsiinitiatoradapter-logoutfromtarget
     */
    LogoutFromTarget(targetId) {
        result := ComCall(6, this, "ptr", targetId, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }
}
