#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Direct3D12\ID3D12Fence.ahk" { ID3D12Fence }
#Import "..\Direct3D12\ID3D12CommandQueue.ahk" { ID3D12CommandQueue }
#Import "..\Direct3D9\IDirect3DResource9.ahk" { IDirect3DResource9 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Direct3D9on12
 */
export default struct IDirect3DDevice9On12 extends IUnknown {
    /**
     * The interface identifier for IDirect3DDevice9On12
     * @type {Guid}
     */
    static IID := Guid("{e7fda234-b589-4049-940d-8878977531c8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirect3DDevice9On12 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetD3D12Device           : IntPtr
        UnwrapUnderlyingResource : IntPtr
        ReturnUnderlyingResource : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirect3DDevice9On12.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvDevice 
     * @returns {HRESULT} 
     */
    GetD3D12Device(riid, ppvDevice) {
        ppvDeviceMarshal := ppvDevice is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, Guid.Ptr, riid, ppvDeviceMarshal, ppvDevice, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirect3DResource9} pResource 
     * @param {ID3D12CommandQueue} pCommandQueue 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvResource12 
     * @returns {HRESULT} 
     */
    UnwrapUnderlyingResource(pResource, pCommandQueue, riid, ppvResource12) {
        ppvResource12Marshal := ppvResource12 is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", pResource, "ptr", pCommandQueue, Guid.Ptr, riid, ppvResource12Marshal, ppvResource12, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirect3DResource9} pResource 
     * @param {Integer} NumSync 
     * @param {Pointer<Integer>} pSignalValues 
     * @returns {ID3D12Fence} 
     */
    ReturnUnderlyingResource(pResource, NumSync, pSignalValues) {
        pSignalValuesMarshal := pSignalValues is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pResource, "uint", NumSync, pSignalValuesMarshal, pSignalValues, "ptr*", &ppFences := 0, "HRESULT")
        return ID3D12Fence(ppFences)
    }

    Query(iid) {
        if (IDirect3DDevice9On12.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetD3D12Device := CallbackCreate(GetMethod(implObj, "GetD3D12Device"), flags, 3)
        this.vtbl.UnwrapUnderlyingResource := CallbackCreate(GetMethod(implObj, "UnwrapUnderlyingResource"), flags, 5)
        this.vtbl.ReturnUnderlyingResource := CallbackCreate(GetMethod(implObj, "ReturnUnderlyingResource"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetD3D12Device)
        CallbackFree(this.vtbl.UnwrapUnderlyingResource)
        CallbackFree(this.vtbl.ReturnUnderlyingResource)
    }
}
