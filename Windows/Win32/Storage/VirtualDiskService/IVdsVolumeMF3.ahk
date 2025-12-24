#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IVdsAsync.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to perform additional file system management operations on the volume object.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsvolumemf3
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsVolumeMF3 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsVolumeMF3
     * @type {Guid}
     */
    static IID => Guid("{6788faf9-214e-4b85-ba59-266953616e09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryVolumeGuidPathnames", "FormatEx2", "OfflineVolume"]

    /**
     * Returns a list of volume GUID paths for the current volume.
     * @param {Pointer<Pointer<PWSTR>>} pwszPathArray <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>
     * @param {Pointer<Integer>} pulNumberOfPaths A pointer to a variable that receives the number of volume GUID paths returned in the buffer pointed to by the <i>pwszPathArray</i> parameter.
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
     * <dt><b>VDS_E_INTERNAL_ERROR</b></dt>
     * <dt>0x80042448L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error occurred. Check the event log for more details.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvolumemf3-queryvolumeguidpathnames
     */
    QueryVolumeGuidPathnames(pwszPathArray, pulNumberOfPaths) {
        pwszPathArrayMarshal := pwszPathArray is VarRef ? "ptr*" : "ptr"
        pulNumberOfPathsMarshal := pulNumberOfPaths is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pwszPathArrayMarshal, pwszPathArray, pulNumberOfPathsMarshal, pulNumberOfPaths, "HRESULT")
        return result
    }

    /**
     * Formats a file system volume on a partition. This method is identical to the IVdsVolumeMF2::FormatEx method, except that formatting options are specified by using the Options parameter.
     * @param {PWSTR} pwszFileSystemTypeName A <b>null</b>-terminated Unicode string containing the name of the file system with which to format the volume. This parameter can be <b>NULL</b> or the name of a Windows file system. The following file systems are supported: "NTFS", "FAT", "FAT32", "UDF", and "EXFAT". If this parameter is <b>NULL</b>, the default file system is used. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_file_system_format_support_flag">VDS_FILE_SYSTEM_FORMAT_SUPPORT_FLAG</a>.
     * @param {Integer} usFileSystemRevision The revision of the file system, if any.  This member is expressed as a 16-bit binary-coded decimal number, where a decimal point is implied between the second and third digits. For example, a value of 0x0250 indicates revision 2.50.
     * @param {Integer} ulDesiredUnitAllocationSize The size of the allocation unit for the file system, in bytes.  The value must be a power of 2.  If the value is 0, a default allocation unit determined by the file system type will be used.  The allocation unit range is file system dependent.
     * @param {PWSTR} pwszLabel A <b>null</b>-terminated Unicode string to assign to the new file system.  The maximum label size is file system dependent.
     * @param {Integer} Options A bitmask of <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_format_option_flags">VDS_FORMAT_OPTION_FLAGS</a> enumeration values that specify formatting options.
     * @returns {IVdsAsync} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface that upon successful completion receives the <b>IVdsAsync</b> interface to monitor and control this operation.  Callers must release the interface received when they are done with it.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvolumemf3-formatex2
     */
    FormatEx2(pwszFileSystemTypeName, usFileSystemRevision, ulDesiredUnitAllocationSize, pwszLabel, Options) {
        pwszFileSystemTypeName := pwszFileSystemTypeName is String ? StrPtr(pwszFileSystemTypeName) : pwszFileSystemTypeName
        pwszLabel := pwszLabel is String ? StrPtr(pwszLabel) : pwszLabel

        result := ComCall(4, this, "ptr", pwszFileSystemTypeName, "ushort", usFileSystemRevision, "uint", ulDesiredUnitAllocationSize, "ptr", pwszLabel, "uint", Options, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    /**
     * Takes the volume offline by using the IOCTL_VOLUME_OFFLINE control code.
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
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvolumemf3-offlinevolume
     */
    OfflineVolume() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
