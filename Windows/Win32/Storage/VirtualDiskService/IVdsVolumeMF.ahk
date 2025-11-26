#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VDS_FILE_SYSTEM_PROP.ahk
#Include .\IVdsAsync.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to perform access-path and file-system activities on the volume object.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsvolumemf
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsVolumeMF extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsVolumeMF
     * @type {Guid}
     */
    static IID => Guid("{ee2d5ded-6236-4169-931d-b9778ce03dc6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFileSystemProperties", "Format", "AddAccessPath", "QueryAccessPaths", "QueryReparsePoints", "DeleteAccessPath", "Mount", "Dismount", "SetFileSystemFlags", "ClearFileSystemFlags"]

    /**
     * Returns property details about the file system on the current volume.
     * @returns {VDS_FILE_SYSTEM_PROP} The address of the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_file_system_prop">VDS_FILE_SYSTEM_PROP</a> 
     *       structure allocated and passed in by the caller. VDS allocates memory for the 
     *       <b>pwszLabel</b> member string. Callers must free the string by using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvolumemf-getfilesystemproperties
     */
    GetFileSystemProperties() {
        pFileSystemProp := VDS_FILE_SYSTEM_PROP()
        result := ComCall(3, this, "ptr", pFileSystemProp, "HRESULT")
        return pFileSystemProp
    }

    /**
     * Formats a file system on the current volume.
     * @param {Integer} type A <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_file_system_type">VDS_FILE_SYSTEM_TYPE</a> enumeration value that specifies the file system to be used. Must be one of the following: VDS_FST_NTFS, VDS_FST_FAT, VDS_FST_FAT32, or VDS_FST_UDF.
     * @param {PWSTR} pwszLabel A string representing the file system label.
     * @param {Integer} dwUnitAllocationSize The size of the allocation unit for the file system in bytes, which is usually between 512 and 
     *       65536.
     * @param {BOOL} bForce If <b>TRUE</b>, the file system is formatted unconditionally even while in use; 
     *       otherwise, the operation fails.
     * @param {BOOL} bQuickFormat If <b>TRUE</b>, VDS performs a quick format (it does not verify each sector on the 
     *       volume).
     * @param {BOOL} bEnableCompression If <b>TRUE</b>, compression is enabled on the newly formatted file system. Compression 
     *       is a feature of NTFS, and is ignored for FAT and FAT32.
     * @returns {IVdsAsync} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface pointer, which 
     *       VDS initializes on return. Callers must release the interface. Use this pointer to cancel, wait for, or query 
     *       the status of the operation.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvolumemf-format
     */
    Format(type, pwszLabel, dwUnitAllocationSize, bForce, bQuickFormat, bEnableCompression) {
        pwszLabel := pwszLabel is String ? StrPtr(pwszLabel) : pwszLabel

        result := ComCall(4, this, "int", type, "ptr", pwszLabel, "uint", dwUnitAllocationSize, "int", bForce, "int", bQuickFormat, "int", bEnableCompression, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    /**
     * Adds an access path.
     * @param {PWSTR} pwszPath A string indicating the access path, which is a user-mode path that can be used to open the volume. An access path can be a drive letter or a path to an empty directory on an NTFS volume. The access path string must include a trailing 
     *       backslash, for example, "F:\".
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
     * The path was added successfully.
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
     * The access path was added successfully, however, an error occurred. VDS possibly failed to update the 
     *         GPT_BASIC_DATA_ATTRIBUTE_NO_DRIVE_LETTER attribute of a partition or failed to add a default network share (such as F$) 
     *         while adding the drive letter. For more information, see <a href="/windows/desktop/api/winioctl/ns-winioctl-partition_information_gpt">PARTITION_INFORMATION_GPT</a>.
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
     * The volume failed.
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
     * The pack containing the volume is not accessible.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvolumemf-addaccesspath
     */
    AddAccessPath(pwszPath) {
        pwszPath := pwszPath is String ? StrPtr(pwszPath) : pwszPath

        result := ComCall(5, this, "ptr", pwszPath, "HRESULT")
        return result
    }

    /**
     * Returns a list of access paths and a drive letter, if one exists, for the current volume.
     * @param {Pointer<Pointer<PWSTR>>} pwszPathArray <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>
     * @param {Pointer<Integer>} plNumberOfAccessPaths A pointer to the number of access paths on the volume.
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
     * <dt><b>VDS_E_OBJECT_STATUS_FAILED</b></dt>
     * <dt>0x80042431L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The volume failed.
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
     * The pack containing the volume is  not accessible.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvolumemf-queryaccesspaths
     */
    QueryAccessPaths(pwszPathArray, plNumberOfAccessPaths) {
        pwszPathArrayMarshal := pwszPathArray is VarRef ? "ptr*" : "ptr"
        plNumberOfAccessPathsMarshal := plNumberOfAccessPaths is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, pwszPathArrayMarshal, pwszPathArray, plNumberOfAccessPathsMarshal, plNumberOfAccessPaths, "HRESULT")
        return result
    }

    /**
     * Returns all reparse points for the current volume.
     * @param {Pointer<Pointer<VDS_REPARSE_POINT_PROP>>} ppReparsePointProps Pointer to a buffer that receives a pointer to an array of properties defined by the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_reparse_point_prop">VDS_REPARSE_POINT_PROP</a>structure.
     * @param {Pointer<Integer>} plNumberOfReparsePointProps Pointer to a buffer containing the number of reparse-point properties.
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
     * <dt><b>VDS_E_OBJECT_STATUS_FAILED</b></dt>
     * <dt>0x80042431L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The volume failed.
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
     * The pack containing the volume is  not accessible.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvolumemf-queryreparsepoints
     */
    QueryReparsePoints(ppReparsePointProps, plNumberOfReparsePointProps) {
        ppReparsePointPropsMarshal := ppReparsePointProps is VarRef ? "ptr*" : "ptr"
        plNumberOfReparsePointPropsMarshal := plNumberOfReparsePointProps is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, ppReparsePointPropsMarshal, ppReparsePointProps, plNumberOfReparsePointPropsMarshal, plNumberOfReparsePointProps, "HRESULT")
        return result
    }

    /**
     * Removes the access path from the current volume.
     * @param {PWSTR} pwszPath A string that contains the access path to be removed. An access path can be a drive letter or a path to an empty directory on an NTFS volume. If it is a drive letter, you must include a trailing backslash, for example, "F:\". If it is a path to a directory, the trailing backslash is not required, for example, "C:\MyFolder\MyDocuments".
     * @param {BOOL} bForce If <b>TRUE</b>, the access path is deleted unconditionally, even if the volume is in 
     *       use. This parameter is meaningful only when the access path is a drive letter.
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
     * <dt><b>VDS_E_OPERATION_DENIED</b></dt>
     * <dt>0x8004240AL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The path leads to the system volume, the boot volume, the crashdump volume, the hibernation volume, or 
     *        the pagefile volume. You cannot remove the drive letter from these volumes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_PATH_NOT_FOUND</b></dt>
     * <dt>0x80042416L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified path is not found.
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
     * The access path was deleted successfully, however, an error occurred. VDS possibly failed to update the 
     *         GUID partition table (GPT) attribute of a partition or failed to delete a default network share (such as F$) 
     *         while deleting the drive letter.
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
     * The volume failed.
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
     * The pack containing the volume is not accessible.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvolumemf-deleteaccesspath
     */
    DeleteAccessPath(pwszPath, bForce) {
        pwszPath := pwszPath is String ? StrPtr(pwszPath) : pwszPath

        result := ComCall(8, this, "ptr", pwszPath, "int", bForce, "HRESULT")
        return result
    }

    /**
     * Mounts a volume.
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
     * <dt><b>VDS_E_OBJECT_STATUS_FAILED</b></dt>
     * <dt>0x80042431L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The volume object is inaccessible.
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
     * The pack containing the volume is not accessible.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvolumemf-mount
     */
    Mount() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * Dismounts a mounted volume.
     * @param {BOOL} bForce If <b>TRUE</b>, the volume is dismounted even if it is in use; otherwise, the operation fails if the volume is in use.
     * @param {BOOL} bPermanent If <b>TRUE</b>, the volume remains dismounted until an access path is added.
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
     * <dt><b>VDS_E_VOLUME_TEMPORARILY_DISMOUNTED</b></dt>
     * <dt>0x8004245CL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The volume is already dismounted. 
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
     * The volume cannot be dismounted. It does not support the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_VOLUME_PERMANENTLY_DISMOUNTED</b></dt>
     * <dt>0x8004245DL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The volume is already dismounted. It cannot be dismounted temporarily until it becomes mountable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_VOLUME_HAS_PATH</b></dt>
     * <dt>0x8004245EL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The volume cannot be dismounted because it still has an access path.
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
     * The volume is in use and cannot be dismounted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvolumemf-dismount
     */
    Dismount(bForce, bPermanent) {
        result := ComCall(10, this, "int", bForce, "int", bPermanent, "HRESULT")
        return result
    }

    /**
     * Sets the file-system flags.
     * @param {Integer} ulFlags The flags enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_file_system_flag">VDS_FILE_SYSTEM_FLAG</a>. Callers can set the <b>VDS_FPF_COMPRESSED</b> flag.
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
     * The volume is hidden. This method cannot be called on a hidden volume.
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
     * The volume failed.
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
     * The pack containing the volume is not accessible.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvolumemf-setfilesystemflags
     */
    SetFileSystemFlags(ulFlags) {
        result := ComCall(11, this, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * Clears the file-system flags.
     * @param {Integer} ulFlags The flags enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_file_system_flag">VDS_FILE_SYSTEM_FLAG</a>. Callers can clear the <b>VDS_FPF_COMPRESSED</b> flag.
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
     * The volume is hidden. This method cannot be called on a hidden volume.
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
     * The volume failed.
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
     * The pack containing the volume is not accessible.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvolumemf-clearfilesystemflags
     */
    ClearFileSystemFlags(ulFlags) {
        result := ComCall(12, this, "uint", ulFlags, "HRESULT")
        return result
    }
}
