#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D12DebugCommandQueue.ahk" { ID3D12DebugCommandQueue }
#Import ".\D3D12_BARRIER_LAYOUT.ahk" { D3D12_BARRIER_LAYOUT }
#Import ".\D3D12_BARRIER_ACCESS.ahk" { D3D12_BARRIER_ACCESS }
#Import ".\ID3D12Resource.ahk" { ID3D12Resource }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12DebugCommandQueue1 extends ID3D12DebugCommandQueue {
    /**
     * The interface identifier for ID3D12DebugCommandQueue1
     * @type {Guid}
     */
    static IID := Guid("{16be35a2-bfd6-49f2-bcae-eaae4aff862d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12DebugCommandQueue1 interfaces
    */
    struct Vtbl extends ID3D12DebugCommandQueue.Vtbl {
        AssertResourceAccess : IntPtr
        AssertTextureLayout  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12DebugCommandQueue1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {ID3D12Resource} pResource 
     * @param {Integer} Subresource 
     * @param {D3D12_BARRIER_ACCESS} Access 
     * @returns {String} Nothing - always returns an empty string
     */
    AssertResourceAccess(pResource, Subresource, Access) {
        ComCall(4, this, "ptr", pResource, "uint", Subresource, D3D12_BARRIER_ACCESS, Access)
    }

    /**
     * 
     * @param {ID3D12Resource} pResource 
     * @param {Integer} Subresource 
     * @param {D3D12_BARRIER_LAYOUT} Layout 
     * @returns {String} Nothing - always returns an empty string
     */
    AssertTextureLayout(pResource, Subresource, Layout) {
        ComCall(5, this, "ptr", pResource, "uint", Subresource, D3D12_BARRIER_LAYOUT, Layout)
    }

    Query(iid) {
        if (ID3D12DebugCommandQueue1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AssertResourceAccess := CallbackCreate(GetMethod(implObj, "AssertResourceAccess"), flags, 4)
        this.vtbl.AssertTextureLayout := CallbackCreate(GetMethod(implObj, "AssertTextureLayout"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AssertResourceAccess)
        CallbackFree(this.vtbl.AssertTextureLayout)
    }
}
