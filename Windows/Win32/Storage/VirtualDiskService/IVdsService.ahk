#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VDS_SERVICE_PROP.ahk
#Include .\IEnumVdsObject.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\VDS_DRIVE_LETTER_PROP.ahk

/**
 * Provides methods to query and interact with VDS.
 * @see https://learn.microsoft.com/windows/win32/api/vds/nn-vds-ivdsservice
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsService extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsService
     * @type {Guid}
     */
    static IID => Guid("{0818a8ef-9ba9-40d8-a6f9-e22833cc771e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsServiceReady", "WaitForServiceReady", "GetProperties", "QueryProviders", "QueryMaskedDisks", "QueryUnallocatedDisks", "GetObject", "QueryDriveLetters", "QueryFileSystemTypes", "Reenumerate", "Refresh", "CleanupObsoleteMountPoints", "Advise", "Unadvise", "Reboot", "SetFlags", "ClearFlags"]

    /**
     * Returns the initialization status of VDS.
     * @remarks
     * Callers must wait for the initialization process to complete before invoking other VDS methods.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The initialization completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * VDS has not finished the initialization and the service is not ready.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_INITIALIZED_FAILED</b></dt>
     * <dt>0x80042401L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The initialization failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsservice-isserviceready
     */
    IsServiceReady() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Waits for VDS initialization to complete and returns the status of the VDS initialization.
     * @remarks
     * VDS must initialize successfully before an application can call the methods exposed by VDS objects.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * VDS initialized successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_INITIALIZED_FAILED</b></dt>
     * <dt>0x80042401L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * VDS failed to initialize.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsservice-waitforserviceready
     */
    WaitForServiceReady() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Returns the properties of VDS.
     * @returns {VDS_SERVICE_PROP} The address of the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_service_prop">VDS_SERVICE_PROP</a> structure 
     *       allocated and passed in by the caller. VDS allocates memory for the 
     *       <b>pwszVersion</b> member string. Callers must free the string by using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsservice-getproperties
     */
    GetProperties() {
        pServiceProp := VDS_SERVICE_PROP()
        result := ComCall(5, this, "ptr", pServiceProp, "HRESULT")
        return pServiceProp
    }

    /**
     * Returns an enumeration object containing a list of the hardware and software providers known to VDS.
     * @remarks
     * To determine the provider type for hardware providers, call the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovidertype2-getprovidertype2">IVdsHwProviderType2::GetProviderType2</a> method or the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovidertype-getprovidertype">IVdsHwProviderType::GetProviderType</a> method for each provider object.
     * @param {Integer} masks The provider mask enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_query_provider_flag">VDS_QUERY_PROVIDER_FLAG</a>. Callers can specify a software provider mask, a hardware provider mask, or both.
     * @returns {IEnumVdsObject} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ienumvdsobject">IEnumVdsObject</a> interface pointer that can be used to enumerate the providers  as <a href="https://docs.microsoft.com/windows/desktop/VDS/provider-object">provider objects</a>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VDS/working-with-enumeration-objects">Working with Enumeration Objects</a>. Callers must release the interface and each of the provider objects when they are no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsservice-queryproviders
     */
    QueryProviders(masks) {
        result := ComCall(6, this, "uint", masks, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }

    /**
     * Not supported.This method is reserved for future use. (IVdsService.QueryMaskedDisks)
     * @returns {IEnumVdsObject} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ienumvdsobject">IEnumVdsObject</a> interface pointer, which VDS initializes on return. Callers must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsservice-querymaskeddisks
     */
    QueryMaskedDisks() {
        result := ComCall(7, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }

    /**
     * Returns an enumeration object containing a list of the unallocated disks managed by VDS.
     * @remarks
     * An unallocated disk is not claimed by any 
     *     provider. It may or may not contain MBR or GPT partition format information. Often it is an uninitialized disk. If the disk status is <b>VDS_DS_ONLINE</b> or <b>VDS_DS_OFFLINE</b>, the disk is unallocated and uninitialized. If it is <b>VDS_DS_UNKNOWN</b>, <b>VDS_DS_NOT_READY</b>, <b>VDS_DS_FAILED</b>, or <b>VDS_DS_MISSING</b>, it is unallocated, but the VDS service cannot determine whether or not it is initialized, possibly because of problems with the disk.
     * 
     * To determine the disk status, see the <b>status</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_disk_prop">VDS_DISK_PROP</a> or <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_disk_prop2">VDS_DISK_PROP2</a> structure for the disk.
     * 
     * If the disk status is <b>VDS_DS_ONLINE</b>, the disk can be added to a pack.
     * 
     * If the disk status is <b>VDS_DS_OFFLINE</b>, try to bring the disk online by calling <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsdiskonline-online">IVdsDiskOnline::Online</a>. If the call to the <b>Online</b> method succeeds, the disk can be added to a pack. If the call to <b>Online</b> fails, the disk cannot be used.
     * @returns {IEnumVdsObject} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ienumvdsobject">IEnumVdsObject</a> interface pointer that can be used to enumerate the disks  as <a href="https://docs.microsoft.com/windows/desktop/VDS/disk-object">disk objects</a>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VDS/working-with-enumeration-objects">Working with Enumeration Objects</a>. Callers must release the interface and each of the disk objects when they are no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsservice-queryunallocateddisks
     */
    QueryUnallocatedDisks() {
        result := ComCall(8, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }

    /**
     * Returns an object pointer for the identified object.
     * @remarks
     * VDS notifications return an object identifier instead of an object pointer. Callers  use this method to get a 
     *     pointer to the object referenced in the notification.
     * @param {Guid} _ObjectId 
     * @param {Integer} type A <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_object_type">VDS_OBJECT_TYPE</a> enumeration value that specifies the object type. 
     *       <b>VDS_OT_UNKNOWN</b>, <b>VDS_OT_PROVIDER</b>, 
     *       <b>VDS_OT_ASYNC</b>, <b>VDS_OT_ENUM</b>, and <b>VDS_OT_OPEN_VDISK</b> are not supported.
     * @returns {IUnknown} A pointer to a buffer that receives the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointer to the object. When the pointer is no longer needed, the caller should release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsservice-getobject
     */
    GetObject(_ObjectId, type) {
        result := ComCall(9, this, "ptr", _ObjectId, "int", type, "ptr*", &ppObjectUnk := 0, "HRESULT")
        return IUnknown(ppObjectUnk)
    }

    /**
     * Returns property details for a set of drive letters.
     * @param {Integer} wcFirstLetter The first drive letter to retrieve.
     * @param {Integer} count The total number of drive letters to retrieve.
     * @returns {VDS_DRIVE_LETTER_PROP} The address of an array of <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_drive_letter_prop">VDS_DRIVE_LETTER_PROP</a> structures. The size of the array is <i>count</i>. Callers must allocate the memory for this array.
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsservice-querydriveletters
     */
    QueryDriveLetters(wcFirstLetter, count) {
        pDriveLetterPropArray := VDS_DRIVE_LETTER_PROP()
        result := ComCall(10, this, "char", wcFirstLetter, "uint", count, "ptr", pDriveLetterPropArray, "HRESULT")
        return pDriveLetterPropArray
    }

    /**
     * Returns property details for all file systems known to VDS.
     * @param {Pointer<Pointer<VDS_FILE_SYSTEM_TYPE_PROP>>} ppFileSystemTypeProps The address of a pointer to a buffer holding an array of 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_file_system_type_prop">VDS_FILE_SYSTEM_TYPE_PROP</a> structures. 
     *       Callers must free the memory for the array and for the <b>pwszIllegalLabelCharSet</b> string 
     *       by using the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @param {Pointer<Integer>} plNumberOfFileSystems The total number of file systems.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_INITIALIZED_FAILED</b></dt>
     * <dt>0x80042401L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * VDS failed to initialize. If an application calls this method before the service finishes initializing, 
     *         the method is blocked until the initialization completes. If the initialization fails, this error is 
     *         returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsservice-queryfilesystemtypes
     */
    QueryFileSystemTypes(ppFileSystemTypeProps, plNumberOfFileSystems) {
        ppFileSystemTypePropsMarshal := ppFileSystemTypeProps is VarRef ? "ptr*" : "ptr"
        plNumberOfFileSystemsMarshal := plNumberOfFileSystems is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, ppFileSystemTypePropsMarshal, ppFileSystemTypeProps, plNumberOfFileSystemsMarshal, plNumberOfFileSystems, "HRESULT")
        return result
    }

    /**
     * Discovers newly added and newly removed disks.
     * @remarks
     * This method returns immediately after a bus rescan request is issued. The operation might be incomplete when the method returns. Use the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdssubsystem-reenumerate">IVdsSubSystem::Reenumerate</a> method to perform the same operation on drives inside a RAID subsystem.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_INITIALIZED_FAILED</b></dt>
     * <dt>0x80042401L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * VDS failed to initialize. If an application calls this method before the service finishes initializing, the method is blocked until the initialization completes. If the initialization fails, this error is returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsservice-reenumerate
     */
    Reenumerate() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Refreshes disk-ownership and disk-layout information.
     * @remarks
     * This method synchronizes the disk layout to the layout known to the disk driver. It does not force the driver to read the layout from the disk. Additionally, this method refreshes the view of all objects in the VDS cache. VDS and the providers query all objects, sending object arrival, modification, removal notifications to synchronize the caller. Note that VDS updates the cache automatically whenever it detects a change that triggers a notification. For this reason, and because calling <b>Refresh</b> can trigger additional notifications, applications should not call this method in response to notifications. <b>Refresh</b> should be called only when it appears that the cache is not being updated properly.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_INITIALIZED_FAILED</b></dt>
     * <dt>0x80042401L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * VDS failed to initialize. If an application calls this method before the service finishes initializing, the method is blocked until the initialization completes. If the initialization fails, this error is returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsservice-refresh
     */
    Refresh() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * Removes user-mode paths and mounted folders for volumes that no longer exist.
     * @remarks
     * By default, the registry retains the drive-letter mapping information for uninstalled volumes. If the disk 
     *     that contains the volume is removed from the computer, the registry entry is retained, so that if the disk and 
     *     volume return to the same computer, the volume receives the same drive letter. If the disk is moved to a new 
     *     computer, the registry entries do not move with it, so the volume might receive a different drive letter and 
     *     volume GUID.
     * 
     * The 
     *     <b>CleanupObsoleteMountPoints</b> 
     *     method removes these registry entries. There are three types of registry entries that are removed:
     * 
     * <ul>
     * <li>If the volume does not have a drive letter or a volume GUID, it has a "no drive letter" 
     *       registry entry, which is removed by this method.</li>
     * <li>Otherwise, the volume has registry entries for a volume GUID and possibly a drive letter. Both are removed 
     *       by this method.</li>
     * </ul>
     * In addition, if the volume contains any mounted folders, 
     *     <b>CleanupObsoleteMountPoints</b> 
     *     removes them. For example, if <i>Volume1</i> on <i>Disk1</i> is being 
     *     removed and <i>Volume1</i> is mounted as 
     *     <i>x</i>:&#92;<i>MountVolume1</i> on <i>Disk2</i>, the 
     *     &#92;<i>MountVolume1</i> folder on <i>Disk2</i> is also deleted.
     * @returns {HRESULT} This method can return standard <b>HRESULT</b> values, such as 
     *       <b>E_INVALIDARG</b> or <b>E_OUTOFMEMORY</b>, and 
     *       <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. 
     *       It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a> 
     *       using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can 
     *       originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> 
     *       that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Outdated user-mode paths and mounted folders were removed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_INITIALIZED_FAILED</b></dt>
     * <dt>0x80042401L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * VDS failed to initialize. If an application calls this method before the service finishes initializing, 
     *         the method is blocked until the initialization completes. If the initialization fails, this error is 
     *         returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsservice-cleanupobsoletemountpoints
     */
    CleanupObsoleteMountPoints() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * Registers the caller's IVdsAdviseSink interface with VDS so that the caller receives notifications from the VDS service.
     * @remarks
     * To receive notifications from the VDS service, your application must implement the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsadvisesink">IVdsAdviseSink</a> 
     *     interface and use the <b>Advise</b> method to register the interface.
     * 
     * To stop receiving notifications from the VDS service, use the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-unadvise">IVdsService::Unadvise</a> method to unregister the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsadvisesink">IVdsAdviseSink</a> interface.
     * 
     * <div class="alert"><b>Note</b>  An application that calls <b>Advise</b> must eventually call <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-unadvise">Unadvise</a>. Ideally, it should call <b>Unadvise</b> as soon as it no longer needs to receive notifications.</div>
     * <div> </div>
     * To receive notifications from underlying software and hardware providers, VDS passes a notification callback 
     *     function to each provider as a parameter of the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsproviderprivate-onload">IVdsProviderPrivate::OnLoad</a> method.
     * @param {IVdsAdviseSink} pSink A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsadvisesink">IVdsAdviseSink</a> interface.
     * @returns {Integer} A pointer to a cookie that can later be used to unregister the interface.
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsservice-advise
     */
    Advise(pSink) {
        result := ComCall(15, this, "ptr", pSink, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * Unregisters the caller's IVdsAdviseSink interface so that the caller no longer receives notifications from the VDS service.
     * @remarks
     * Use the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-advise">Advise</a> method to register your VDS application's  <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsadvisesink">IVdsAdviseSink</a> interface to receive notifications from VDS.  <b>Advise</b> returns a cookie, which you must pass back as a parameter to the <b>Unadvise</b> method.
     * 
     * <div class="alert"><b>Note</b>  An application that calls <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-advise">Advise</a> must eventually call <b>Unadvise</b>. Ideally, it should call <b>Unadvise</b> as soon as it no longer needs to receive notifications.</div>
     * <div> </div>
     * The <b>Unadvise</b> method might not return immediately, because it waits for a lock to update the list of registered client applications and waits for the notification thread sending the client notifications to exit. If there are outstanding notifications to be sent to your application, the notification thread tries to send them before exiting.
     * @param {Integer} dwCookie The cookie that was returned by the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-advise">IVdsService::Advise</a> method when the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsadvisesink">IVdsAdviseSink</a> interface was registered.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_BAD_COOKIE</b></dt>
     * <dt>0x80042411L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cookie does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_INITIALIZED_FAILED</b></dt>
     * <dt>0x80042401L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * VDS failed to initialize. If an application calls this method before the service finishes initializing, the method is blocked until the initialization completes. If the initialization fails, this error is returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsservice-unadvise
     */
    Unadvise(dwCookie) {
        result := ComCall(16, this, "uint", dwCookie, "HRESULT")
        return result
    }

    /**
     * Restarts the computer hosting the provider.
     * @remarks
     * This method displays the following message to the user:
     * 
     * "Virtual Disk Service: Operation requires that the computer be restarted."
     * 
     * VDS prompts the user to save their current work and exit before the system shuts down. <b>Reboot</b> does not force an application in operation to close.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_INITIALIZED_FAILED</b></dt>
     * <dt>0x80042401L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * VDS failed to initialize. If an application calls this method before the service finishes initializing, the method is blocked until the initialization completes. If the initialization fails, this error is returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsservice-reboot
     */
    Reboot() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * Sets service object flags.
     * @remarks
     * Beginning with Windows 8 and Windows Server 2012, the <b>VDS_SVF_AUTO_MOUNT_OFF</b> is deprecated. Instead, use the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_san_policy">VDS_SAN_POLICY</a> enumeration to control default disk mounting behavior.
     * @param {Integer} ulFlags The flags enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_service_flag">VDS_SERVICE_FLAG</a>. Callers can set the <b>VDS_SVF_AUTO_MOUNT_OFF</b> flag.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flags were set successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_INITIALIZED_FAILED</b></dt>
     * <dt>0x80042401L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * VDS failed to initialize. If an application calls this method before the service finishes initializing, the method is blocked until the initialization completes. If the initialization fails, this error is returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsservice-setflags
     */
    SetFlags(ulFlags) {
        result := ComCall(18, this, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * Clears service object flags.
     * @remarks
     * Beginning with Windows 8 and Windows Server 2012, the <b>VDS_SVF_AUTO_MOUNT_OFF</b> is deprecated. Instead, use the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_san_policy">VDS_SAN_POLICY</a> enumeration to control default disk mounting behavior.
     * @param {Integer} ulFlags The flags enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_service_flag">VDS_SERVICE_FLAG</a>. Callers can clear the <b>VDS_SVF_AUTO_MOUNT_OFF</b> flag.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flags were cleared successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_INITIALIZED_FAILED</b></dt>
     * <dt>0x80042401L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * VDS failed to initialize. If an application calls this method before the service finishes initializing, the method is blocked until the initialization completes. If the initialization fails, this error is returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsservice-clearflags
     */
    ClearFlags(ulFlags) {
        result := ComCall(19, this, "uint", ulFlags, "HRESULT")
        return result
    }
}
