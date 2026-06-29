#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_SET_PROGRAM_DESC.ahk" { D3D12_SET_PROGRAM_DESC }
#Import ".\ID3D12GraphicsCommandList9.ahk" { ID3D12GraphicsCommandList9 }
#Import ".\D3D12_DISPATCH_GRAPH_DESC.ahk" { D3D12_DISPATCH_GRAPH_DESC }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12GraphicsCommandList10 extends ID3D12GraphicsCommandList9 {
    /**
     * The interface identifier for ID3D12GraphicsCommandList10
     * @type {Guid}
     */
    static IID := Guid("{7013c015-d161-4b63-a08c-238552dd8acc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12GraphicsCommandList10 interfaces
    */
    struct Vtbl extends ID3D12GraphicsCommandList9.Vtbl {
        SetProgram    : IntPtr
        DispatchGraph : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12GraphicsCommandList10.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<D3D12_SET_PROGRAM_DESC>} pDesc 
     * @returns {String} Nothing - always returns an empty string
     */
    SetProgram(pDesc) {
        ComCall(84, this, D3D12_SET_PROGRAM_DESC.Ptr, pDesc)
    }

    /**
     * 
     * @param {Pointer<D3D12_DISPATCH_GRAPH_DESC>} pDesc 
     * @returns {String} Nothing - always returns an empty string
     */
    DispatchGraph(pDesc) {
        ComCall(85, this, D3D12_DISPATCH_GRAPH_DESC.Ptr, pDesc)
    }

    Query(iid) {
        if (ID3D12GraphicsCommandList10.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetProgram := CallbackCreate(GetMethod(implObj, "SetProgram"), flags, 2)
        this.vtbl.DispatchGraph := CallbackCreate(GetMethod(implObj, "DispatchGraph"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetProgram)
        CallbackFree(this.vtbl.DispatchGraph)
    }
}
