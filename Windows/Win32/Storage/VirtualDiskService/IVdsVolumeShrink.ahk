#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IVdsAsync.ahk" { IVdsAsync }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides methods to support volume shrinking.
 * @see https://learn.microsoft.com/windows/win32/api/vds/nn-vds-ivdsvolumeshrink
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsVolumeShrink extends IUnknown {
    /**
     * The interface identifier for IVdsVolumeShrink
     * @type {Guid}
     */
    static IID := Guid("{d68168c9-82a2-4f85-b6e9-74707c49a58f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsVolumeShrink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        QueryMaxReclaimableBytes : IntPtr
        Shrink                   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsVolumeShrink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the maximum number of bytes that can be reclaimed from the current volume.
     * @remarks
     * This method can return more reclaimable bytes than are actually available.
     * @returns {Integer} Pointer to a variable that upon successful completion receives the maximum number of bytes which can be reclaimed from the current volume.  This number will always be a multiple of the file system cluster size, which is in turn a multiple of the disk sector size. This parameter is required and cannot be null.
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvolumeshrink-querymaxreclaimablebytes
     */
    QueryMaxReclaimableBytes() {
        result := ComCall(3, this, "uint*", &pullMaxNumberOfReclaimableBytes := 0, "HRESULT")
        return pullMaxNumberOfReclaimableBytes
    }

    /**
     * Shrinks the volume and all plexes and returns the released extents.
     * @remarks
     * The <b>Shrink</b> method moves the files so that they are as close as possible to the beginning of the volume, in order to consolidate free space at the end of the volume.  (The amount of free space that can be consolidated at the end of the volume determines how much the volume can be shrunk.) It then truncates the file system volume, reducing its size, and then truncates the partition or dynamic volume.
     * 
     * In almost all cases, there will be some files that are immovable (that is, files that cannot be moved). For example, file system and storage driver metadata files are likely to be immovable. For this reason, the amount by which a volume can be shrunk is usually less than the total amount of free space on the volume.
     * 
     * The number and placement of immovable files can vary from one computer to the next, even if both computers are configured identically.
     * 
     * It is possible for a file to be temporarily immovable. For this reason, an application may be able to recover additional space if it calls this method a second time with the same parameters.
     * 
     * If the <i>ullDesiredNumberOfReclaimableBytes</i> and <i>ullMinNumberOfReclaimableBytes</i> parameters are both zero, the <b>Shrink</b> method will shrink the volume by as much as possible.
     * 
     * Shrink and <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolume-extend">extend</a> operations are supported only on NTFS and RAW volumes.
     * 
     * Use this method to shrink the file system and volume. If VDS fails to shrink the volume, it stops the operation without shrinking the file system.
     * 
     * Only one shrink or defragmentation operation can be performed at a time on each volume.<b>Windows Server 2008 and Windows Vista:  </b>Only one shrink or defragmentation operation can be performed at a time on a computer.
     * 
     * 
     * 
     * Implementers must return a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface for this method, even if the call does not initiate an asynchronous operation.
     * 
     * This method is identical to the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolume-shrink">IVdsVolume::Shrink</a> method.
     * 
     * You can use the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolumeshrink-querymaxreclaimablebytes">IVdsVolumeShrink::QueryMaxReclaimableBytes</a> method to estimate the number of bytes to be reclaimed by the shrink operation. However, <b>QueryMaxReclaimableBytes</b> can return more bytes than are actually available.
     * @param {Integer} ullDesiredNumberOfReclaimableBytes Maximum number of bytes by which to shrink the size of the volume. The value of this parameter must be greater than or equal to the value of the <i>ullMinNumberOfReclaimableBytes</i> parameter.  If the number of bytes specified is not a multiple of the file system cluster size, the <b>Shrink</b> method will round this value up to the next multiple of the file system cluster size.
     * @param {Integer} ullMinNumberOfReclaimableBytes Minimum number of bytes by which to shrink the size of the volume.  If the volume size cannot be shrunk by at least this number of bytes, the <b>Shrink</b> method fails.  If the number of bytes specified is not a multiple of the file system cluster size, the <b>Shrink</b> method will round this value up to the next multiple of the file system cluster size.  Specify zero to indicate that no minimum number of reclaimable bytes is required for the <b>Shrink</b> method to succeed.
     * @returns {IVdsAsync} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface pointer. VDS 
     *       initializes the interface on return. Callers must release the interface. Use this interface to cancel, wait for, 
     *       or query the status of the operation. If 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsasync-wait">IVdsAsync::Wait</a> is called and a success HRESULT value is returned, the interfaces returned in 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_async_output">VDS_ASYNC_OUTPUT</a> structure must be released by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on each interface pointer. However, if <b>Wait</b> returns a failure HRESULT value, or if the <i>pHrResult</i> parameter of <b>Wait</b> receives a failure HRESULT value, the interface pointers in the <b>VDS_ASYNC_OUTPUT</b> structure are <b>NULL</b> and do not need to be released. You can test for success or failure HRESULT values by using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-succeeded">SUCCEEDED</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-failed">FAILED</a> macros defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvolumeshrink-shrink
     */
    Shrink(ullDesiredNumberOfReclaimableBytes, ullMinNumberOfReclaimableBytes) {
        result := ComCall(4, this, "uint", ullDesiredNumberOfReclaimableBytes, "uint", ullMinNumberOfReclaimableBytes, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    Query(iid) {
        if (IVdsVolumeShrink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.QueryMaxReclaimableBytes := CallbackCreate(GetMethod(implObj, "QueryMaxReclaimableBytes"), flags, 2)
        this.vtbl.Shrink := CallbackCreate(GetMethod(implObj, "Shrink"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.QueryMaxReclaimableBytes)
        CallbackFree(this.vtbl.Shrink)
    }
}
