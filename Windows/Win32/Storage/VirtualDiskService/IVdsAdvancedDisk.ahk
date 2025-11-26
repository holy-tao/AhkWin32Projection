#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VDS_PARTITION_PROP.ahk
#Include .\IVdsAsync.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates and deletes partitions, and modifies partition attributes.
 * @remarks
 * 
 * The relationship between partitions and volumes is complex, and is best described in terms of the software provider (basic or dynamic) that manages the disk. Basic providers support the following three categories of partitions:
 * 
 * <ul>
 * <li>Partitions that are not volumes, because you can neither format them nor assign a drive letter to them. These partitions are MSR partitions, LDM Metadata partitions, and extended partitions. </li>
 * <li>Partitions associated with hidden volumes, which you can format and assign a drive letter to, but which host no user data. Instead, the system uses these partitions for booting, recovery, and so on. The partitions include OEM partitions, ESP partitions on GPT disks, and Unknown partitions. You cannot use the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nn-vds-ivdsvolume">IVdsVolume</a> or <a href="https://docs.microsoft.com/windows/desktop/api/vds/nn-vds-ivdsvolumemf">IVdsVolumeMF</a> interfaces to format these partitions. Instead, use the <b>IVdsAdvancedDisk</b> interface, which exposes the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsadvanceddisk-assigndriveletter">AssignDriveLetter</a>, <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsadvanceddisk-deletedriveletter">DeleteDriveLetter</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsadvanceddisk-formatpartition">FormatPartition</a> methods.
 * 
 * </li>
 * <li>Partitions that do not fall into the preceding two categories hold user data, files, and the installed operating system for the user. These partitions are always volumes; you can format them, assign  drive letters to them, and enumerate through them with the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-findfirstvolumew">FindFirstVolume</a> and <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-findnextvolumew">FindNextVolume</a> functions.</li>
 * </ul>
 * In general, dynamic providers  do not map volumes to partitions. The exceptions are system volumes, boot volumes, and volumes for which the caller explicitly requests this mapping. 
 * Only the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsadvanceddisk-getpartitionproperties">GetPartitionProperties</a>, <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsadvanceddisk-querypartitions">QueryPartitions</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsadvanceddisk-clean">Clean</a> methods are valid operations to be performed on dynamic disks. All other methods fail. Except for the <b>Clean</b> method, configuration-type operations are not valid on dynamic disks.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsadvanceddisk
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsAdvancedDisk extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsAdvancedDisk
     * @type {Guid}
     */
    static IID => Guid("{6e6f6b40-977c-4069-bddd-ac710059f8c0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPartitionProperties", "QueryPartitions", "CreatePartition", "DeletePartition", "ChangeAttributes", "AssignDriveLetter", "DeleteDriveLetter", "GetDriveLetter", "FormatPartition", "Clean"]

    /**
     * Returns the properties of the partition identified by the partition offset.
     * @param {Integer} ullOffset The partition offset.
     * @returns {VDS_PARTITION_PROP} The address of the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_partition_prop">VDS_PARTITION_PROP</a>structure allocated and passed in by the caller.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsadvanceddisk-getpartitionproperties
     */
    GetPartitionProperties(ullOffset) {
        pPartitionProp := VDS_PARTITION_PROP()
        result := ComCall(3, this, "uint", ullOffset, "ptr", pPartitionProp, "HRESULT")
        return pPartitionProp
    }

    /**
     * Returns the details of all partitions on the current disk.
     * @param {Pointer<Pointer<VDS_PARTITION_PROP>>} ppPartitionPropArray A pointer to the array of 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_partition_prop">VDS_PARTITION_PROP</a> structures passed in by the caller. Callers must free this array by using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @param {Pointer<Integer>} plNumberOfPartitions A pointer to the number of elements in the array returned in the <i>ppPartitionPropArray</i> parameter.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The query was successful.
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
     * The disk contains no partitions.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsadvanceddisk-querypartitions
     */
    QueryPartitions(ppPartitionPropArray, plNumberOfPartitions) {
        ppPartitionPropArrayMarshal := ppPartitionPropArray is VarRef ? "ptr*" : "ptr"
        plNumberOfPartitionsMarshal := plNumberOfPartitions is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, ppPartitionPropArrayMarshal, ppPartitionPropArray, plNumberOfPartitionsMarshal, plNumberOfPartitions, "HRESULT")
        return result
    }

    /**
     * Creates a partition on a basic disk. The IVdsCreatePartitionEx::CreatePartitionEx method supersedes this method.
     * @param {Integer} ullOffset The partition offset.
     * @param {Integer} ullSize The size, in bytes, of the new partition.
     * @param {Pointer<CREATE_PARTITION_PARAMETERS>} para The pointer to parameters defined by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-create_partition_parameters">CREATE_PARTITION_PARAMETERS</a> 
     *       structure.
     * @returns {IVdsAsync} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface pointer, which 
     *       VDS initializes on return. Callers must release the interface. Use this pointer to cancel, wait for, or query 
     *       the status of the operation.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsadvanceddisk-createpartition
     */
    CreatePartition(ullOffset, ullSize, para) {
        result := ComCall(5, this, "uint", ullOffset, "uint", ullSize, "ptr", para, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    /**
     * Deletes a partition from a basic disk.
     * @param {Integer} ullOffset The partition offset.
     * @param {BOOL} bForce If this parameter is set to <b>TRUE</b>, VDS deletes all partitions unconditionally (excluding OEM, ESP or MSR). If it is set to <b>FALSE</b>, the operation 
     *       fails if the partition is in use. A partition is considered to be in use if calls to lock or dismount the volume fail.
     * @param {BOOL} bForceProtected If this parameter is set to <b>TRUE</b>, VDS deletes all protected partitions (including OEM, ESP and MSR) unconditionally. If it is set to <b>FALSE</b>, the 
     *       operation fails if the partition is protected.
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
     * The partition was deleted successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_INVALID_OPERATION</b></dt>
     * <dt>0x80042415L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media does not support this operation. For example, you cannot delete a partition on a CD-ROM.
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
     * This operation is not supported on dynamic disks.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_PARTITION_NOT_EMPTY</b></dt>
     * <dt>0x80042408L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The extended partition is not empty.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_BAD_PROVIDER_DATA</b></dt>
     * <dt>0x80042441L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value indicates a provider error. The operation is aborted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_DEVICE_IN_USE</b></dt>
     * <dt>0x80042413L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The partition is in use.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_S_ACCESS_PATH_NOT_DELETED</b></dt>
     * <dt>0x00044244L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The partition was deleted successfully, but VDS failed to remove the access paths.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_S_UPDATE_BOOTFILE_FAILED</b></dt>
     * <dt>0x00042434L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The partition was deleted successfully, but VDS failed to update the boot options in the Boot Configuration Data (BCD) store.
     * 
     * <b>Windows Server 2003:  </b>Boot options are stored in the boot.ini file on an x86 or x64 system 
     *         or NVRAM on an Itanium system.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsadvanceddisk-deletepartition
     */
    DeletePartition(ullOffset, bForce, bForceProtected) {
        result := ComCall(6, this, "uint", ullOffset, "int", bForce, "int", bForceProtected, "HRESULT")
        return result
    }

    /**
     * Modifies the attributes of the partition.
     * @param {Integer} ullOffset The partition offset.
     * @param {Pointer<CHANGE_ATTRIBUTES_PARAMETERS>} para The attribute parameters defined by  the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-change_attributes_parameters">CHANGE_ATTRIBUTES_PARAMETERS</a> structure.
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
     * The parameter was changed successfully.
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
     * The operation is not supported on dynamic disks, or the disk is  removable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_INVALID_OPERATION</b></dt>
     * <dt>0x80042415L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The partition is an extended partition. Extended partitions have no attributes to change.
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
     * The partition does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsadvanceddisk-changeattributes
     */
    ChangeAttributes(ullOffset, para) {
        result := ComCall(7, this, "uint", ullOffset, "ptr", para, "HRESULT")
        return result
    }

    /**
     * Assigns a drive letter to an existing OEM, ESP, or unknown partition.
     * @param {Integer} ullOffset The partition offset.
     * @param {Integer} wcLetter The drive letter to assign.
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
     * The drive letter was assigned successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_DRIVE_LETTER_NOT_FREE</b></dt>
     * <dt>0x8004255CL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified drive letter is already assigned to another partition or volume.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_INVALID_OPERATION</b></dt>
     * <dt>0x80042415L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The partition is on a removable media; otherwise,  the partition is not an OEM, ESP or unknown partition.
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
     * The partition does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsadvanceddisk-assigndriveletter
     */
    AssignDriveLetter(ullOffset, wcLetter) {
        result := ComCall(8, this, "uint", ullOffset, "char", wcLetter, "HRESULT")
        return result
    }

    /**
     * Deletes a drive letter assigned to an OEM, ESP, or unknown partition.
     * @param {Integer} ullOffset The partition offset.
     * @param {Integer} wcLetter The drive letter to delete.
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
     * The drive letter was deleted successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_INVALID_OPERATION</b></dt>
     * <dt>0x80042415L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The partition is on a removable media; otherwise the partition is not an OEM, ESP or unknown partition.
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
     * The partition does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsadvanceddisk-deletedriveletter
     */
    DeleteDriveLetter(ullOffset, wcLetter) {
        result := ComCall(9, this, "uint", ullOffset, "char", wcLetter, "HRESULT")
        return result
    }

    /**
     * Returns the drive letter assigned to an OEM, ESP, or unknown partition.
     * @param {Integer} ullOffset The partition offset.
     * @param {PWSTR} pwcLetter A pointer to a buffer that receives the drive letter.
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
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_INVALID_OPERATION</b></dt>
     * <dt>0x80042415L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The partition is on a removable media; otherwise, the partition is not an OEM, ESP, or unknown partition.
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
     * The partition does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsadvanceddisk-getdriveletter
     */
    GetDriveLetter(ullOffset, pwcLetter) {
        pwcLetter := pwcLetter is String ? StrPtr(pwcLetter) : pwcLetter

        result := ComCall(10, this, "uint", ullOffset, "ptr", pwcLetter, "HRESULT")
        return result
    }

    /**
     * Formats an existing OEM, ESP, or unknown partition.
     * @param {Integer} ullOffset The partition offset.
     * @param {Integer} type A 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_file_system_type">VDS_FILE_SYSTEM_TYPE</a> enumeration value that specifies the file system to be used. Must be one of the following: VDS_FST_NTFS, VDS_FST_FAT, VDS_FST_FAT32, or VDS_FST_UDF.
     * @param {PWSTR} pwszLabel A string representing the volume label.
     * @param {Integer} dwUnitAllocationSize The size of the allocation unit for the file system in bytes, which is usually between 512 and 
     *       65536.
     * @param {BOOL} bForce If <b>TRUE</b>, the partition is formatted even while in use; otherwise, the operation 
     *       fails.
     * @param {BOOL} bQuickFormat If <b>TRUE</b>, VDS performs a quick format. A quick format does not verify each sector 
     *       on the volume.
     * @param {BOOL} bEnableCompression If <b>TRUE</b>, enables compression on the newly formatted file system. Compression is a 
     *       feature of NTFS and cannot be 
     *       set for FAT and FAT32 file systems.
     * @returns {IVdsAsync} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface pointer, which 
     *       VDS initializes on return. Callers must release the interface. Use this pointer to cancel, wait for, or query 
     *       the status of the operation.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsadvanceddisk-formatpartition
     */
    FormatPartition(ullOffset, type, pwszLabel, dwUnitAllocationSize, bForce, bQuickFormat, bEnableCompression) {
        pwszLabel := pwszLabel is String ? StrPtr(pwszLabel) : pwszLabel

        result := ComCall(11, this, "uint", ullOffset, "int", type, "ptr", pwszLabel, "uint", dwUnitAllocationSize, "int", bForce, "int", bQuickFormat, "int", bEnableCompression, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    /**
     * Removes partition information and uninitializes basic or dynamic disks.Windows Server 2003:  The Clean method is not supported for removable devices.
     * @param {BOOL} bForce If <b>TRUE</b>, cleans a disk containing data volumes or ESP partitions.
     * @param {BOOL} bForceOEM If <b>TRUE</b>, cleans a MBR-based disk containing the known OEM partitions in the following table or cleans a 
     *       GPT-based disk containing any OEM partition. An OEM partition has the GPT_ATTRIBUTE_PLATFORM_REQUIRED flag set 
     *       on a GPT-based disk.
     *       
     * 
     * <table>
     * <tr>
     * <th>Partition type</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>0x12</td>
     * <td>An EISA partition.</td>
     * </tr>
     * <tr>
     * <td>0x84</td>
     * <td>A hibernation partition for laptops.</td>
     * </tr>
     * <tr>
     * <td>0xA0</td>
     * <td>A diagnostic partition for some HP laptops.</td>
     * </tr>
     * <tr>
     * <td>0xDE</td>
     * <td>A partition defined by Dell.</td>
     * </tr>
     * <tr>
     * <td>0xFE</td>
     * <td>An IBM IML partition.</td>
     * </tr>
     * </table>
     * @param {BOOL} bFullClean If <b>TRUE</b>, cleans the entire disk by replacing the data on each sector with zeros; otherwise, this method cleans 
     *       only the first and the last megabytes on the disk.
     * @returns {IVdsAsync} The address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface 
     *       pointer, which VDS initializes on return. Callers must release the interface. Use this pointer to cancel, wait 
     *       for, or query the status of the operation.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsadvanceddisk-clean
     */
    Clean(bForce, bForceOEM, bFullClean) {
        result := ComCall(12, this, "int", bForce, "int", bForceOEM, "int", bFullClean, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }
}
