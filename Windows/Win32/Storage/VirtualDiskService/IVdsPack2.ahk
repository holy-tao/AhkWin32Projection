#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IVdsAsync.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a method to create aligned volumes on a pack.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdspack2
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsPack2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsPack2
     * @type {Guid}
     */
    static IID => Guid("{13b50bff-290a-47dd-8558-b7c58db1a71a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateVolume2"]

    /**
     * Creates a volume in a disk pack with an optional alignment parameter.
     * @param {Integer} type Value from the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_volume_type">VDS_VOLUME_TYPE</a> enumeration that indicates the type of volume to create.
     * @param {Pointer<VDS_INPUT_DISK>} pInputDiskArray Array of <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_input_disk">VDS_INPUT_DISK</a> structures that indicate the disks on which to create the volume.
     * 
     * <div class="alert"><b>Note</b>  This array's size must be 32 objects or less, because Windows imposes a limit where no more than 32 disks may be used with a single volume.</div>
     * <div> </div>
     * @param {Integer} lNumberOfDisks Number of elements in the array pointed to by the <i>pInputDiskArray</i> parameter.
     * @param {Integer} ulStripeSize Stripe size, in bytes, of the new volume.
     * 
     * <div class="alert"><b>Note</b>  The stripe size must be 65536 if the type is VDS_VT_STRIPE or VDS_VT_PARITY; otherwise, the stripe size MUST be 0.</div>
     * <div> </div>
     * @param {Integer} ulAlign Number of bytes for volume alignment.  This parameter is optional and can be zero. If zero is specified, the server will determine the alignment value depending on the size of the disk on which the volume is created.
     * 
     * <b>Windows 7, Windows Server 2008 R2, Windows Vista and Windows Server 2008:  </b>On a basic disk, the <b>CreateVolume2</b> method ignores  this parameter and the <b>HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vds\Alignment</b> registry key. This is a known issue and is being addressed. As a workaround, use the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsadvanceddisk-createpartition">IVdsAdvancedDisk::CreatePartition</a>  or <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdscreatepartitionex-createpartitionex">IVdsCreatePartitionEx::CreatePartitionEx</a> method to create partitions on the basic disk so that they are aligned correctly.Dynamic partitions and volumes are aligned using the values under the following registry key:
     * 
     * <b>HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vds\Alignment</b>
     * 
     * The default alignment is 1 MB if the disk is 4 GB or larger, or 64 KB if the disk is smaller than 4 GB.
     * @returns {IVdsAsync} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface that upon successful completion receives the <b>IVdsAsync</b> interface to monitor and control this operation.  Callers must release the interface received when they are done with it.  If the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsasync-wait">IVdsAsync::Wait</a> method is called on the interface and a success HRESULT value is returned, the interfaces returned in the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_async_output">VDS_ASYNC_OUTPUT</a> structure must be released by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on each interface pointer. However, if <b>Wait</b> returns a failure HRESULT value, or if the <i>pHrResult</i> parameter of <b>Wait</b> receives a failure HRESULT value, the interface pointers in the <b>VDS_ASYNC_OUTPUT</b> structure are <b>NULL</b> and do not need to be released. You can test for success or failure HRESULT values by using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-succeeded">SUCCEEDED</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-failed">FAILED</a> macros defined in Winerror.h.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdspack2-createvolume2
     */
    CreateVolume2(type, pInputDiskArray, lNumberOfDisks, ulStripeSize, ulAlign) {
        result := ComCall(3, this, "int", type, "ptr", pInputDiskArray, "int", lNumberOfDisks, "uint", ulStripeSize, "uint", ulAlign, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }
}
