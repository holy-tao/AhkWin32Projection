#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * An interface used to turn on the debug layer.
 * @remarks
 * This interface is obtained by querying it from <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-d3d12getdebuginterface">D3D12GetDebugInterface</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12debug
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12Debug extends IUnknown {
    /**
     * The interface identifier for ID3D12Debug
     * @type {Guid}
     */
    static IID := Guid("{344488b7-6846-474b-b989-f027448245e0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12Debug interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EnableDebugLayer : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12Debug.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Enables the debug layer. (ID3D12Debug.EnableDebugLayer)
     * @remarks
     * To enable the debug layers using this API, it must be called before the D3D12 device is created. Calling this API after creating the D3D12 device will cause the D3D12 runtime to remove the device.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debug-enabledebuglayer
     */
    EnableDebugLayer() {
        ComCall(3, this)
    }

    Query(iid) {
        if (ID3D12Debug.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnableDebugLayer := CallbackCreate(GetMethod(implObj, "EnableDebugLayer"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnableDebugLayer)
    }
}
