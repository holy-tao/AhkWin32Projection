#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Device8.ahk

/**
 * Represents a virtual adapter. This interface extends [ID3D12Device8](/windows/win32/api/d3d12/nn-d3d12-id3d12device8) to add methods to manage shader caches.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12device9
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Device9 extends ID3D12Device8{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12Device9
     * @type {Guid}
     */
    static IID => Guid("{4c80e962-f032-4f60-bc9e-ebc2cfa1d83c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 73

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateShaderCacheSession", "ShaderCacheControl", "CreateCommandQueue1"]

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
        result := ComCall(73, this, "ptr", pDesc, "ptr", riid, "ptr*", &ppvSession := 0, "HRESULT")
        return ppvSession
    }

    /**
     * Modifies the behavior of caches used internally by Direct3D or by the driver.
     * @param {Integer} Kinds Type: **[D3D12_SHADER_CACHE_KIND_FLAGS](ne-d3d12-d3d12_shader_cache_kind_flags.md)**
     * 
     * The caches to modify. Any one of these caches may or may not exist.
     * @param {Integer} Control Type: **[D3D12_SHADER_CACHE_CONTROL_FLAGS](ne-d3d12-d3d12_shader_cache_control_flags.md)**
     * 
     * The way in which to modify the caches. You can't pass both **DISABLE** and **ENABLE** at the same time; and you must pass at least one flag.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device9-shadercachecontrol
     */
    ShaderCacheControl(Kinds, Control) {
        result := ComCall(74, this, "int", Kinds, "int", Control, "HRESULT")
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
        result := ComCall(75, this, "ptr", pDesc, "ptr", CreatorID, "ptr", riid, "ptr*", &ppCommandQueue := 0, "HRESULT")
        return ppCommandQueue
    }
}
