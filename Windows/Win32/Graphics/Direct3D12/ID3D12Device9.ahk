#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D12Device8.ahk" { ID3D12Device8 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D12_COMMAND_QUEUE_DESC.ahk" { D3D12_COMMAND_QUEUE_DESC }
#Import ".\D3D12_SHADER_CACHE_CONTROL_FLAGS.ahk" { D3D12_SHADER_CACHE_CONTROL_FLAGS }
#Import ".\D3D12_SHADER_CACHE_SESSION_DESC.ahk" { D3D12_SHADER_CACHE_SESSION_DESC }
#Import ".\D3D12_SHADER_CACHE_KIND_FLAGS.ahk" { D3D12_SHADER_CACHE_KIND_FLAGS }

/**
 * Represents a virtual adapter. This interface extends [ID3D12Device8](/windows/win32/api/d3d12/nn-d3d12-id3d12device8) to add methods to manage shader caches.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12device9
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12Device9 extends ID3D12Device8 {
    /**
     * The interface identifier for ID3D12Device9
     * @type {Guid}
     */
    static IID := Guid("{4c80e962-f032-4f60-bc9e-ebc2cfa1d83c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12Device9 interfaces
    */
    struct Vtbl extends ID3D12Device8.Vtbl {
        CreateShaderCacheSession : IntPtr
        ShaderCacheControl       : IntPtr
        CreateCommandQueue1      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12Device9.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates an object that grants access to a shader cache, potentially opening an existing cache or creating a new one.
     * @param {Pointer<D3D12_SHADER_CACHE_SESSION_DESC>} pDesc Type: \_In\_ **const [D3D12_SHADER_CACHE_SESSION_DESC](ns-d3d12-d3d12_shader_cache_session_desc.md)\***
     * 
     * A **D3D12_SHADER_CACHE_SESSION_DESC** structure describing the shader cache session to create.
     * @param {Pointer<Guid>} riid Type: **[REFIID](/openspecs/windows_protocols/ms-oaut/bbde795f-5398-42d8-9f59-3613da03c318)**
     * 
     * The globally unique identifier (GUID) for the shader cache session interface.
     * @returns {Pointer<Void>} Type: \_COM\_Outptr\_opt\_ **void\*\***
     * 
     * A pointer to a memory block that receives a pointer to the [ID3D12ShaderCacheSession](nn-d3d12-id3d12shadercachesession.md) interface for the shader cache session.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device9-createshadercachesession
     */
    CreateShaderCacheSession(pDesc, riid) {
        result := ComCall(73, this, D3D12_SHADER_CACHE_SESSION_DESC.Ptr, pDesc, Guid.Ptr, riid, "ptr*", &ppvSession := 0, "HRESULT")
        return ppvSession
    }

    /**
     * Modifies the behavior of caches used internally by Direct3D or by the driver.
     * @param {D3D12_SHADER_CACHE_KIND_FLAGS} Kinds Type: **[D3D12_SHADER_CACHE_KIND_FLAGS](ne-d3d12-d3d12_shader_cache_kind_flags.md)**
     * 
     * The caches to modify. Any one of these caches may or may not exist.
     * @param {D3D12_SHADER_CACHE_CONTROL_FLAGS} Control Type: **[D3D12_SHADER_CACHE_CONTROL_FLAGS](ne-d3d12-d3d12_shader_cache_control_flags.md)**
     * 
     * The way in which to modify the caches. You can't pass both **DISABLE** and **ENABLE** at the same time; and you must pass at least one flag.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device9-shadercachecontrol
     */
    ShaderCacheControl(Kinds, Control) {
        result := ComCall(74, this, D3D12_SHADER_CACHE_KIND_FLAGS, Kinds, D3D12_SHADER_CACHE_CONTROL_FLAGS, Control, "HRESULT")
        return result
    }

    /**
     * Creates a command queue with a creator ID.
     * @remarks
     * When multiple components in the same process are sharing a single Direct3D 12 device, often they will end up with separate workloads on independent command queues. In some hardware implementations, independent queues can run in parallel only with specific other command queues.
     * 	 
     * Direct3D 12 applies a first-come, first-serve grouping for queues, which might not work well for all application or component designs. To help inform Direct3D 12's grouping of queues, you can specify a *creator ID* (which is unique per component) that restricts the grouping to other queues with the same ID. When possible, a component should choose the same unique ID for all of its queues. Microsoft has reserved a few well-known creator IDs for use by Microsoft-developed implementations of APIs on top of Direct3D 12.
     * @param {Pointer<D3D12_COMMAND_QUEUE_DESC>} pDesc Type: \_In\_ **const [D3D12_COMMAND_QUEUE_DESC](/windows/win32/api/d3d12/ns-d3d12-d3d12_command_queue_desc)\***
     * 
     * Specifies a **D3D12_COMMAND_QUEUE_DESC** that describes the command queue.
     * @param {Pointer<Guid>} CreatorID Type: **[REFIID](/openspecs/windows_protocols/ms-oaut/bbde795f-5398-42d8-9f59-3613da03c318)**
     * 
     * A creator ID. See **Remarks**.
     * @param {Pointer<Guid>} riid Type: **[REFIID](/openspecs/windows_protocols/ms-oaut/bbde795f-5398-42d8-9f59-3613da03c318)**
     * 
     * The globally unique identifier (GUID) for the command queue interface.
     * @returns {Pointer<Void>} Type: \_COM\_Outptr\_ **void\*\***
     * 
     * A pointer to a memory block that receives a pointer to the [ID3D12CommandQueue](/windows/win32/api/d3d12/nn-d3d12-id3d12commandqueue) interface for the command queue.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device9-createcommandqueue1
     */
    CreateCommandQueue1(pDesc, CreatorID, riid) {
        result := ComCall(75, this, D3D12_COMMAND_QUEUE_DESC.Ptr, pDesc, Guid.Ptr, CreatorID, Guid.Ptr, riid, "ptr*", &ppCommandQueue := 0, "HRESULT")
        return ppCommandQueue
    }

    Query(iid) {
        if (ID3D12Device9.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateShaderCacheSession := CallbackCreate(GetMethod(implObj, "CreateShaderCacheSession"), flags, 4)
        this.vtbl.ShaderCacheControl := CallbackCreate(GetMethod(implObj, "ShaderCacheControl"), flags, 3)
        this.vtbl.CreateCommandQueue1 := CallbackCreate(GetMethod(implObj, "CreateCommandQueue1"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateShaderCacheSession)
        CallbackFree(this.vtbl.ShaderCacheControl)
        CallbackFree(this.vtbl.CreateCommandQueue1)
    }
}
