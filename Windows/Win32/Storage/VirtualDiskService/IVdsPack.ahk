#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VDS_PACK_PROP.ahk
#Include .\IVdsProvider.ahk
#Include .\IEnumVdsObject.ahk
#Include .\IVdsAsync.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to query and perform management operations on a pack containing disks and volumes.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdspack
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsPack extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsPack
     * @type {Guid}
     */
    static IID => Guid("{3b69d7f5-9d94-4648-91ca-79939ba263bf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperties", "GetProvider", "QueryVolumes", "QueryDisks", "CreateVolume", "AddDisk", "MigrateDisks", "ReplaceDisk", "RemoveMissingDisk", "Recover"]

    /**
     * Returns the property details of a pack object.
     * @returns {VDS_PACK_PROP} The address of the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_pack_prop">VDS_PACK_PROP</a> structure 
     *       passed in by the caller. VDS allocates memory for the <b>pwszName</b> member. Callers must 
     *       free the string by using the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> 
     *       function.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdspack-getproperties
     */
    GetProperties() {
        pPackProp := VDS_PACK_PROP()
        result := ComCall(3, this, "ptr", pPackProp, "HRESULT")
        return pPackProp
    }

    /**
     * Returns the software provider associated with a pack.
     * @returns {IVdsProvider} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsprovider">IVdsProvider</a> interface pointer. Callers must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdspack-getprovider
     */
    GetProvider() {
        result := ComCall(4, this, "ptr*", &ppProvider := 0, "HRESULT")
        return IVdsProvider(ppProvider)
    }

    /**
     * Returns an object that enumerates the volumes in the pack.
     * @returns {IEnumVdsObject} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ienumvdsobject">IEnumVdsObject</a> interface pointer that can be used to enumerate the volumes  as <a href="https://docs.microsoft.com/windows/desktop/VDS/volume-object">volume objects</a>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VDS/working-with-enumeration-objects">Working with Enumeration Objects</a>. Callers must release the interface and each of the volume objects when they are no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdspack-queryvolumes
     */
    QueryVolumes() {
        result := ComCall(5, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }

    /**
     * Returns an object that enumerates the disks in the pack.
     * @returns {IEnumVdsObject} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ienumvdsobject">IEnumVdsObject</a> interface pointer that can be used to enumerate the disks  as <a href="https://docs.microsoft.com/windows/desktop/VDS/disk-object">disk objects</a>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VDS/working-with-enumeration-objects">Working with Enumeration Objects</a>. Callers must release the interface and each of the disk objects when they are no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdspack-querydisks
     */
    QueryDisks() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }

    /**
     * Creates a volume within the pack.
     * @param {Integer} type A volume type enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_volume_type">VDS_VOLUME_TYPE</a>. 
     *       Volumes on basic disks can have only one extent, and only the <b>VDS_VT_SIMPLE</b> flag is 
     *       valid.
     * @param {Pointer<VDS_INPUT_DISK>} pInputDiskArray Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_input_disk">VDS_INPUT_DISK</a> 
     *       structures; one structure for each disk. A disk can be included in the array only once. All disks in the array 
     *       must be used, or the method fails. Callers must allocate and initialize the array, and free the memory when the 
     *       call returns.
     * @param {Integer} lNumberOfDisks The total number of disks contributing to the volume. 
     *       
     * 
     * <div class="alert"><b>Note</b>  VDS imposes a 32-disk limit on spanned, striped, and striped with parity (RAID-5) volumes.</div>
     * <div> </div>
     * @param {Integer} ulStripeSize If the volume is striped, the size of each stripe in bytes. Pass in zero bytes for 
     *       <b>VDS_VT_SIMPLE</b>, <b>VDS_VT_SPAN</b>, and 
     *       <b>VDS_VT_MIRROR</b>; 64 kilobytes for <b>VDS_VT_STRIPE</b> and 
     *       <b>VDS_VT_PARITY</b>.
     * @returns {IVdsAsync} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface pointer, 
     *       which VDS initializes on return. Callers must release the interface. Use this pointer to cancel, wait for, 
     *       or query the status of the operation.
     * 
     * If you call <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsasync-wait">IVdsAsync::Wait</a> on this method and a success HRESULT value is returned, 
     *       you must release the interfaces returned in the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_async_output">VDS_ASYNC_OUTPUT</a> structure by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on each interface pointer. However, if <b>Wait</b> returns a failure HRESULT value, or if the <i>pHrResult</i> parameter of <b>Wait</b> receives a failure HRESULT value, the interface pointers in the <b>VDS_ASYNC_OUTPUT</b> structure are <b>NULL</b> and do not need to be released. You can test for success or failure HRESULT values by using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-succeeded">SUCCEEDED</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-failed">FAILED</a> macros defined in Winerror.h.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdspack-createvolume
     */
    CreateVolume(type, pInputDiskArray, lNumberOfDisks, ulStripeSize) {
        result := ComCall(7, this, "int", type, "ptr", pInputDiskArray, "int", lNumberOfDisks, "uint", ulStripeSize, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    /**
     * Adds a disk to an online pack.
     * @param {Guid} DiskId The GUID of the disk.
     * @param {Integer} PartitionStyle The style can be MBR or GPT. See the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_partition_style">VDS_PARTITION_STYLE</a>enumeration.
     * @param {BOOL} bAsHotSpare If true,  VDS can use the disk as a hot spare; otherwise, the disk cannot be used for this operation. Only hardware providers support hot sparing.
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
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The disk was added successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_NOT_AN_UNALLOCATED_DISK</b></dt>
     * <dt>0x80042418L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The disk is raw.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_OPERATION_DENIED</b></dt>
     * <dt>0x8004240AL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The disk to be added is being cleaned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_PROVIDER_FAILURE</b></dt>
     * <dt>0x80042442L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is a provider failure during the operation.
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
     * Adding a second disk to a basic pack is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_PACK_OFFLINE</b></dt>
     * <dt>0x80042444L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The target pack is inaccessible.
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
     * The disk is not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_DMADMIN_METHOD_CALL_FAILED</b></dt>
     * <dt>0x80042420L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The logical disk manager (LDM) service failed to complete a method.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_PROVIDER_CACHE_CORRUPT</b></dt>
     * <dt>0x8004241FL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The dynamic provider cache is corrupt.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdspack-adddisk
     */
    AddDisk(DiskId, PartitionStyle, bAsHotSpare) {
        result := ComCall(8, this, "ptr", DiskId, "int", PartitionStyle, "int", bAsHotSpare, "HRESULT")
        return result
    }

    /**
     * Migrates a set of disks from one pack to another pack.
     * @param {Pointer<Guid>} pDiskArray A pointer to an array of GUIDs; one for each disk.
     * @param {Integer} lNumberOfDisks The number of disks to migrate.
     * @param {Guid} TargetPack The GUID of the pack object.
     * @param {BOOL} bForce If this parameter is set to <b>TRUE</b>, VDS ignores all errors from this method and attempts to migrate the disks unconditionally. If it is set to <b>FALSE</b>, the 
     *       operation does not proceed. In some cases, a forced migration can cause data loss.
     * @param {BOOL} bQueryOnly If this parameter is set to <b>TRUE</b>, the migration does not occur. If it is set to <b>FALSE</b>, the operation proceeds.
     * @param {Pointer<HRESULT>} pResults The address of a caller-allocated array of <b>HRESULT</b> values.
     *        The number of elements in the array is <i>lNumberOfDisks</i>.
     * 
     * If a disk can be migrated, or was migrated successfully, the corresponding array element receives 
     *       <b>S_OK</b>; otherwise, it receives the warning code or error code that was returned by the provider. For the list 
     *       of additional result codes, see Return Values.
     * @param {Pointer<BOOL>} pbRebootNeeded If this parameter is set to <b>TRUE</b>, you must restart the computer to complete the operation. If it is set to <b>FALSE</b>, the operation completes without restarting.
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
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The migration completed successfully.
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
     * At least one of the disks cannot be converted, or can be converted with warning.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_DISK_NOT_ONLINE</b></dt>
     * <dt>0x8004244BL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the disks is unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_IMPORT_SET_INCOMPLETE</b></dt>
     * <dt>0x80042451L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An attempt was made to import a subset of the disks in the foreign pack.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The following warnings and errors can be returned through <i>pResults</i>:
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_S_BOOT_PARTITION_NUMBER_CHANGE</b></dt>
     * <dt>0x00042436L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The partition number of the boot partition changed as the result of the migration operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_NO_FREE_SPACE</b></dt>
     * <dt>0x80042437L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The selected disk does not have enough free space to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_ACTIVE_PARTITION</b></dt>
     * <dt>0x80042438L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An active partition was detected on the selected disk, and it is not the active partition used to boot the 
     *         active operating system.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_PARTITION_OF_UNKNOWN_TYPE</b></dt>
     * <dt>0x80042439L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The partition information cannot be read.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_LEGACY_VOLUME_FORMAT</b></dt>
     * <dt>0x8004243AL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A partition with an unknown type was detected on the selected disk.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_NON_CONTIGUOUS_DATA_PARTITIONS</b></dt>
     * <dt>0x8004243BL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The selected GPT disk contains a non-basic data partition, which is both preceded by and followed by one 
     *         or more basic data partitions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_MIGRATE_OPEN_VOLUME</b></dt>
     * <dt>0x8004243CL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A volume on the selected disk cannot be opened.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdspack-migratedisks
     */
    MigrateDisks(pDiskArray, lNumberOfDisks, TargetPack, bForce, bQueryOnly, pResults, pbRebootNeeded) {
        pResultsMarshal := pResults is VarRef ? "int*" : "ptr"
        pbRebootNeededMarshal := pbRebootNeeded is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, "ptr", pDiskArray, "int", lNumberOfDisks, "ptr", TargetPack, "int", bForce, "int", bQueryOnly, pResultsMarshal, pResults, pbRebootNeededMarshal, pbRebootNeeded, "HRESULT")
        return result
    }

    /**
     * Not supported.This method is reserved for future use.
     * @param {Guid} OldDiskId The GUID of the old disk.
     * @param {Guid} NewDiskId The GUID of the new disk.
     * @returns {IVdsAsync} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface pointer, 
     *       which VDS initializes on return. Callers must release the interface. Use this interface to cancel, wait for, or 
     *       query the status of the operation.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdspack-replacedisk
     */
    ReplaceDisk(OldDiskId, NewDiskId) {
        result := ComCall(10, this, "ptr", OldDiskId, "ptr", NewDiskId, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    /**
     * Removes a disk that is missing from the pack. This method applies to software provider objects only.
     * @param {Guid} DiskId The VDS_OBJECT_ID of the missing disk.
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
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All details of the disk were removed successfully.
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
     * <i>DiskId</i> is a basic disk.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdspack-removemissingdisk
     */
    RemoveMissingDisk(DiskId) {
        result := ComCall(11, this, "ptr", DiskId, "HRESULT")
        return result
    }

    /**
     * Returns a failing or failed pack to a healthy state, if possible. This method is supported only for dynamic packs.
     * @returns {IVdsAsync} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface pointer, which VDS 
     *       initializes on return. Callers must release the interface. Use this interface to cancel, wait for, or query the 
     *       status of the operation.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdspack-recover
     */
    Recover() {
        result := ComCall(12, this, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }
}
