#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VDS_LUN_PROP.ahk
#Include .\IVdsSubSystem.ahk
#Include .\VDS_LUN_INFORMATION.ahk
#Include .\IEnumVdsObject.ahk
#Include .\IVdsAsync.ahk
#Include .\VDS_HINTS.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for performing query and configuration operations on a logical unit number (LUN).
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdslun
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsLun extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsLun
     * @type {Guid}
     */
    static IID => Guid("{3540a9c7-e60f-4111-a840-8bba6c2c83d8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperties", "GetSubSystem", "GetIdentificationData", "QueryActiveControllers", "Extend", "Shrink", "QueryPlexes", "AddPlex", "RemovePlex", "Recover", "SetMask", "Delete", "AssociateControllers", "QueryHints", "ApplyHints", "SetStatus", "QueryMaxLunExtendSize"]

    /**
     * Returns the properties of a LUN object.
     * @returns {VDS_LUN_PROP} The address of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_lun_prop">VDS_LUN_PROP</a> structure 
     *       allocated and passed in by the caller. VDS allocates memory for the <b>pwszFriendlyName</b>, 
     *       <b>pwszIdentification</b>, and <b>pwszUnmaskingList</b> member strings. 
     *       Callers must free the strings by using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdslun-getproperties
     */
    GetProperties() {
        pLunProp := VDS_LUN_PROP()
        result := ComCall(3, this, "ptr", pLunProp, "HRESULT")
        return pLunProp
    }

    /**
     * Returns the subsystem that surfaces the LUN.
     * @returns {IVdsSubSystem} The address of an  <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdssubsystem">IVdsSubSystem</a> interface pointer. Callers must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdslun-getsubsystem
     */
    GetSubSystem() {
        result := ComCall(4, this, "ptr*", &ppSubSystem := 0, "HRESULT")
        return IVdsSubSystem(ppSubSystem)
    }

    /**
     * Returns data from the SCSI Inquiry Data and Vital Product Data pages 0x80 and 0x83.
     * @returns {VDS_LUN_INFORMATION} The address of the <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_lun_information">VDS_LUN_INFORMATION</a>structure allocated and passed in by the caller. VDS allocates memory for the <b>m_szVendorId</b>, 
     *       <b>m_szProductId</b>, <b>m_szProductRevision</b>, 
     *       and <b>m_szSerialNumber</b> member strings, as well as the <b>m_pbPort</b> and   <b>m_pbAddress</b> member strings of each element in the array of <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_interconnect">VDS_INTERCONNECT</a> structures. 
     *       Callers must free the strings by using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdslun-getidentificationdata
     */
    GetIdentificationData() {
        pLunInfo := VDS_LUN_INFORMATION()
        result := ComCall(5, this, "ptr", pLunInfo, "HRESULT")
        return pLunInfo
    }

    /**
     * Returns an enumeration of currently active controllers�the controllers through which the LUN is accessible.
     * @returns {IEnumVdsObject} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ienumvdsobject">IEnumVdsObject</a> interface 
     *       pointer that can be used to enumerate the controllers in the subsystem as <a href="https://docs.microsoft.com/windows/desktop/VDS/controller-object">controller objects</a>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VDS/working-with-enumeration-objects">Working with Enumeration Objects</a>. Callers must release the interface and each of the controller objects when they are no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdslun-queryactivecontrollers
     */
    QueryActiveControllers() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }

    /**
     * Extends a LUN by a specified number of bytes.
     * @param {Integer} ullNumberOfBytesToAdd The number of bytes by which to extend the LUN. The number of bytes is not required to be an even multiple 
     *       of the block or sector size of the drives. The provider can round the number of bytes up or down to meet 
     *       alignment requirements or other restrictions. In most cases, the provider rounds up, ensuring that, with rare 
     *       exceptions, the LUN is extended by at least the number of bytes requested.
     * @param {Pointer<Guid>} pDriveIdArray A pointer to an array of drive GUIDs. The provider uses these drives to extend the LUN. The drives are 
     *       used in the specified sequence; the provider uses all of the extents on one drive before moving on to the next 
     *       and stops when the LUN has been extended by the requested number of bytes. 
     *       
     * 
     * Alternatively, the caller can direct the provider to select the drives automatically by passing 
     *        <b>NULL</b> in this parameter and zero in the <i>lNumberOfDrives</i> 
     *        parameter. Note that passing <b>NULL</b> is valid only if the 
     *        <i>lNumberOfDrives</i> parameter is zero.
     * @param {Integer} lNumberOfDrives The number of drives specified in the <i>pDriveIdArray</i> parameter. If the caller 
     *       passes zero, the provider selects the drives.
     * @returns {IVdsAsync} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface pointer, 
     *       which VDS initializes on return. Callers must release the interface. Use this interface to cancel, wait for, or 
     *       query the status of the operation.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdslun-extend
     */
    Extend(ullNumberOfBytesToAdd, pDriveIdArray, lNumberOfDrives) {
        result := ComCall(7, this, "uint", ullNumberOfBytesToAdd, "ptr", pDriveIdArray, "int", lNumberOfDrives, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    /**
     * Shrinks a LUN by a specified number of bytes.
     * @param {Integer} ullNumberOfBytesToRemove The number of bytes by which to shrink the LUN. The number of bytes is not required to be an even multiple 
     *       of the block or sector size.
     * @returns {IVdsAsync} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface pointer. 
     *       Callers must release the interface. Use this interface to cancel, wait for, or query the status of the operation.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdslun-shrink
     */
    Shrink(ullNumberOfBytesToRemove) {
        result := ComCall(8, this, "uint", ullNumberOfBytesToRemove, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    /**
     * Returns an enumeration of the plexes in a LUN.
     * @returns {IEnumVdsObject} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ienumvdsobject">IEnumVdsObject</a> interface 
     *       pointer that can be used to enumerate the plexes  as <a href="https://docs.microsoft.com/windows/desktop/VDS/lun-plex-object">LUN plex objects</a>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VDS/working-with-enumeration-objects">Working with Enumeration Objects</a>. Callers must release the interface and each of the LUN  plex objects when they are no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdslun-queryplexes
     */
    QueryPlexes() {
        result := ComCall(9, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }

    /**
     * Adds a LUN to the target LUN as a new plex.
     * @param {Guid} lunId The GUID of the LUN to be added as a plex.
     * @returns {IVdsAsync} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface pointer, 
     *       which VDS initializes on return. Callers must release the interface. Use this interface to cancel, wait for, or 
     *       query the status of the operation.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdslun-addplex
     */
    AddPlex(lunId) {
        result := ComCall(10, this, "ptr", lunId, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    /**
     * Removes a plex from a LUN.
     * @param {Guid} plexId The GUID of the LUN plex to be removed.
     * @returns {IVdsAsync} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface pointer, 
     *       which VDS initializes on return. Callers must release the interface. Use this interface to cancel, wait for, or 
     *       query the status of the operation.
     * 
     * If you call <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsasync-wait">IVdsAsync::Wait</a> on this method and a success HRESULT value is returned, 
     *       you must release the interfaces returned in the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_async_output">VDS_ASYNC_OUTPUT</a> structure by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on each interface pointer. However, if <b>Wait</b> returns a failure HRESULT value, or if the <i>pHrResult</i> parameter of <b>Wait</b> receives a failure HRESULT value, the interface pointers in the <b>VDS_ASYNC_OUTPUT</b> structure are <b>NULL</b> and do not need to be released. You can test for success or failure HRESULT values by using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-succeeded">SUCCEEDED</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-failed">FAILED</a> macros defined in Winerror.h.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdslun-removeplex
     */
    RemovePlex(plexId) {
        result := ComCall(11, this, "ptr", plexId, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    /**
     * Starts a recovery operation on a LUN.
     * @returns {IVdsAsync} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface pointer. 
     *       Callers must release the interface. Use this interface to cancel, wait for, or query the status of the 
     *       operation.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdslun-recover
     */
    Recover() {
        result := ComCall(12, this, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    /**
     * Specifies the unmasking list, which is the list of computers to be granted access to the LUN.
     * @param {PWSTR} pwszUnmaskingList A list specifying the computers to be granted access to the LUN. The list is a semicolon-delimited, 
     *        NULL-terminated, human-readable string. 
     * 
     * If the value is "*", all computers that have an HBA 
     *        port attached to the storage subsystem are to be granted access to the LUN. <div class="alert"><b>Note</b>  In practice, if the value is "*", most hardware providers only grant the ports and initiators on the local computer access to the LUN.</div>
     * <div> </div>
     * 
     * 
     * If the value is 
     *        "", access is revoked for all computers that were previously granted access to the LUN.
     * 
     * If "*" or "" is specified, no other value can be specified.
     * 
     * For Fibre Channel networks and serial attached SCSI (SAS) networks, each entry is a 64-bit World-Wide Name (WWN) of each port to which the LUN is 
     *        unmasked, formatted as a hexadecimal string (16 characters long), most significant byte first. For example, a 
     *        WWN address of 01:23:45:67:89:AB:CD:EF is represented as "0123456789ABCDEF". For more information, see the T10 specifications for <a href="https://t10.org/drafts.htm#FibreChannel">Fibre Channel</a> and <a href="https://t10.org/drafts.htm#SCSI3_SAS">SAS</a>.
     * 
     * For iSCSI networks, each entry is an iSCSI qualified name (IQN) of each initiator to which the LUN is 
     *        unmasked. A LUN unmasked to a particular initiator is considered to be associated with that initiator.
     * 
     * <div class="alert"><b>Note</b>  The unmasking list can contain the same WWN or IQN more than once. The caller is not expected to remove 
     *        duplicates from the list or to validate the format of the WWN or iSCSI name. In addition, access is not 
     *        cumulative. In other words, if this method is called twice in succession, only the computers specified in the 
     *        second call are granted access.</div>
     * <div> </div>
     * @returns {HRESULT} This method can return standard <b>HRESULT</b> values, such as 
     *       <b>E_INVALIDARG</b> or <b>E_OUTOFMEMORY</b>, and 
     *       <a href="/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It 
     *       can also return converted <a href="/windows/desktop/Debug/system-error-codes">system error codes</a> using 
     *       the <a href="/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate 
     *       from VDS itself or from the underlying <a href="/windows/desktop/VDS/about-vds">VDS provider</a> that is 
     *       being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_PROVIDER_CACHE_CORRUPT</b></dt>
     * <dt>0x8004241FL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This return value signals a software or communication problem inside a provider that caches information 
     *         about the array. Use the 
     *         <a href="/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-reenumerate">IVdsHwProvider::Reenumerate</a> method 
     *         followed by the 
     *         <a href="/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-refresh">IVdsHwProvider::Refresh</a> method to restore 
     *         the cache.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_OBJECT_DELETED</b></dt>
     * <dt>0x8004240BL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The LUN object is no longer present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_OBJECT_STATUS_FAILED</b></dt>
     * <dt>0x80042431L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The LUN is in a failed state, and is unable to perform the requested operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_ANOTHER_CALL_IN_PROGRESS</b></dt>
     * <dt>0x80042404L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Another operation is in progress; this operation cannot proceed until the previous operation or 
     *         operations are complete.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdslun-setmask
     */
    SetMask(pwszUnmaskingList) {
        pwszUnmaskingList := pwszUnmaskingList is String ? StrPtr(pwszUnmaskingList) : pwszUnmaskingList

        result := ComCall(13, this, "ptr", pwszUnmaskingList, "HRESULT")
        return result
    }

    /**
     * Deletes the LUN and all of its plexes. Any data on the LUN is lost. VDS frees the extents allocated to the LUN.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_OUTOFMEMORY, and <a href="/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_PROVIDER_CACHE_CORRUPT</b></dt>
     * <dt>0x8004241FL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This return value signals a software or communication problem inside a provider that caches information about 
     *         the array. Use the <a href="/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-reenumerate">IVdsHwProvider::Reenumerate</a> 
     *         method followed by the <a href="/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-refresh">IVdsHwProvider::Refresh</a> 
     *         method to restore the cache.
     *        
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_OBJECT_DELETED</b></dt>
     * <dt>0x8004240BL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The LUN object is no longer present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_OBJECT_STATUS_FAILED</b></dt>
     * <dt>0x80042431L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The LUN is in a failed state and is unable to perform the requested operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_ANOTHER_CALL_IN_PROGRESS</b></dt>
     * <dt>0x80042404L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Another operation is in progress; this operation cannot proceed until the previous operation or operations are complete.
     *        
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdslun-delete
     */
    Delete() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * Sets the subsystem controllers to active or inactive with respect to the LUN.
     * @param {Pointer<Guid>} pActiveControllerIdArray A pointer to an array of controller GUIDs. The provider sets these controllers to active. This array 
     *       includes controllers already set to active that are to remain so.
     * @param {Integer} lNumberOfActiveControllers The number of controllers specified in the <i>pActiveControllerArray</i> parameter.
     * @param {Pointer<Guid>} pInactiveControllerIdArray A pointer to an array of controller GUIDs. The provider sets these controllers to inactive. This array 
     *       includes controllers already set to inactive that are to remain so.
     * @param {Integer} lNumberOfInactiveControllers The number of controllers specified in the  <i>pInactiveControllerIdArray</i> parameter.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_PROVIDER_CACHE_CORRUPT</b></dt>
     * <dt>0x8004241FL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This return value signals a software or communication problem inside a provider that caches information 
     *         about the array. Use the 
     *         <a href="/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-reenumerate">IVdsHwProvider::Reenumerate</a> method 
     *         followed by the <a href="/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-refresh">IVdsHwProvider::Refresh</a> 
     *         method to restore the cache.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_OBJECT_DELETED</b></dt>
     * <dt>0x8004240BL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The LUN object is no longer present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_OBJECT_STATUS_FAILED</b></dt>
     * <dt>0x80042431L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The LUN is in a failed state and is unable to perform the requested operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_ANOTHER_CALL_IN_PROGRESS</b></dt>
     * <dt>0x80042404L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Another operation is in progress. This operation cannot proceed until the previous operation or 
     *         operations are complete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_OBJECT_NOT_FOUND</b></dt>
     * <dt>0x80042405L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the GUIDs specified in the active or inactive arrays do not refer to an existing object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_NOT_SUPPORTED</b></dt>
     * <dt>0x80042400L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This operation or combination of parameters is not supported by this provider.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdslun-associatecontrollers
     */
    AssociateControllers(pActiveControllerIdArray, lNumberOfActiveControllers, pInactiveControllerIdArray, lNumberOfInactiveControllers) {
        result := ComCall(15, this, "ptr", pActiveControllerIdArray, "int", lNumberOfActiveControllers, "ptr", pInactiveControllerIdArray, "int", lNumberOfInactiveControllers, "HRESULT")
        return result
    }

    /**
     * Returns the hints currently applied to the LUN.
     * @returns {VDS_HINTS} A pointer to the returned LUN hints. See the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_hints">VDS_HINTS</a> structure.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdslun-queryhints
     */
    QueryHints() {
        pHints := VDS_HINTS()
        result := ComCall(16, this, "ptr", pHints, "HRESULT")
        return pHints
    }

    /**
     * Applies a new set of hints to the LUN. Hints that are applied to a LUN are simultaneously applied to all plexes.
     * @param {Pointer<VDS_HINTS>} pHints A pointer to the new hints to be applied to the LUN. See the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_hints">VDS_HINTS</a> structure.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_PROVIDER_CACHE_CORRUPT</b></dt>
     * <dt>0x8004241FL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This return value signals a software or communication problem inside a provider that caches information 
     *         about the array. Use the 
     *         <a href="/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-reenumerate">IVdsHwProvider::Reenumerate</a> method 
     *         followed by the 
     *         <a href="/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-refresh">IVdsHwProvider::Refresh</a> method to restore 
     *         the cache.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_OBJECT_DELETED</b></dt>
     * <dt>0x8004240BL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The LUN object is no longer present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_OBJECT_STATUS_FAILED</b></dt>
     * <dt>0x80042431L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The LUN is in a failed state and unable to perform the requested operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_ANOTHER_CALL_IN_PROGRESS</b></dt>
     * <dt>0x80042404L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Another operation is in progress. This operation cannot proceed until the previous operation or 
     *         operations are complete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_NOT_SUPPORTED</b></dt>
     * <dt>0x80042400L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This operation or combination of parameters is not supported by this provider.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdslun-applyhints
     */
    ApplyHints(pHints) {
        result := ComCall(17, this, "ptr", pHints, "HRESULT")
        return result
    }

    /**
     * Sets the status of the LUN to the specified value.
     * @param {Integer} status Values enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_lun_status">VDS_LUN_STATUS</a>. Callers can 
     *       pass in a subset of the possible enumeration values. Passing in <b>VDS_LS_UNKNOWN</b> 
     *       returns <b>E_INVALIDARG</b>.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_PROVIDER_CACHE_CORRUPT</b></dt>
     * <dt>0x8004241FL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This return value signals a software or communication problem inside a provider that caches information 
     *         about the array. Use the <a href="/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-reenumerate">IVdsHwProvider::Reenumerate</a> 
     *         method followed by the <a href="/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-refresh">IVdsHwProvider::Refresh</a> 
     *         method to restore the cache.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_OBJECT_DELETED</b></dt>
     * <dt>0x8004240BL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The LUN object is no longer present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_OBJECT_STATUS_FAILED</b></dt>
     * <dt>0x80042431L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The LUN is in a failed state and is unable to perform the requested operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_ANOTHER_CALL_IN_PROGRESS</b></dt>
     * <dt>0x80042404L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Another operation is in progress; this operation cannot proceed until the previous operation or 
     *         operations are complete.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdslun-setstatus
     */
    SetStatus(status) {
        result := ComCall(18, this, "int", status, "HRESULT")
        return result
    }

    /**
     * Returns the maximum size by which a LUN can be extended.
     * @param {Pointer<Guid>} pDriveIdArray A pointer to an array containing the GUIDs of the drives used for growing the LUN.  This argument can be <b>NULL</b> if 
     *             <i>lNumberOfDrives</i> is 0. In this case, the provider is expected to select all the drives
     *             possible to get the maximum size.
     * @param {Integer} lNumberOfDrives The count of drives in <i>pDriveIdArray</i>.
     * @returns {Integer} A pointer to a buffer containing the maximum bytes by which the LUN can be
     *             extended.  This argument must be non-NULL.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdslun-querymaxlunextendsize
     */
    QueryMaxLunExtendSize(pDriveIdArray, lNumberOfDrives) {
        result := ComCall(19, this, "ptr", pDriveIdArray, "int", lNumberOfDrives, "uint*", &pullMaxBytesToBeAdded := 0, "HRESULT")
        return pullMaxBytesToBeAdded
    }
}
