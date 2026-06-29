#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID3D10Device.ahk" { ID3D10Device }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * A state-block interface encapsulates render states.
 * @remarks
 * To create a state-block interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-d3d10createstateblock">D3D10CreateStateBlock</a>.
 * 
 * This interface can be used to save and restore pipeline state. It can also be used to capture the current state.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nn-d3d10effect-id3d10stateblock
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10StateBlock extends IUnknown {
    /**
     * The interface identifier for ID3D10StateBlock
     * @type {Guid}
     */
    static IID := Guid("{0803425a-57f5-4dd6-9465-a87570834a08}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10StateBlock interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Capture                 : IntPtr
        Apply                   : IntPtr
        ReleaseAllDeviceObjects : IntPtr
        GetDevice               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10StateBlock.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Capture the current value of states that are included in a stateblock. (ID3D10StateBlock.Capture)
     * @remarks
     * Capture captures current values for states within an existing state block. It does not capture the entire state of the device. Creating an empty stateblock and calling Capture does nothing if no states have been set.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10stateblock-capture
     */
    Capture() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Apply the state block to the current device state. (ID3D10StateBlock.Apply)
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10stateblock-apply
     */
    Apply() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Release all references to device objects.
     * @remarks
     * Each time you return a pointer to an interface (by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-id3d10stateblock-getdevice">ID3D10StateBlock::GetDevice</a>), the internal reference count is incremented; when you are finished using a stateblock, call this method to release all references and avoid a memory leak.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10stateblock-releasealldeviceobjects
     */
    ReleaseAllDeviceObjects() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Get the device.
     * @returns {ID3D10Device} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device</a>**</b>
     * 
     * Pointer to the ID3D10Device interface that is returned.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10stateblock-getdevice
     */
    GetDevice() {
        result := ComCall(6, this, "ptr*", &ppDevice := 0, "HRESULT")
        return ID3D10Device(ppDevice)
    }

    Query(iid) {
        if (ID3D10StateBlock.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Capture := CallbackCreate(GetMethod(implObj, "Capture"), flags, 1)
        this.vtbl.Apply := CallbackCreate(GetMethod(implObj, "Apply"), flags, 1)
        this.vtbl.ReleaseAllDeviceObjects := CallbackCreate(GetMethod(implObj, "ReleaseAllDeviceObjects"), flags, 1)
        this.vtbl.GetDevice := CallbackCreate(GetMethod(implObj, "GetDevice"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Capture)
        CallbackFree(this.vtbl.Apply)
        CallbackFree(this.vtbl.ReleaseAllDeviceObjects)
        CallbackFree(this.vtbl.GetDevice)
    }
}
