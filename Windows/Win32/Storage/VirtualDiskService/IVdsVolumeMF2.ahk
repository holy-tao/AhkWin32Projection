#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IVdsAsync.ahk" { IVdsAsync }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\VDS_FILE_SYSTEM_FORMAT_SUPPORT_PROP.ahk" { VDS_FILE_SYSTEM_FORMAT_SUPPORT_PROP }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides methods to perform additional file system management operations on the volume object. (IVdsVolumeMF2)
 * @see https://learn.microsoft.com/windows/win32/api/vds/nn-vds-ivdsvolumemf2
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsVolumeMF2 extends IUnknown {
    /**
     * The interface identifier for IVdsVolumeMF2
     * @type {Guid}
     */
    static IID := Guid("{4dbcee9a-6343-4651-b85f-5e75d74d983c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsVolumeMF2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetFileSystemTypeName        : IntPtr
        QueryFileSystemFormatSupport : IntPtr
        FormatEx                     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsVolumeMF2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the name of the file system on a volume.
     * @returns {PWSTR} Pointer that upon successful completion receives a null-terminated Unicode string with the file system name.
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvolumemf2-getfilesystemtypename
     */
    GetFileSystemTypeName() {
        result := ComCall(3, this, PWSTR.Ptr, &ppwszFileSystemTypeName := 0, "HRESULT")
        return ppwszFileSystemTypeName
    }

    /**
     * Retrieves the properties of the file systems that are supported for formatting a volume.
     * @param {Pointer<Pointer<VDS_FILE_SYSTEM_FORMAT_SUPPORT_PROP>>} ppFileSystemSupportProps A pointer to the array of <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_file_system_format_support_prop">VDS_FILE_SYSTEM_FORMAT_SUPPORT_PROP</a> structures passed in by the caller. Upon successful completion, these structures contain information about the properties of the supported file systems. Callers must free this array by using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @param {Pointer<Integer>} plNumberOfFileSystems A pointer to a variable that upon successful completion receives the total number of elements in array pointed to by the <i>ppFileSystemSupportProps</i> parameter.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
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
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvolumemf2-queryfilesystemformatsupport
     */
    QueryFileSystemFormatSupport(ppFileSystemSupportProps, plNumberOfFileSystems) {
        ppFileSystemSupportPropsMarshal := ppFileSystemSupportProps is VarRef ? "ptr*" : "ptr"
        plNumberOfFileSystemsMarshal := plNumberOfFileSystems is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, ppFileSystemSupportPropsMarshal, ppFileSystemSupportProps, plNumberOfFileSystemsMarshal, plNumberOfFileSystems, "HRESULT")
        return result
    }

    /**
     * Formats a file system volume on a partition.
     * @remarks
     * If an OEM partition is formatted as FAT or FAT32, the partition type does not change. If it is formatted with NTFS, the partition type changes to PARTITION_IFS (0x07). For information about partition types, see <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-create_partition_parameters">CREATE_PARTITION_PARAMETERS</a>.
     * 
     * If this method is called for a volume that is protected by BitLocker full-volume encryption, BitLocker encryption is disabled for the volume until the user re-enables it.
     * 
     * For more information about file system limits such as minimum and maximum allocation unit size (also called cluster size), see <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2003/cc758691(v=ws.10)">NTFS Technical Reference</a> and <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2003/cc758586(v=ws.10)">FAT Technical Reference</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvolumemf2-formatex
     */
    FormatEx(pwszFileSystemTypeName, usFileSystemRevision, ulDesiredUnitAllocationSize, pwszLabel, bForce, bQuickFormat, bEnableCompression) {
        pwszFileSystemTypeName := pwszFileSystemTypeName is String ? StrPtr(pwszFileSystemTypeName) : pwszFileSystemTypeName
        pwszLabel := pwszLabel is String ? StrPtr(pwszLabel) : pwszLabel

        result := ComCall(5, this, "ptr", pwszFileSystemTypeName, "ushort", usFileSystemRevision, "uint", ulDesiredUnitAllocationSize, "ptr", pwszLabel, BOOL, bForce, BOOL, bQuickFormat, BOOL, bEnableCompression, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    Query(iid) {
        if (IVdsVolumeMF2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFileSystemTypeName := CallbackCreate(GetMethod(implObj, "GetFileSystemTypeName"), flags, 2)
        this.vtbl.QueryFileSystemFormatSupport := CallbackCreate(GetMethod(implObj, "QueryFileSystemFormatSupport"), flags, 3)
        this.vtbl.FormatEx := CallbackCreate(GetMethod(implObj, "FormatEx"), flags, 9)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFileSystemTypeName)
        CallbackFree(this.vtbl.QueryFileSystemFormatSupport)
        CallbackFree(this.vtbl.FormatEx)
    }
}
