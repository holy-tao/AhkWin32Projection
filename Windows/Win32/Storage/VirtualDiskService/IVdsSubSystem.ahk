#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VDS_SUB_SYSTEM_PROP.ahk
#Include .\IVdsProvider.ahk
#Include .\IEnumVdsObject.ahk
#Include .\IVdsDrive.ahk
#Include .\IVdsAsync.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for performing query and configuration operations on a subsystem.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdssubsystem
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsSubSystem extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsSubSystem
     * @type {Guid}
     */
    static IID => Guid("{6fcee2d3-6d90-4f91-80e2-a5c7caaca9d8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperties", "GetProvider", "QueryControllers", "QueryLuns", "QueryDrives", "GetDrive", "Reenumerate", "SetControllerStatus", "CreateLun", "ReplaceDrive", "SetStatus", "QueryMaxLunCreateSize"]

    /**
     * Returns the properties of a subsystem.
     * @returns {VDS_SUB_SYSTEM_PROP} The address of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_sub_system_prop">VDS_SUB_SYSTEM_PROP</a> 
     *       structure allocated and passed in by the caller. VDS allocates memory for the 
     *       <b>pwszFriendlyName</b> and <b>pwszIdentification</b> member strings. 
     *       Callers must free the strings by using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdssubsystem-getproperties
     */
    GetProperties() {
        pSubSystemProp := VDS_SUB_SYSTEM_PROP()
        result := ComCall(3, this, "ptr", pSubSystemProp, "HRESULT")
        return pSubSystemProp
    }

    /**
     * Returns the provider that manages the subsystem.
     * @returns {IVdsProvider} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsprovider">IVdsProvider</a> interface pointer. Callers must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdssubsystem-getprovider
     */
    GetProvider() {
        result := ComCall(4, this, "ptr*", &ppProvider := 0, "HRESULT")
        return IVdsProvider(ppProvider)
    }

    /**
     * Returns an object that enumerates the online and offline controllers managed by the subsystem.
     * @returns {IEnumVdsObject} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ienumvdsobject">IEnumVdsObject</a> interface pointer that can be used to enumerate the controllers in the subsystem as <a href="https://docs.microsoft.com/windows/desktop/VDS/controller-object">controller objects</a>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VDS/working-with-enumeration-objects">Working with Enumeration Objects</a>. Callers must release the interface and each of the controller objects when they are no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdssubsystem-querycontrollers
     */
    QueryControllers() {
        result := ComCall(5, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }

    /**
     * Returns an enumeration of LUNs surfaced in the subsystem. This method applies to hardware provider objects only.
     * @returns {IEnumVdsObject} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ienumvdsobject">IEnumVdsObject</a> interface 
     *       pointer that can be used to enumerate the LUNs  as <a href="https://docs.microsoft.com/windows/desktop/VDS/lun-object">LUN objects</a>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VDS/working-with-enumeration-objects">Working with Enumeration Objects</a>. Callers must release the interface and each of the LUN  objects when they are no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdssubsystem-queryluns
     */
    QueryLuns() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }

    /**
     * Returns an object that enumerates the drives in the subsystem.
     * @returns {IEnumVdsObject} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ienumvdsobject">IEnumVdsObject</a> interface pointer that can be used to enumerate the drives  as <a href="https://docs.microsoft.com/windows/desktop/VDS/drive-object">drive objects</a>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VDS/working-with-enumeration-objects">Working with Enumeration Objects</a>. Callers must release the interface and each of the drive objects when they are no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdssubsystem-querydrives
     */
    QueryDrives() {
        result := ComCall(7, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }

    /**
     * Returns the specified drive.
     * @param {Integer} sBusNumber The number of the bus to which the drive is connected.
     * @param {Integer} sSlotNumber The number of the slot the drive occupies.
     * @returns {IVdsDrive} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsdrive">IVdsDrive</a> interface pointer. Callers 
     *       must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdssubsystem-getdrive
     */
    GetDrive(sBusNumber, sSlotNumber) {
        result := ComCall(8, this, "short", sBusNumber, "short", sSlotNumber, "ptr*", &ppDrive := 0, "HRESULT")
        return IVdsDrive(ppDrive)
    }

    /**
     * Prompts the subsystem to scan its bus to discover newly-connected drives or newly-disconnected drives.
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
     *        the array. Use the 
     *        <a href="/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-reenumerate">IVdsHwProvider::Reenumerate</a> method 
     *        followed by the <a href="/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-refresh">IVdsHwProvider::Refresh</a> 
     *        method to restore the cache.
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
     * The subsystem object is no longer present.
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
     * The subsystem is in a failed state and is unable to perform the requested operation.
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
     * Another operation is in progress; this operation cannot proceed until the previous operation or operations 
     *         are complete.
     *        
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdssubsystem-reenumerate
     */
    Reenumerate() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * Sets the status (either online or offline) of the controllers in the subsystem.
     * @param {Pointer<Guid>} pOnlineControllerIdArray Pointer to an array of controller GUIDs. The provider sets these controllers to online. This array includes 
     *       controllers already set to online that are to remain so.
     * @param {Integer} lNumberOfOnlineControllers The number of controllers specified in 
     *      <i>pOnlineControllersArray</i>.
     * @param {Pointer<Guid>} pOfflineControllerIdArray Pointer to an array of controller GUIDs. The provider sets these controllers to offline. This array includes 
     *       controllers already set to offline that are to remain so.
     * @param {Integer} lNumberOfOfflineControllers The number of controllers specified in <i>pOfflineControllersArray</i>.
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
     * The subsystem object is no longer present.
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
     * The subsystem is in a failed state and is unable to perform the requested operation.
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
     * Another operation is in progress; this operation cannot proceed until the previous operation or operations 
     *         are complete.
     *        
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
     * Can be returned from any method that takes a <b>VDS_OBJECT_ID</b> constant. This return 
     *         value indicates that the identifier does not refer to an existing object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdssubsystem-setcontrollerstatus
     */
    SetControllerStatus(pOnlineControllerIdArray, lNumberOfOnlineControllers, pOfflineControllerIdArray, lNumberOfOfflineControllers) {
        result := ComCall(10, this, "ptr", pOnlineControllerIdArray, "int", lNumberOfOnlineControllers, "ptr", pOfflineControllerIdArray, "int", lNumberOfOfflineControllers, "HRESULT")
        return result
    }

    /**
     * Creates a logical unit number (LUN).
     * @param {Integer} type A <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_lun_type">VDS_LUN_TYPE</a> enumeration value that specifies the LUN type. The new 
     *       LUN can be an automagic type or a specific RAID type, but not both. If the caller specifies an automagic type, one or more automagic hints should be specified in the <i>pHints</i> parameter. 
     * 
     * The interface pointer for the new 
     *       <a href="https://docs.microsoft.com/windows/desktop/VDS/lun-object">LUN object</a> can be retrieved by calling the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsasync-wait">IVdsAsync::Wait</a> method on the interface pointer returned in the 
     *       <i>ppAsync</i> parameter. The 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_async_output">VDS_ASYNC_OUTPUT</a> structure returned by <b>Wait</b>  contains the 
     *       LUN object interface pointer in the <b>cl.pLunUnk</b> member.
     * @param {Integer} ullSizeInBytes The size, in bytes, of the new LUN. The provider can round the size up or down to meet alignment 
     *       requirements or other restrictions. (In most cases, the provider rounds up, ensuring that, with rare 
     *       exceptions, the LUN is at least as large as requested.) 
     *       
     * 
     * After the LUN is created, the caller can determine the actual size of the LUN by calling the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdslun-getproperties">IVdsLun::GetProperties</a> method.
     * @param {Pointer<Guid>} pDriveIdArray A pointer to an array that contains a <a href="https://docs.microsoft.com/windows/desktop/VDS/vds-data-types">VDS_OBJECT_ID</a> for each of the drives to be used to create the LUN. By specifying a non-<b>NULL</b> value for this parameter, the caller is requesting that the provider use all of the drives, in the order provided, using all of the extents on one drive before moving on to the 
     *       next, and stopping when the LUN has reached the requested size. 
     *       
     * 
     * Alternatively, the caller can direct the provider to select the drives automatically by passing 
     *        <b>NULL</b> in this parameter and 0 in <i>lNumberOfDrives</i>. (Pass 
     *        <b>NULL</b> if and only if <i>lNumberOfDrives</i> is 0.)
     * 
     * If the <i>type</i> parameter specifies an automagic type, this parameter should be <b>NULL</b>.
     * @param {Integer} lNumberOfDrives The number of drives specified in <i>pDriveIdArray</i>. If the caller passes 0, the 
     *       provider selects the drives.
     *       
     * 
     * If the <i>type</i> parameter specifies an automagic type, this parameter should be 0.
     * 
     * After the LUN is created, the caller can determine which drives are in use by calling the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdslunplex-queryextents">IVdsLunPlex::QueryExtents</a> method.
     * @param {PWSTR} pwszUnmaskingList A list specifying the computers to be granted access the LUN. The list is a 
     *       semicolon-delimited, <b>NULL</b>-terminated, human-readable string. 
     * 
     * If the value is "*", all computers that have an HBA port attached to the storage subsystem are to be granted access to the LUN. If the value is "", no computers are to be granted access to the LUN.
     *       <div class="alert"><b>Note</b>  In practice, if the value is "*", most hardware providers only grant the ports and initiators on the local computer access to the LUN.</div>
     * <div> </div>
     * 
     * 
     * If "*" or "" is specified, no other value can be specified.
     * 
     * For Fibre Channel networks and serial attached SCSI (SAS) networks, each entry is a 64-bit World-Wide Name (WWN) of each port to which the LUN is unmasked, 
     *        formatted as a hexadecimal string (16 characters long), most significant byte first. For 
     *        example, a WWN address of 01:23:45:67:89:AB:CD:EF is represented as "0123456789ABCDEF". For more information, see the T10 specifications for <a href="https://t10.org/drafts.htm#FibreChannel">Fibre Channel</a> and <a href="https://t10.org/drafts.htm#SCSI3_SAS">SAS</a>.
     * 
     * For iSCSI networks, each entry is an iSCSI qualified name (IQN) of each initiator to which the LUN is unmasked. A LUN unmasked 
     *        to a particular initiator is considered to be associated with that initiator.
     * 
     * <div class="alert"><b>Note</b>  The unmasking list can contain the same WWN or IQN more than once. The caller is not expected to remove 
     *        duplicates from the list or to validate the format of the WWN or IQN.</div>
     * <div> </div>
     * After the LUN is created, the caller can determine the actual unmasking list by calling the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdslun-getproperties">IVdsLun::GetProperties</a> method.
     * @param {Pointer<VDS_HINTS>} pHints Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_hints">VDS_HINTS</a> structure that specifies the hints to be used in creating the LUN. The provider is not required to apply the hints to the LUN. The hints specified in the VDS_HINTS structure are only a request to the provider.
     * 
     * After the LUN is created, the caller can determine the hints that the provider applied by calling either the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdslun-queryhints">IVdsLun::QueryHints</a> method or 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdslunplex-queryhints">IVdsLunPlex::QueryHints</a> method.
     * 
     * If the <i>type</i> parameter specifies a non-automagic type, this parameter should be <b>NULL</b>.
     * @returns {IVdsAsync} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface pointer, 
     *       which VDS initializes on return. Callers must release the interface. Use this interface to cancel, wait for, or 
     *       query the status of the operation.
     * 
     * If <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsasync-wait">IVdsAsync::Wait</a> is called on the returned interface pointer and a success HRESULT value is returned, 
     *       the interfaces returned in the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_async_output">VDS_ASYNC_OUTPUT</a> 
     *       structure must be released by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on each interface pointer. However, if <b>Wait</b> returns a failure HRESULT value, or if the <i>pHrResult</i> parameter of <b>Wait</b> receives a failure HRESULT value, the interface pointers in the <b>VDS_ASYNC_OUTPUT</b> structure are <b>NULL</b> and do not need to be released. You can test for success or failure HRESULT values by using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-succeeded">SUCCEEDED</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-failed">FAILED</a> macros defined in Winerror.h.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdssubsystem-createlun
     */
    CreateLun(type, ullSizeInBytes, pDriveIdArray, lNumberOfDrives, pwszUnmaskingList, pHints) {
        pwszUnmaskingList := pwszUnmaskingList is String ? StrPtr(pwszUnmaskingList) : pwszUnmaskingList

        result := ComCall(11, this, "int", type, "uint", ullSizeInBytes, "ptr", pDriveIdArray, "int", lNumberOfDrives, "ptr", pwszUnmaskingList, "ptr", pHints, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    /**
     * Replaces or migrates one drive with another in the subsystem.
     * @param {Guid} DriveToBeReplaced The GUID of the drive to be replaced.
     * @param {Guid} ReplacementDrive The GUID of the replacement drive.
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
     * This return value signals a software or communication problem inside a provider that caches information about the array. Use the <a href="/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-reenumerate">IVdsHwProvider::Reenumerate</a> method followed by the <a href="/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-refresh">IVdsHwProvider::Refresh</a> method to restore the cache.
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
     *   
     * The subsystem object is no longer present.
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
     * The subsystem is in a failed state and is unable to perform the requested operation.
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
     * Can be returned from any method that takes a <b>VDS_OBJECT_ID</b> constant. This return value indicates that the identifier does not refer to an existing object.
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
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdssubsystem-replacedrive
     */
    ReplaceDrive(DriveToBeReplaced, ReplacementDrive) {
        result := ComCall(12, this, "ptr", DriveToBeReplaced, "ptr", ReplacementDrive, "HRESULT")
        return result
    }

    /**
     * Sets the status of the subsystem to the specified value.
     * @param {Integer} status Values enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_sub_system_status">VDS_SUB_SYSTEM_STATUS</a>. 
     *       Callers can pass in a subset of the possible enumeration values. Passing in 
     *       <b>VDS_SSS_UNKNOWN</b> returns <b>E_INVALIDARG</b>.
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
     * The subsystem object is no longer present.
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
     * The subsystem is in a failed state and is unable to perform the requested operation.
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
     * Another operation is in progress; this operation cannot proceed until the previous operation or operations
     *        are complete.
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
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdssubsystem-setstatus
     */
    SetStatus(status) {
        result := ComCall(13, this, "int", status, "HRESULT")
        return result
    }

    /**
     * Returns the size of the maximum LUN that can be created using the specified LUN type and hints.
     * @param {Integer} type The LUN type enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_lun_type">VDS_LUN_TYPE</a>.
     * @param {Pointer<Guid>} pDriveIdArray A pointer to an array containing a <b>VDS_OBJECT_ID</b> for each of the drives to be 
     *       used in the LUN creation. The provider should attempt to use the drives in the order provided. This parameter 
     *       can be <b>NULL</b> if the <i>lNumberOfDrives</i> parameter is 0, in which 
     *       case the provider should automatically pick drives.
     * @param {Integer} lNumberOfDrives The number of entries in <i>pDriveIdArray</i>. This can be set to 0.
     * @param {Pointer<VDS_HINTS>} pHints A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_hints">VDS_HINTS</a> structure used for creating the LUN. The 
     *       hints always take lower priority than parameters listed before. This argument must be non-NULL.
     * @returns {Integer} A pointer to a buffer containing the maximum size of the LUN in bytes. This argument must be non-NULL.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdssubsystem-querymaxluncreatesize
     */
    QueryMaxLunCreateSize(type, pDriveIdArray, lNumberOfDrives, pHints) {
        result := ComCall(14, this, "int", type, "ptr", pDriveIdArray, "int", lNumberOfDrives, "ptr", pHints, "uint*", &pullMaxLunSize := 0, "HRESULT")
        return pullMaxLunSize
    }
}
