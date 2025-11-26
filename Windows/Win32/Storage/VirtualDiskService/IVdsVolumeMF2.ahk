#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IVdsAsync.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to perform additional file system management operations on the volume object.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsvolumemf2
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsVolumeMF2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsVolumeMF2
     * @type {Guid}
     */
    static IID => Guid("{4dbcee9a-6343-4651-b85f-5e75d74d983c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFileSystemTypeName", "QueryFileSystemFormatSupport", "FormatEx"]

    /**
     * Retrieves the name of the file system on a volume.
     * @returns {PWSTR} Pointer that upon successful completion receives a null-terminated Unicode string with the file system name.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvolumemf2-getfilesystemtypename
     */
    GetFileSystemTypeName() {
        result := ComCall(3, this, "ptr*", &ppwszFileSystemTypeName := 0, "HRESULT")
        return ppwszFileSystemTypeName
    }

    /**
     * Retrieves the properties of the file systems that are supported for formatting a volume.
     * @param {Pointer<Pointer<VDS_FILE_SYSTEM_FORMAT_SUPPORT_PROP>>} ppFileSystemSupportProps A pointer to the array of <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_file_system_format_support_prop">VDS_FILE_SYSTEM_FORMAT_SUPPORT_PROP</a> structures passed in by the caller. Upon successful completion, these structures contain information about the properties of the supported file systems. Callers must free this array by using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @param {Pointer<Integer>} plNumberOfFileSystems A pointer to a variable that upon successful completion receives the total number of elements in array pointed to by the <i>ppFileSystemSupportProps</i> parameter.
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
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvolumemf2-queryfilesystemformatsupport
     */
    QueryFileSystemFormatSupport(ppFileSystemSupportProps, plNumberOfFileSystems) {
        ppFileSystemSupportPropsMarshal := ppFileSystemSupportProps is VarRef ? "ptr*" : "ptr"
        plNumberOfFileSystemsMarshal := plNumberOfFileSystems is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, ppFileSystemSupportPropsMarshal, ppFileSystemSupportProps, plNumberOfFileSystemsMarshal, plNumberOfFileSystems, "HRESULT")
        return result
    }

    /**
     * Formats a file system volume on a partition.
     * @param {PWSTR} pwszFileSystemTypeName <b>Null</b>-terminated Unicode string containing the name of the file system with which to format the volume. This parameter can be <b>NULL</b> or the name of a Windows file system. The following file systems are supported: "NTFS", "FAT", "FAT32", "UDF", and "EXFAT". If this parameter is <b>NULL</b>, the default file system is used. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_file_system_format_support_flag">VDS_FILE_SYSTEM_FORMAT_SUPPORT_FLAG</a>.
     * @param {Integer} usFileSystemRevision The revision of the file system, if any.  This member is expressed as a 16-bit binary-coded decimal number, where a decimal point is implied between the second and third digits. For example, a value of 0x0250 indicates revision 2.50.
     * @param {Integer} ulDesiredUnitAllocationSize The size of the allocation unit for the file system, in bytes.  The value must be a power of 2.  If the value is 0, a default allocation unit determined by the file system type will be used.  The allocation unit range is file system dependent.
     * @param {PWSTR} pwszLabel <b>Null</b>-terminated Unicode string to assign to the new file system.  The maximum label size is file system dependent.
     * @param {BOOL} bForce Boolean that determines whether a file system format is forced, regardless of whether the partition is in use.
     * @param {BOOL} bQuickFormat Boolean that determines whether a file system volume is quick-formatted.  A quick format does not verify each sector on the volume.
     * @param {BOOL} bEnableCompression Boolean that determines whether the file system volume will be created with compression enabled.
     * 
     * <div class="alert"><b>Note</b>  This parameter is ignored if the file system is not NTFS.</div>
     * <div> </div>
     * @returns {IVdsAsync} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface that upon successful completion receives the <b>IVdsAsync</b> interface to monitor and control this operation.  Callers must release the interface received when they are done with it.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvolumemf2-formatex
     */
    FormatEx(pwszFileSystemTypeName, usFileSystemRevision, ulDesiredUnitAllocationSize, pwszLabel, bForce, bQuickFormat, bEnableCompression) {
        pwszFileSystemTypeName := pwszFileSystemTypeName is String ? StrPtr(pwszFileSystemTypeName) : pwszFileSystemTypeName
        pwszLabel := pwszLabel is String ? StrPtr(pwszLabel) : pwszLabel

        result := ComCall(5, this, "ptr", pwszFileSystemTypeName, "ushort", usFileSystemRevision, "uint", ulDesiredUnitAllocationSize, "ptr", pwszLabel, "int", bForce, "int", bQuickFormat, "int", bEnableCompression, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }
}
