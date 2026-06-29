#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID3D12Pageable.ahk" { ID3D12Pageable }

/**
 * Represents a fence, an object used for synchronization of the CPU and one or more GPUs. (ID3D12Fence)
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12fence
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12Fence extends ID3D12Pageable {
    /**
     * The interface identifier for ID3D12Fence
     * @type {Guid}
     */
    static IID := Guid("{0a753dcf-c4d8-4b91-adf6-be5a60d95a76}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12Fence interfaces
    */
    struct Vtbl extends ID3D12Pageable.Vtbl {
        GetCompletedValue    : IntPtr
        SetEventOnCompletion : IntPtr
        Signal               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12Fence.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the current value of the fence. (ID3D12Fence.GetCompletedValue)
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/win32/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Returns the current value of the fence. If the device has been removed, the return value will be <b>UINT64_MAX</b>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12fence-getcompletedvalue
     */
    GetCompletedValue() {
        result := ComCall(8, this, Int64)
        return result
    }

    /**
     * Specifies an event that should be fired when the fence reaches a certain value. (ID3D12Fence.SetEventOnCompletion)
     * @remarks
     * To specify multiple fences before an event is triggered, refer to <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device1-seteventonmultiplefencecompletion">SetEventOnMultipleFenceCompletion</a>.
     * 
     * If *hEvent* is a null handle, then this API will not return until the specified fence value(s) have been reached.
     * 
     * This method can be safely called from multiple threads at one time.
     * @param {Integer} Value Type: <b><a href="https://docs.microsoft.com/windows/win32/WinProg/windows-data-types">UINT64</a></b>
     * 
     * The fence value when the event is to be signaled.
     * @param {HANDLE} hEvent Type: <b><a href="https://docs.microsoft.com/windows/win32/WinProg/windows-data-types">HANDLE</a></b>
     * 
     * A handle to the event object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method returns <b>E_OUTOFMEMORY</b> if the kernel components don’t have sufficient memory to store the event in a list. See <a href="https://docs.microsoft.com/windows/win32/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 return codes</a> for other possible return values.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12fence-seteventoncompletion
     */
    SetEventOnCompletion(Value, hEvent) {
        result := ComCall(9, this, "uint", Value, HANDLE, hEvent, "HRESULT")
        return result
    }

    /**
     * Sets the fence to the specified value.
     * @remarks
     * Use this method to set a fence value from the CPU side. Use <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12commandqueue-signal">ID3D12CommandQueue::Signal</a> to set a fence from the GPU side.
     * @param {Integer} Value Type: <b><a href="https://docs.microsoft.com/windows/win32/WinProg/windows-data-types">UINT64</a></b>
     * 
     * The value to set the fence to.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="https://docs.microsoft.com/windows/win32/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12fence-signal
     */
    Signal(Value) {
        result := ComCall(10, this, "uint", Value, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID3D12Fence.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCompletedValue := CallbackCreate(GetMethod(implObj, "GetCompletedValue"), flags, 1)
        this.vtbl.SetEventOnCompletion := CallbackCreate(GetMethod(implObj, "SetEventOnCompletion"), flags, 3)
        this.vtbl.Signal := CallbackCreate(GetMethod(implObj, "Signal"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCompletedValue)
        CallbackFree(this.vtbl.SetEventOnCompletion)
        CallbackFree(this.vtbl.Signal)
    }
}
