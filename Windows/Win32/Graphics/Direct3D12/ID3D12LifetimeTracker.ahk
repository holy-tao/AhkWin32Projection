#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID3D12DeviceChild.ahk" { ID3D12DeviceChild }

/**
 * Represents facilities for controlling the lifetime a lifetime-tracked object.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12lifetimetracker
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12LifetimeTracker extends ID3D12DeviceChild {
    /**
     * The interface identifier for ID3D12LifetimeTracker
     * @type {Guid}
     */
    static IID := Guid("{3fd03d36-4eb1-424a-a582-494ecb8ba813}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12LifetimeTracker interfaces
    */
    struct Vtbl extends ID3D12DeviceChild.Vtbl {
        DestroyOwnedObject : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12LifetimeTracker.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Destroys a lifetime-tracked object.
     * @param {ID3D12DeviceChild} pObject Type: **[ID3D12DeviceChild](./nn-d3d12-id3d12devicechild.md)\***
     * 
     * A pointer to an **ID3D12DeviceChild** interface representing the lifetime-tracked object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12lifetimetracker-destroyownedobject
     */
    DestroyOwnedObject(pObject) {
        result := ComCall(8, this, "ptr", pObject, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID3D12LifetimeTracker.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DestroyOwnedObject := CallbackCreate(GetMethod(implObj, "DestroyOwnedObject"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DestroyOwnedObject)
    }
}
