#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Device6.ahk

/**
 * Represents a virtual adapter. This interface extends [ID3D12Device6](../d3d12/nn-d3d12-id3d12device6.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12device7
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Device7 extends ID3D12Device6{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12Device7
     * @type {Guid}
     */
    static IID => Guid("{5c014b53-68a1-4b9b-8bd1-dd6046b9358b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 66

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddToStateObject", "CreateProtectedResourceSession1"]

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
        result := ComCall(66, this, "ptr", pAddition, "ptr", pStateObjectToGrowFrom, "ptr", riid, "ptr*", &ppNewStateObject := 0, "HRESULT")
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
        result := ComCall(67, this, "ptr", pDesc, "ptr", riid, "ptr*", &ppSession := 0, "HRESULT")
        return ppSession
    }
}
