#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IVdsAsync.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates a partition on a basic disk.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdscreatepartitionex
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsCreatePartitionEx extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsCreatePartitionEx
     * @type {Guid}
     */
    static IID => Guid("{9882f547-cfc3-420b-9750-00dfbec50662}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreatePartitionEx"]

    /**
     * Creates a partition on a basic disk. This method supersedes the IVdsAdvancedDisk::CreatePartition method.
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
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdscreatepartitionex-createpartitionex
     */
    CreatePartitionEx(ullOffset, ullSize, ulAlign, para) {
        result := ComCall(3, this, "uint", ullOffset, "uint", ullSize, "uint", ulAlign, "ptr", para, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }
}
