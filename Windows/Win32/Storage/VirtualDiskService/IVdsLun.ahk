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
 * The IVdsLun interface (vdshwprv.h) provides methods for performing query and configuration operations on a logical unit number (LUN).
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nn-vdshwprv-ivdslun
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
     * The IVdsLun::GetProperties (vdshwprv.h) method returns the properties of a LUN object.
     * @returns {VDS_LUN_PROP} The address of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_lun_prop">VDS_LUN_PROP</a> structure 
     *       allocated and passed in by the caller. VDS allocates memory for the <b>pwszFriendlyName</b>, 
     *       <b>pwszIdentification</b>, and <b>pwszUnmaskingList</b> member strings. 
     *       Callers must free the strings by using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslun-getproperties
     */
    GetProperties() {
        pLunProp := VDS_LUN_PROP()
        result := ComCall(3, this, "ptr", pLunProp, "HRESULT")
        return pLunProp
    }

    /**
     * The IVdsLun::GetSubSystem (vdshwprv.h) method returns the subsystem that surfaces the LUN.
     * @returns {IVdsSubSystem} The address of an  <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdssubsystem">IVdsSubSystem</a> interface pointer. Callers must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslun-getsubsystem
     */
    GetSubSystem() {
        result := ComCall(4, this, "ptr*", &ppSubSystem := 0, "HRESULT")
        return IVdsSubSystem(ppSubSystem)
    }

    /**
     * The IVdsLun::GetIdentificationData (vdshwprv.h) method returns data from the SCSI Inquiry Data and Vital Product Data pages 0x80 and 0x83.
     * @returns {VDS_LUN_INFORMATION} The address of the <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_lun_information">VDS_LUN_INFORMATION</a> structure allocated and passed in by the caller. VDS allocates memory for the <b>m_szVendorId</b>, 
     *       <b>m_szProductId</b>, <b>m_szProductRevision</b>, 
     *       and <b>m_szSerialNumber</b> member strings, as well as the <b>m_pbPort</b> and   <b>m_pbAddress</b> member strings of each element in the array of <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_interconnect">VDS_INTERCONNECT</a> structures. 
     *       Callers must free the strings by using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslun-getidentificationdata
     */
    GetIdentificationData() {
        pLunInfo := VDS_LUN_INFORMATION()
        result := ComCall(5, this, "ptr", pLunInfo, "HRESULT")
        return pLunInfo
    }

    /**
     * The IVdsLun::QueryActiveControllers (vdshwprv.h) method returns an enumeration of currently active controllers.
     * @remarks
     * Use the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdslun-associatecontrollers">IVdsLun::AssociateControllers</a> 
     *     method to set the controller. Use the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdscontroller-queryassociatedluns">IVdsController::QueryAssociatedLuns</a> 
     *     method to query the LUNs associated with a particular controller.
     * 
     * Most subsystems offer only one active controller for a LUN, leaving the other controllers in standby mode. 
     *     However, some subsystem manufacturers do permit multiple simultaneously active controllers.
     * @returns {IEnumVdsObject} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ienumvdsobject">IEnumVdsObject</a> interface 
     *       pointer that can be used to enumerate the controllers in the subsystem as <a href="https://docs.microsoft.com/windows/desktop/VDS/controller-object">controller objects</a>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VDS/working-with-enumeration-objects">Working with Enumeration Objects</a>. Callers must release the interface and each of the controller objects when they are no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslun-queryactivecontrollers
     */
    QueryActiveControllers() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }

    /**
     * The IVdsLun::Extend (vdshwprv.h) method extends a LUN by a specified number of bytes.
     * @remarks
     * Callers can specify a list of drives for the provider to use for extending the LUN, or direct 
     *     the provider to select the drives automatically.
     * 
     * After the LUN is extended, the caller should use the <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-ioctl_disk_update_properties">IOCTL_DISK_UPDATE_PROPERTIES</a> control code to make the updated disk size visible on the computer to which the LUN is unmasked.
     * 
     * Implementers must return a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> 
     *      interface for this method, regardless of whether the call initiates an asynchronous operation.
     * 
     * If the <i>ullNumberOfBytesToAdd</i> parameter is greater than the number of bytes available 
     *      on the drives specified in the <i>pDriveIdArray</i> parameter, use the specified drives first 
     *      and then select from whatever other drives are available. If there are not enough such drives to extend the LUN 
     *      by the requested number of bytes, return an error and do not extend the LUN.
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
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslun-extend
     */
    Extend(ullNumberOfBytesToAdd, pDriveIdArray, lNumberOfDrives) {
        result := ComCall(7, this, "uint", ullNumberOfBytesToAdd, "ptr", pDriveIdArray, "int", lNumberOfDrives, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    /**
     * The IVdsLun::Shrink (vdshwprv.h) method shrinks a LUN by a specified number of bytes.
     * @remarks
     * Implementers must return a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> 
     *     interface for this method, regardless of whether the call initiates an asynchronous operation.
     * 
     * After the LUN is shrunk, the caller should use the <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-ioctl_disk_update_properties">IOCTL_DISK_UPDATE_PROPERTIES</a> control code to make the updated disk size visible on the computer to which the LUN is unmasked.
     * 
     * Implementers must remove the bytes from the end of the LUN.
     * @param {Integer} ullNumberOfBytesToRemove The number of bytes by which to shrink the LUN. The number of bytes is not required to be an even multiple 
     *       of the block or sector size.
     * @returns {IVdsAsync} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface pointer. 
     *       Callers must release the interface. Use this interface to cancel, wait for, or query the status of the operation.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslun-shrink
     */
    Shrink(ullNumberOfBytesToRemove) {
        result := ComCall(8, this, "uint", ullNumberOfBytesToRemove, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    /**
     * The IVdsLun::QueryPlexes (vdshwprv.h) method returns an enumeration of the plexes in a LUN.
     * @remarks
     * All LUNs must have at least one plex; mirrored LUNs have multiple plexes.
     * @returns {IEnumVdsObject} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ienumvdsobject">IEnumVdsObject</a> interface 
     *       pointer that can be used to enumerate the plexes  as <a href="https://docs.microsoft.com/windows/desktop/VDS/lun-plex-object">LUN plex objects</a>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VDS/working-with-enumeration-objects">Working with Enumeration Objects</a>. Callers must release the interface and each of the LUN  plex objects when they are no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslun-queryplexes
     */
    QueryPlexes() {
        result := ComCall(9, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }

    /**
     * The IVdsLun::AddPlex (vdshwprv.h) method adds a LUN to the target LUN as a new plex.
     * @remarks
     * After the caller adds the new LUN as a plex, it is no longer visible as a LUN. If the caller  
     *     adds a mirrored LUN, VDS includes each plex as a discrete plex. All data on the added LUN is lost.
     * 
     * Implementers must return a pointer to the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface for this method, regardless of whether 
     *     the call initiates an asynchronous operation.
     * @param {Guid} lunId The GUID of the LUN to be added as a plex.
     * @returns {IVdsAsync} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface pointer, 
     *       which VDS initializes on return. Callers must release the interface. Use this interface to cancel, wait for, or 
     *       query the status of the operation.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslun-addplex
     */
    AddPlex(lunId) {
        result := ComCall(10, this, "ptr", lunId, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    /**
     * The IVdsLun::RemovePlex (vdshwprv.h) method removes a plex from a LUN.
     * @remarks
     * The removed plex ceases to exist, and VDS frees the extents. A caller cannot remove a 
     *     standalone LUN plex. Note that a  LUN can lose its fault tolerance because of this operation. For example, if the 
     *     operation transforms the LUN from mirrored to simple, the LUN is no longer fault tolerant.
     * 
     * Implementers must return a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> 
     *     interface for this method, regardless of whether the call initiates an asynchronous operation.
     * 
     * If a caller invokes the <b>RemovePlex</b> method 
     *     with the <i>plexId</i> parameter set to a value that is not valid, you should return 
     *     <b>VDS_E_OBJECT_NOT_FOUND</b>.
     * @param {Guid} plexId The GUID of the LUN plex to be removed.
     * @returns {IVdsAsync} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface pointer, 
     *       which VDS initializes on return. Callers must release the interface. Use this interface to cancel, wait for, or 
     *       query the status of the operation.
     * 
     * If you call <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsasync-wait">IVdsAsync::Wait</a> on this method and a success HRESULT value is returned, 
     *       you must release the interfaces returned in the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_async_output">VDS_ASYNC_OUTPUT</a> structure by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on each interface pointer. However, if <b>Wait</b> returns a failure HRESULT value, or if the <i>pHrResult</i> parameter of <b>Wait</b> receives a failure HRESULT value, the interface pointers in the <b>VDS_ASYNC_OUTPUT</b> structure are <b>NULL</b> and do not need to be released. You can test for success or failure HRESULT values by using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-succeeded">SUCCEEDED</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-failed">FAILED</a> macros defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslun-removeplex
     */
    RemovePlex(plexId) {
        result := ComCall(11, this, "ptr", plexId, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    /**
     * The IVdsLun::Recover (vdshwprv.h) method starts a recovery operation on a LUN.
     * @remarks
     * The recovery operation entails mirror resynchronization, parity regeneration, or substitution 
     *     of a spare drive for a failing drive. Most subsystems initiate recovery operations automatically. However, for 
     *     those that do not, this method provides a means by which to initiate recovery manually.
     * @returns {IVdsAsync} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface pointer. 
     *       Callers must release the interface. Use this interface to cancel, wait for, or query the status of the 
     *       operation.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslun-recover
     */
    Recover() {
        result := ComCall(12, this, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    /**
     * The IVdsLun::SetMask (vdshwprv.h) method specifies the unmasking list, which is the list of computers to be granted access to the LUN.
     * @remarks
     * Before calling the <b>SetMask</b> method to mask a LUN, 
     *     the caller should uninstall the corresponding disks as follows. First, retrieve the VDS object ID of the disk that 
     *     corresponds to the LUN being masked by calling 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsserviceuninstalldisk-getdiskidfromluninfo">IVdsServiceUninstallDisk::GetDiskIdFromLunInfo</a>. 
     *     Then call 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsserviceuninstalldisk-uninstalldisks">IVdsServiceUninstallDisk::UninstallDisks</a> 
     *     with the VDS object ID of the disk.
     * 
     * <b>Windows Server 2003 and Windows Server 2003 with SP1:  </b>To uninstall the corresponding disks, perform the following steps. Note that these steps became obsolete 
     *      with Windows Server 2003 R2.
     *      <ol>
     * <li>Locate the volumes on the disks to be masked as follows:
     *        <ol>
     * <li>For each disk, call the 
     *          <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsdisk-queryextents">IVdsDisk::QueryExtents</a> method to enumerate 
     *          the disk extents. This method returns a list of 
     *          <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_disk_extent">VDS_DISK_EXTENT</a> structures. The 
     *          <b>volumeId</b> member of this structure contains the volume 
     *          <b>GUID</b>.</li>
     * <li>Enumerate the volumes managed by the software provider by calling the 
     *          <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsswprovider-querypacks">IVdsSwProvider::QueryPacks</a> method to 
     *          enumerate the packs and calling 
     *          <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdspack-queryvolumes">IVdsPack::QueryVolumes</a> to enumerate the 
     *          volumes in each pack. Call 
     *          <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolume-getproperties">IVdsVolume::GetProperties</a> to obtain the 
     *          <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_volume_prop">VDS_VOLUME_PROP</a> structure for each volume. The 
     *          <b>id</b> member of this structure contains the volume <b>GUID</b>. 
     *          The <b>pwszName</b> member contains the volume name to be passed to 
     *          <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> to obtain a volume handle.</li>
     * <li>Use the volume GUIDs that were obtained by calling 
     *          <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsdisk-queryextents">IVdsDisk::QueryExtents</a> to determine which of 
     *          the volume names you will need from the list of enumerated volumes.</li>
     * </ol>
     * </li>
     * <li>Lock each volume by using the <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-fsctl_lock_volume">FSCTL_LOCK_VOLUME</a> 
     *        control code. If the LUN is being moved to another machine as an intact volume, and another application holds a 
     *        volume lock, you should retry the <b>FSCTL_LOCK_VOLUME</b> 
     *        operation if possible before continuing on to the next step. However, if the volume is only being locked and 
     *        dismounted because it is being deleted, there is no need to retry the 
     *        <b>FSCTL_LOCK_VOLUME</b> operation.
     *        <div class="alert"><b>Note</b>  This step is optional. The purpose of this step is to allow other applications that may hold locks to 
     *         release them. Even if the lock operation fails, you should continue on to the next step.</div>
     * <div> </div>
     * </li>
     * <li>Dismount each volume by using the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-fsctl_unlock_volume">FSCTL_DISMOUNT_VOLUME</a> control code.</li>
     * <li>If the volumes are on basic disks, take them offline by using the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-ioctl_volume_offline">IOCTL_VOLUME_OFFLINE</a> control code.</li>
     * <li>Uninstall each volume using the <b>SetupDiCallClassInstaller</b> function, 
     *        passing <b>DIF_REMOVE</b> for the <i>InstallFunction</i> parameter.</li>
     * <li>Uninstall each disk using the <b>SetupDiCallClassInstaller</b> function, passing 
     *        <b>DIF_REMOVE</b> for the <i>InstallFunction</i> parameter.</li>
     * <li>Remove user-mode paths, such as mounted folders and drive-letter assignments, from the registry by calling 
     *        the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-cleanupobsoletemountpoints">IVdsService::CleanupObsoleteMountPoints</a> 
     *        method.</li>
     * </ol>
     * 
     * 
     * After a LUN is unmasked to a target machine or masked from a target machine, the LUN's visibility on that 
     *     machine may not change until a bus rescan is performed. The VDS application on the target machine initiates the 
     *     bus rescan by calling <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-reenumerate">IVdsService::Reenumerate</a>. 
     *     The initiating of the bus rescan is the responsibility of the VDS application, not the hardware provider.
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
     *       <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It 
     *       can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a> using 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate 
     *       from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is 
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
     *         <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-reenumerate">IVdsHwProvider::Reenumerate</a> method 
     *         followed by the 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-refresh">IVdsHwProvider::Refresh</a> method to restore 
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
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslun-setmask
     */
    SetMask(pwszUnmaskingList) {
        pwszUnmaskingList := pwszUnmaskingList is String ? StrPtr(pwszUnmaskingList) : pwszUnmaskingList

        result := ComCall(13, this, "ptr", pwszUnmaskingList, "HRESULT")
        return result
    }

    /**
     * The IVdsLun::Delete (vdshwprv.h) method deletes the LUN and all of its plexes. Any data on the LUN is lost. VDS frees the extents allocated to the LUN.
     * @remarks
     * If an application holds a reference to the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdslun">IVdsLun</a> interface 
     *     and calls <b>IVdsLun::Delete</b>, implementers should return 
     *     <b>VDS_E_OBJECT_DELETED</b> on subsequent calls to methods such as 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdslun-getproperties">GetProperties</a> on that interface. In this case, 
     *     the interface has an  outstanding reference and is valid, but the underlying object no longer exists.
     *    
     * 
     * If a LUN that is unmasked to a target machine is deleted, the LUN's visibility on that machine may not change until a bus rescan is performed. The VDS application on the target machine initiates the bus rescan by calling <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-reenumerate">IVdsService::Reenumerate</a>. The initiating of the bus rescan is the responsibility of the VDS application, not the hardware provider.
     * 
     * If a method such as <b>IVdsLun::Delete</b> is called in one thread while <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdssubsystem-queryluns">IVdsSubSystem::QueryLuns</a> is called in another thread that is running simultaneously, the result could be a provider access violation. The hardware provider is responsible for serializing these methods as needed to minimize such synchronization issues.
     * 
     * The hardware provider is responsible for removing the LUN's partition information so that the LUN can be reused. If the LUN is an MBR disk, this is accomplished by writing zeros to the first and last 1 MB of the disk. For a GPT disk, zeros must be written to the first and last 16 KB of the disk.
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
     * <dt><b>VDS_E_PROVIDER_CACHE_CORRUPT</b></dt>
     * <dt>0x8004241FL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This return value signals a software or communication problem inside a provider that caches information about 
     *         the array. Use the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-reenumerate">IVdsHwProvider::Reenumerate</a> 
     *         method followed by the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-refresh">IVdsHwProvider::Refresh</a> 
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
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslun-delete
     */
    Delete() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * The IVdsLun::AssociateControllers (vdshwprv.h) method sets the subsystem controllers to active or inactive with respect to the LUN.
     * @remarks
     * The caller must include each subsystem controller in exactly one of either the 
     *     <i>pActiveControllerIdArray</i> parameter or the 
     *     <i>pInactiveControllerIdArray</i> parameter for each method call. The composition of the 
     *     <i>pActiveControllerIdArray</i> and <i>pInactiveControllerIdArray</i> 
     *     parameters can be different for each of the subsystem LUNs. Most subsystems implement only one active controller, 
     *     but some allow for multiple active controllers.
     * 
     * <div class="alert"><b>Note</b>  The <b>E_INVALIDARG</b> return value can indicate that the caller did not specify all 
     *      controllers in the subsystem.  The 
     *      <b>AssociateControllers</b> method requires 
     *      that all controllers in the subsystem be present in one of the two arrays supplied.</div>
     * <div> </div>
     * Use the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdslun-queryactivecontrollers">IVdsLun::QueryActiveControllers</a> 
     *     method to query controller associations. Use the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdscontroller-queryassociatedluns">IVdsController::QueryAssociatedLuns</a> 
     *     method to query the LUNs associated with a particular controller.
     * @param {Pointer<Guid>} pActiveControllerIdArray A pointer to an array of controller GUIDs. The provider sets these controllers to active. This array 
     *       includes controllers already set to active that are to remain so.
     * @param {Integer} lNumberOfActiveControllers The number of controllers specified in the <i>pActiveControllerArray</i> parameter.
     * @param {Pointer<Guid>} pInactiveControllerIdArray A pointer to an array of controller GUIDs. The provider sets these controllers to inactive. This array 
     *       includes controllers already set to inactive that are to remain so.
     * @param {Integer} lNumberOfInactiveControllers The number of controllers specified in the  <i>pInactiveControllerIdArray</i> parameter.
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
     * <dt><b>VDS_E_PROVIDER_CACHE_CORRUPT</b></dt>
     * <dt>0x8004241FL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This return value signals a software or communication problem inside a provider that caches information 
     *         about the array. Use the 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-reenumerate">IVdsHwProvider::Reenumerate</a> method 
     *         followed by the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-refresh">IVdsHwProvider::Refresh</a> 
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
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslun-associatecontrollers
     */
    AssociateControllers(pActiveControllerIdArray, lNumberOfActiveControllers, pInactiveControllerIdArray, lNumberOfInactiveControllers) {
        result := ComCall(15, this, "ptr", pActiveControllerIdArray, "int", lNumberOfActiveControllers, "ptr", pInactiveControllerIdArray, "int", lNumberOfInactiveControllers, "HRESULT")
        return result
    }

    /**
     * The IVdsLun::QueryHints (vdshwprv.h) method returns the hints currently applied to the LUN.
     * @remarks
     * Callers can specify hints by passing in the <i>pHints</i> parameter to the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdssubsystem-createlun">IVdsSubSystem::CreateLun</a> method when 
     *     creating a LUN or by using the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdslun-applyhints">IVdsLun::ApplyHints</a> 
     *     method to apply a set of new hints to an existing LUN.
     * @returns {VDS_HINTS} A pointer to the returned LUN hints. See the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_hints">VDS_HINTS</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslun-queryhints
     */
    QueryHints() {
        pHints := VDS_HINTS()
        result := ComCall(16, this, "ptr", pHints, "HRESULT")
        return pHints
    }

    /**
     * The IVdsLun::ApplyHints (vdshwprv.h) method applies a new set of hints to the LUN. Hints that are applied to a LUN are simultaneously applied to all plexes.
     * @remarks
     * Instead of using this method, callers can specify hints by passing in the <i>pHints</i> 
     *     parameter to the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdssubsystem-createlun">IVdsSubSystem::CreateLun</a> 
     *     method when creating a LUN. Use the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdslun-queryhints">IVdsLun::QueryHints</a> method to query for existing 
     *     hints.
     * @param {Pointer<VDS_HINTS>} pHints A pointer to the new hints to be applied to the LUN. See the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_hints">VDS_HINTS</a> structure.
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
     * <dt><b>VDS_E_PROVIDER_CACHE_CORRUPT</b></dt>
     * <dt>0x8004241FL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This return value signals a software or communication problem inside a provider that caches information 
     *         about the array. Use the 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-reenumerate">IVdsHwProvider::Reenumerate</a> method 
     *         followed by the 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-refresh">IVdsHwProvider::Refresh</a> method to restore 
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
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslun-applyhints
     */
    ApplyHints(pHints) {
        result := ComCall(17, this, "ptr", pHints, "HRESULT")
        return result
    }

    /**
     * The IVdsLun::SetStatus (vdshwprv.h) method sets the status of the LUN to the specified value.
     * @remarks
     * Implementers must perform whatever operations (for example, flushing the cache) are necessary to bring the 
     *     LUN to the specified state.
     * @param {Integer} status Values enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_lun_status">VDS_LUN_STATUS</a>. Callers can 
     *       pass in a subset of the possible enumeration values. Passing in <b>VDS_LS_UNKNOWN</b> 
     *       returns <b>E_INVALIDARG</b>.
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
     * <dt><b>VDS_E_PROVIDER_CACHE_CORRUPT</b></dt>
     * <dt>0x8004241FL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This return value signals a software or communication problem inside a provider that caches information 
     *         about the array. Use the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-reenumerate">IVdsHwProvider::Reenumerate</a> 
     *         method followed by the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-refresh">IVdsHwProvider::Refresh</a> 
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
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslun-setstatus
     */
    SetStatus(status) {
        result := ComCall(18, this, "int", status, "HRESULT")
        return result
    }

    /**
     * The IVdsLun::QueryMaxLunExtendSize (vdshwprv.h) method returns the maximum size by which a LUN can be extended.
     * @param {Pointer<Guid>} pDriveIdArray A pointer to an array containing the GUIDs of the drives used for growing the LUN.  This argument can be <b>NULL</b> if 
     *             <i>lNumberOfDrives</i> is 0. In this case, the provider is expected to select all the drives
     *             possible to get the maximum size.
     * @param {Integer} lNumberOfDrives The count of drives in <i>pDriveIdArray</i>.
     * @returns {Integer} A pointer to a buffer containing the maximum bytes by which the LUN can be
     *             extended.  This argument must be non-NULL.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslun-querymaxlunextendsize
     */
    QueryMaxLunExtendSize(pDriveIdArray, lNumberOfDrives) {
        result := ComCall(19, this, "ptr", pDriveIdArray, "int", lNumberOfDrives, "uint*", &pullMaxBytesToBeAdded := 0, "HRESULT")
        return pullMaxBytesToBeAdded
    }
}
