#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D12Pageable.ahk" { ID3D12Pageable }

/**
 * A command signature object enables apps to specify indirect drawing, including the buffer format, command type and resource bindings to be used.
 * @remarks
 * To create a command signature, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createcommandsignature">ID3D12Device::CreateCommandSignature</a>, as described in <a href="https://docs.microsoft.com/windows/desktop/direct3d12/indirect-drawing">Indirect Drawing</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12commandsignature
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12CommandSignature extends ID3D12Pageable {
    /**
     * The interface identifier for ID3D12CommandSignature
     * @type {Guid}
     */
    static IID := Guid("{c36a797c-ec80-4f0a-8985-a7b2475082d1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12CommandSignature interfaces
    */
    struct Vtbl extends ID3D12Pageable.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12CommandSignature.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (ID3D12CommandSignature.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
    }
}
