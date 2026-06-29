#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Note  This interface is no longer supported by the AVI Splitter. Note  It was defined to support certain older hardware decoders that required AVI files to be read directly into hardware memory.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iamdevmemorycontrol
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMDevMemoryControl extends IUnknown {
    /**
     * The interface identifier for IAMDevMemoryControl
     * @type {Guid}
     */
    static IID := Guid("{c6545bf1-e76b-11d0-bd52-00a0c911ce86}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMDevMemoryControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        QueryWriteSync : IntPtr
        WriteSync      : IntPtr
        GetDevId       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMDevMemoryControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Note  The IAMDevMemoryControl interface is deprecated. Checks if the memory supported by the allocator requires the use of the IAMDevMemoryControl::WriteSync method.
     * @remarks
     * Not all on-board memory needs to have <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamdevmemorycontrol-writesync">WriteSync</a> called to synchronize with the completed write. This method is used to check if the call is necessary.
     * @returns {HRESULT} Returns S_OK if the method is required, or S_FALSE otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamdevmemorycontrol-querywritesync
     */
    QueryWriteSync() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Note  The IAMDevMemoryControl interface is deprecated. Used to synchronize with the completed write. This method returns when any data being written to the particular allocator region is fully written into the memory.
     * @remarks
     * This method guarantees that all prior write operations to allocated memory have succeeded. Subsequent memory write operations require another call to <c>WriteSync</c>.
     * 
     * This method is implementation dependent, and is used (when necessary) to synchronize memory write operations to the memory. The driver of the on-board memory provides the implementation.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iamdevmemorycontrol">IAMDevMemoryControl</a> interface is typically found on memory that is accessed through a Peripheral Component Interconnect (PCI) bridge. (A PCI is a local bus for personal computers that provides a high-speed data path between the processor and peripheral devices.) Memory behind a PCI bridge must be synchronized after a memory write operation completes, if another device will access that memory from behind the PCI bridge. This is because the host access to the memory is buffered through the PCI bridge FIFO (first in first out), and the host will assume the write is completed before the bridge actually writes the data. A subsequent action by a device behind the bridge, such as a SCSI controller, might read the memory before the write is completed, if the <b>IAMDevMemoryControl::WriteSync</b> method is not called.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A time-out has occurred without this method confirming that data was written.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data was successfully written into memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_COMMITTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The allocator hasn't called the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imemallocator-commit">IMemAllocator::Commit</a> method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamdevmemorycontrol-writesync
     */
    WriteSync() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Note  The IAMDevMemoryControl interface is deprecated. Retrieves the device ID of the on-board memory allocator.
     * @remarks
     * This method retrieves a unique ID that the hardware filter can use to verify that the specified allocator passed uses its on-board memory (because there can be more than one). The ID will be the same one as used to create the allocator object (using <b>CoCreateInstance</b>). For another filter to be able to use the on-board memory, it must have the same device ID as the on-board memory allocator.
     * @returns {Integer} Pointer to the device ID.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamdevmemorycontrol-getdevid
     */
    GetDevId() {
        result := ComCall(5, this, "uint*", &pdwDevId := 0, "HRESULT")
        return pdwDevId
    }

    Query(iid) {
        if (IAMDevMemoryControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.QueryWriteSync := CallbackCreate(GetMethod(implObj, "QueryWriteSync"), flags, 1)
        this.vtbl.WriteSync := CallbackCreate(GetMethod(implObj, "WriteSync"), flags, 1)
        this.vtbl.GetDevId := CallbackCreate(GetMethod(implObj, "GetDevId"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.QueryWriteSync)
        CallbackFree(this.vtbl.WriteSync)
        CallbackFree(this.vtbl.GetDevId)
    }
}
