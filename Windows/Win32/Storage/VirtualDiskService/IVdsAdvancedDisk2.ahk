#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\CHANGE_PARTITION_TYPE_PARAMETERS.ahk" { CHANGE_PARTITION_TYPE_PARAMETERS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a method to change partition types.
 * @see https://learn.microsoft.com/windows/win32/api/vds/nn-vds-ivdsadvanceddisk2
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsAdvancedDisk2 extends IUnknown {
    /**
     * The interface identifier for IVdsAdvancedDisk2
     * @type {Guid}
     */
    static IID := Guid("{9723f420-9355-42de-ab66-e31bb15beeac}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsAdvancedDisk2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ChangePartitionType : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsAdvancedDisk2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Changes the partition type on the disk at a specified byte offset.
     * @remarks
     * If an OEM partition is formatted as FAT or FAT32, the partition type does not change. If it is formatted with NTFS, the partition type changes to PARTITION_IFS (0x07). For information about partition types, see <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-create_partition_parameters">CREATE_PARTITION_PARAMETERS</a>.
     * @param {Integer} ullOffset Byte offset of the partition from the beginning of the disk.  This offset must be the offset of the start of a partition.
     * @param {BOOL} bForce Boolean value that indicates whether change will be forced.
     * @param {Pointer<CHANGE_PARTITION_TYPE_PARAMETERS>} para Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-change_partition_type_parameters">CHANGE_PARTITION_TYPE_PARAMETERS</a> structure that contains the partition type that the partition at the location specified by the <i>ullOffset</i> parameter will be changed to.
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
     * The partition type was changed successfully.
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
     * <dt><b>VDS_E_INTERNAL_ERROR</b></dt>
     * <dt>0x80042448L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error occurred. Check the event log for more details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_INVALID_PARTITION_TYPE</b></dt>
     * <dt>0x80042565L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified partition type is not valid for this operation.
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
     * The changing of the partition type on dynamic disks is not supported.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_PARTITION_LDM</b></dt>
     * <dt>0x8004258DL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This operation is not supported on LDM partitions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_PARTITION_MSR</b></dt>
     * <dt>0x8004258CL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This operation is not supported on MSR partitions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_PARTITION_STYLE_MISMATCH</b></dt>
     * <dt>0x80042571L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified partition style does not match that of the disk.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsadvanceddisk2-changepartitiontype
     */
    ChangePartitionType(ullOffset, bForce, para) {
        result := ComCall(3, this, "uint", ullOffset, BOOL, bForce, CHANGE_PARTITION_TYPE_PARAMETERS.Ptr, para, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVdsAdvancedDisk2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ChangePartitionType := CallbackCreate(GetMethod(implObj, "ChangePartitionType"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ChangePartitionType)
    }
}
