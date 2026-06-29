#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IVdsAsync.ahk" { IVdsAsync }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a method to format a partition with additional formatting options.
 * @see https://learn.microsoft.com/windows/win32/api/vds/nn-vds-ivdsdiskpartitionmf2
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsDiskPartitionMF2 extends IUnknown {
    /**
     * The interface identifier for IVdsDiskPartitionMF2
     * @type {Guid}
     */
    static IID := Guid("{9cbe50ca-f2d2-4bf4-ace1-96896b729625}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsDiskPartitionMF2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        FormatPartitionEx2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsDiskPartitionMF2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Formats an existing OEM, ESP, or unknown partition. This method is identical to the IVdsDiskPartitionMF::FormatPartition method, except that formatting options are specified by using the Options parameter.
     * @param {Integer} ullOffset The byte offset of the partition from the beginning of the disk.  This offset must be the offset of the start of a partition.
     * @param {PWSTR} pwszFileSystemTypeName A <b>NULL</b>-terminated Unicode string containing the name of the file system with which to format the partition. Must be <b>NULL</b> or one of the following: "NTFS", "FAT","FAT32", "UDF", or "EXFAT". If this parameter is <b>NULL</b>, a default value is used. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_file_system_format_support_flag">VDS_FILE_SYSTEM_FORMAT_SUPPORT_FLAG</a>.
     * @param {Integer} usFileSystemRevision The revision of the file system, if any.  This member is expressed as a 16-bit binary-coded decimal number, where a decimal point is implied between the second and third digits. For example, a value of 0x0250 indicates revision 2.50.
     * @param {Integer} ulDesiredUnitAllocationSize The size of the allocation unit for the file system, in bytes.  The value must be a power of 2.  If the value is 0, a default allocation unit determined by the file system type will be used.  The allocation unit range is file system dependent.
     * @param {PWSTR} pwszLabel A <b>NULL</b>-terminated Unicode string containing the label to assign to the new file system for the partition.  The maximum label size is file system dependent.
     * @param {Integer} Options A bitmask of <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_format_option_flags">VDS_FORMAT_OPTION_FLAGS</a> enumeration values that specify formatting options.
     * @returns {IVdsAsync} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface that upon successful completion receives the <b>IVdsAsync</b> interface to monitor and control this operation.  Callers must release the interface received when they are done with it.
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsdiskpartitionmf2-formatpartitionex2
     */
    FormatPartitionEx2(ullOffset, pwszFileSystemTypeName, usFileSystemRevision, ulDesiredUnitAllocationSize, pwszLabel, Options) {
        pwszFileSystemTypeName := pwszFileSystemTypeName is String ? StrPtr(pwszFileSystemTypeName) : pwszFileSystemTypeName
        pwszLabel := pwszLabel is String ? StrPtr(pwszLabel) : pwszLabel

        result := ComCall(3, this, "uint", ullOffset, "ptr", pwszFileSystemTypeName, "ushort", usFileSystemRevision, "uint", ulDesiredUnitAllocationSize, "ptr", pwszLabel, "uint", Options, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    Query(iid) {
        if (IVdsDiskPartitionMF2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FormatPartitionEx2 := CallbackCreate(GetMethod(implObj, "FormatPartitionEx2"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FormatPartitionEx2)
    }
}
