#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D11DeviceContext3.ahk" { ID3D11DeviceContext3 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID3D11Fence.ahk" { ID3D11Fence }

/**
 * The device context interface represents a device context; it is used to render commands. ID3D11DeviceContext4 adds new methods to those in ID3D11DeviceContext3.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/nn-d3d11_3-id3d11devicecontext4
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11DeviceContext4 extends ID3D11DeviceContext3 {
    /**
     * The interface identifier for ID3D11DeviceContext4
     * @type {Guid}
     */
    static IID := Guid("{917600da-f58c-4c33-98d8-3e15b390fa24}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11DeviceContext4 interfaces
    */
    struct Vtbl extends ID3D11DeviceContext3.Vtbl {
        Signal : IntPtr
        Wait   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11DeviceContext4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Updates a fence to a specified value after all previous work has completed.
     * @param {ID3D11Fence} pFence Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d11_3/nn-d3d11_3-id3d11fence">ID3D11Fence</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/d3d11_3/nn-d3d11_3-id3d11fence">ID3D11Fence</a> object.
     * @param {Integer} Value Type: <b><a href="https://docs.microsoft.com/windows/win32/WinProg/windows-data-types">UINT64</a></b>
     * 
     * The value to set the fence to.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="https://docs.microsoft.com/windows/win32/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/nf-d3d11_3-id3d11devicecontext4-signal
     */
    Signal(pFence, Value) {
        result := ComCall(147, this, "ptr", pFence, "uint", Value, "HRESULT")
        return result
    }

    /**
     * Waits until the specified fence reaches or exceeds the specified value before future work can begin.
     * @param {ID3D11Fence} pFence Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d11_3/nn-d3d11_3-id3d11fence">ID3D11Fence</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/d3d11_3/nn-d3d11_3-id3d11fence">ID3D11Fence</a> object.
     * @param {Integer} Value Type: <b><a href="https://docs.microsoft.com/windows/win32/WinProg/windows-data-types">UINT64</a></b>
     * 
     * The value that the device context is waiting for the fence to reach or exceed.  So when  <a href="https://docs.microsoft.com/windows/win32/api/d3d11_3/nf-d3d11_3-id3d11fence-getcompletedvalue">ID3D11Fence::GetCompletedValue</a> is greater than or equal to <i>Value</i>, the wait is terminated.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="https://docs.microsoft.com/windows/win32/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/nf-d3d11_3-id3d11devicecontext4-wait
     */
    Wait(pFence, Value) {
        result := ComCall(148, this, "ptr", pFence, "uint", Value, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID3D11DeviceContext4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Signal := CallbackCreate(GetMethod(implObj, "Signal"), flags, 3)
        this.vtbl.Wait := CallbackCreate(GetMethod(implObj, "Wait"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Signal)
        CallbackFree(this.vtbl.Wait)
    }
}
