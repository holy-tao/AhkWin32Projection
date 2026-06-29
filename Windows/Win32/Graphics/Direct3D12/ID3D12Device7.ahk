#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_PROTECTED_RESOURCE_SESSION_DESC1.ahk" { D3D12_PROTECTED_RESOURCE_SESSION_DESC1 }
#Import ".\ID3D12StateObject.ahk" { ID3D12StateObject }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D12_STATE_OBJECT_DESC.ahk" { D3D12_STATE_OBJECT_DESC }
#Import ".\ID3D12Device6.ahk" { ID3D12Device6 }

/**
 * Represents a virtual adapter. This interface extends [ID3D12Device6](../d3d12/nn-d3d12-id3d12device6.md).
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12device7
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12Device7 extends ID3D12Device6 {
    /**
     * The interface identifier for ID3D12Device7
     * @type {Guid}
     */
    static IID := Guid("{5c014b53-68a1-4b9b-8bd1-dd6046b9358b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12Device7 interfaces
    */
    struct Vtbl extends ID3D12Device6.Vtbl {
        AddToStateObject                : IntPtr
        CreateProtectedResourceSession1 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12Device7.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Incrementally add to an existing state object. This incurs lower CPU overhead than creating a state object from scratch that is a superset of an existing one.
     * @remarks
     * For more info, see [AddToStateObject](https://microsoft.github.io/DirectX-Specs/d3d/Raytracing.html#addtostateobject).
     * @param {Pointer<D3D12_STATE_OBJECT_DESC>} pAddition Type: \_In\_ **const [D3D12_STATE_OBJECT_DESC](./ns-d3d12-d3d12_state_object_desc.md)\***
     * 
     * Description of state object contents to add to existing state object. To help generate this see the **CD3D12_STATE_OBJECT_DESC** helper in class in `d3dx12.h`.
     * @param {ID3D12StateObject} pStateObjectToGrowFrom Type: \_In\_ **[ID3D12StateObject](./nn-d3d12-id3d12stateobject.md)\***
     * 
     * Existing state object, which can be in use (for example, active raytracing) during this operation.
     * 
     * The existing state object must not be of type **Collection**.
     * @param {Pointer<Guid>} riid Type: \_In\_ **REFIID**
     * 
     * Must be the IID of the [ID3D12StateObject](./nn-d3d12-id3d12stateobject.md) interface.
     * @returns {Pointer<Void>} Type: \_COM\_Outptr\_ **void\*\***
     * 
     * Returned state object.
     * 
     * Behavior is undefined if shader identifiers are retrieved for new shaders from this call and they are accessed via shader tables by any already existing or in-flight command list that references some older state object. Use of the new shaders added to the state object can occur only from commands (such as **DispatchRays** or **ExecuteIndirect** calls) recorded in a command list after the call to **AddToStateObject**.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device7-addtostateobject
     */
    AddToStateObject(pAddition, pStateObjectToGrowFrom, riid) {
        result := ComCall(66, this, D3D12_STATE_OBJECT_DESC.Ptr, pAddition, "ptr", pStateObjectToGrowFrom, Guid.Ptr, riid, "ptr*", &ppNewStateObject := 0, "HRESULT")
        return ppNewStateObject
    }

    /**
     * Revises the [**ID3D12Device4::CreateProtectedResourceSession**](../d3d12/nf-d3d12-id3d12device4-createprotectedresourcesession.md) method with provision **GUID** that indicates the type of protected resource session.
     * @param {Pointer<D3D12_PROTECTED_RESOURCE_SESSION_DESC1>} pDesc Type: \_In\_ **const [D3D12_PROTECTED_RESOURCE_SESSION_DESC1](./ns-d3d12-d3d12_protected_resource_session_desc1.md)\***
     * 
     * A pointer to a constant **D3D12_PROTECTED_RESOURCE_SESSION_DESC1** structure, describing the session to create.
     * @param {Pointer<Guid>} riid Type: \_In\_ **REFIID**
     * 
     * The GUID of the interface to a protected session. Most commonly, [ID3D12ProtectedResourceSession1](./nn-d3d12-id3d12protectedresourcesession1.md), although it may be any **GUID** for any interface. If the protected session object doesn't support the interface for this **GUID**, the getter will return **E_NOINTERFACE**.
     * @returns {Pointer<Void>} Type: \_COM\_Outptr\_ **void\*\***
     * 
     * A pointer to a memory block that receives a pointer to the session for the given protected session (the specific interface type returned depends on *riid*).
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device7-createprotectedresourcesession1
     */
    CreateProtectedResourceSession1(pDesc, riid) {
        result := ComCall(67, this, D3D12_PROTECTED_RESOURCE_SESSION_DESC1.Ptr, pDesc, Guid.Ptr, riid, "ptr*", &ppSession := 0, "HRESULT")
        return ppSession
    }

    Query(iid) {
        if (ID3D12Device7.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddToStateObject := CallbackCreate(GetMethod(implObj, "AddToStateObject"), flags, 5)
        this.vtbl.CreateProtectedResourceSession1 := CallbackCreate(GetMethod(implObj, "CreateProtectedResourceSession1"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddToStateObject)
        CallbackFree(this.vtbl.CreateProtectedResourceSession1)
    }
}
