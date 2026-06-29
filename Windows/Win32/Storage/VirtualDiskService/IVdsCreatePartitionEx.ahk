#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IVdsAsync.ahk" { IVdsAsync }
#Import ".\CREATE_PARTITION_PARAMETERS.ahk" { CREATE_PARTITION_PARAMETERS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Creates a partition on a basic disk.
 * @see https://learn.microsoft.com/windows/win32/api/vds/nn-vds-ivdscreatepartitionex
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsCreatePartitionEx extends IUnknown {
    /**
     * The interface identifier for IVdsCreatePartitionEx
     * @type {Guid}
     */
    static IID := Guid("{9882f547-cfc3-420b-9750-00dfbec50662}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsCreatePartitionEx interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreatePartitionEx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsCreatePartitionEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a partition on a basic disk. This method supersedes the IVdsAdvancedDisk::CreatePartition method.
     * @remarks
     * This method operates on basic disks having either a GPT or MBR 
     *     partition scheme.
     * 
     * <b>Windows Server 2003:  </b>Callers can align only the first partition of a MBR disk and must place the starting offset in 
     *     the first cylinder or the beginning of the second cylinder, at the cylinder boundary.
     * 
     * If the <i>ullOffset</i> parameter is specified and its value is not already aligned using the values under the <b>HKEY_LOCAL_MACHINE</b>&#92;<b>System</b>&#92;<b>CurrentControlSet</b>&#92;<b>Services</b>&#92;<b>Vds</b>&#92;<b>Alignment</b> registry subkey, its value will be aligned automatically using the following values: The default alignment is 1 MB if the disk is 4 GB or larger, or 64 KB if the disk is smaller than 4 GB.
     * 
     * <b>Windows Server 2003:  </b>Unaligned partition offsets are rounded to the nearest cylinder boundary for MBR disks, or to the nearest sector boundary for GPT disks.
     * 
     * If a dynamic disk is read-only and offline, it must be made read/write and brought online as follows before calling <b>CreatePartitionEx</b>:
     * 
     * <ol>
     * <li>Clear the read-only bit. (This is the <b>VDS_DF_READ_ONLY</b> flag in the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_disk_prop">VDS_DISK_PROP</a> structure.)</li>
     * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsdiskonline-online">IVdsDiskOnline::Online</a> method.</li>
     * </ol>
     * @param {Integer} ullOffset The partition offset, in bytes. If the offset is not aligned and the <i>ulAlign</i> parameter is not specified, the offset is rounded up or down to the closest alignment boundary depending on the size of the disk on which the partition is created. For more information, see the following Remarks section. 
     * 
     * <b>Windows Server 2003:  </b>Only the first partition on a basic disk can be aligned; dynamic disks cannot be aligned. For other partitions on a basic disk, you cannot specify alignment using the <i>ulAlign</i> parameter; the offset is rounded to the nearest cylinder boundary for Master Boot Record (MBR) disks, or the nearest sector boundary for GUID Partition Table (GPT) disks.
     * 
     * When the caller specifies both the <i>ullOffset</i> and 
     *       <i>ulAlign</i> parameters, the offset must be within the first cylinder.
     * @param {Integer} ullSize The size, in bytes, of the new partition.
     * @param {Integer} ulAlign The alignment size, in bytes. 
     * 
     * <b>Windows Server 2003:  </b>If this parameter is specified, the provider rounds up the partition offset to the closest alignment boundary; otherwise, to 
     *       the closest cylinder boundary.
     * 
     * If the beginning of a disk has sufficient space to accommodate the partition 
     *       size, and the <i>ulAlign</i> parameter is specified but the 
     *       <i>ullOffset</i> parameter is not, the call to <b>CreatePartitionEx</b> fails.
     * @param {Pointer<CREATE_PARTITION_PARAMETERS>} para The pointer to parameters defined by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-create_partition_parameters">CREATE_PARTITION_PARAMETERS</a> 
     *       structure.
     * @returns {IVdsAsync} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface pointer, which 
     *       VDS initializes on return. Callers must release the interface. Use this pointer to cancel, wait for, or query 
     *       the status of the operation.
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdscreatepartitionex-createpartitionex
     */
    CreatePartitionEx(ullOffset, ullSize, ulAlign, para) {
        result := ComCall(3, this, "uint", ullOffset, "uint", ullSize, "uint", ulAlign, CREATE_PARTITION_PARAMETERS.Ptr, para, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    Query(iid) {
        if (IVdsCreatePartitionEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreatePartitionEx := CallbackCreate(GetMethod(implObj, "CreatePartitionEx"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreatePartitionEx)
    }
}
