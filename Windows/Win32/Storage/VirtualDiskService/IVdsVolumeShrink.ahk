#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IVdsAsync.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to support volume shrinking.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsvolumeshrink
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsVolumeShrink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsVolumeShrink
     * @type {Guid}
     */
    static IID => Guid("{d68168c9-82a2-4f85-b6e9-74707c49a58f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryMaxReclaimableBytes", "Shrink"]

    /**
     * Retrieves the maximum number of bytes that can be reclaimed from the current volume.
     * @returns {Integer} Pointer to a variable that upon successful completion receives the maximum number of bytes which can be reclaimed from the current volume.  This number will always be a multiple of the file system cluster size, which is in turn a multiple of the disk sector size. This parameter is required and cannot be null.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvolumeshrink-querymaxreclaimablebytes
     */
    QueryMaxReclaimableBytes() {
        result := ComCall(3, this, "uint*", &pullMaxNumberOfReclaimableBytes := 0, "HRESULT")
        return pullMaxNumberOfReclaimableBytes
    }

    /**
     * Shrinks the volume and all plexes and returns the released extents.
     * @param {Integer} ullDesiredNumberOfReclaimableBytes Maximum number of bytes by which to shrink the size of the volume. The value of this parameter must be greater than or equal to the value of the <i>ullMinNumberOfReclaimableBytes</i> parameter.  If the number of bytes specified is not a multiple of the file system cluster size, the <b>Shrink</b> method will round this value up to the next multiple of the file system cluster size.
     * @param {Integer} ullMinNumberOfReclaimableBytes Minimum number of bytes by which to shrink the size of the volume.  If the volume size cannot be shrunk by at least this number of bytes, the <b>Shrink</b> method fails.  If the number of bytes specified is not a multiple of the file system cluster size, the <b>Shrink</b> method will round this value up to the next multiple of the file system cluster size.  Specify zero to indicate that no minimum number of reclaimable bytes is required for the <b>Shrink</b> method to succeed.
     * @returns {IVdsAsync} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface pointer. VDS 
     *       initializes the interface on return. Callers must release the interface. Use this interface to cancel, wait for, 
     *       or query the status of the operation. If 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsasync-wait">IVdsAsync::Wait</a> is called and a success HRESULT value is returned, the interfaces returned in 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_async_output">VDS_ASYNC_OUTPUT</a> structure must be released by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on each interface pointer. However, if <b>Wait</b> returns a failure HRESULT value, or if the <i>pHrResult</i> parameter of <b>Wait</b> receives a failure HRESULT value, the interface pointers in the <b>VDS_ASYNC_OUTPUT</b> structure are <b>NULL</b> and do not need to be released. You can test for success or failure HRESULT values by using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-succeeded">SUCCEEDED</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-failed">FAILED</a> macros defined in Winerror.h.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvolumeshrink-shrink
     */
    Shrink(ullDesiredNumberOfReclaimableBytes, ullMinNumberOfReclaimableBytes) {
        result := ComCall(4, this, "uint", ullDesiredNumberOfReclaimableBytes, "uint", ullMinNumberOfReclaimableBytes, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }
}
