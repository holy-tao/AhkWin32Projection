#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines a global root signature state suboject that will be used with associated shaders.
 * @remarks
 * 
 * The presence of this subobject in a state object is optional.  The combination of global and/or local root signatures associated with any given shader function must define all resource bindings declared by the shader with no overlap across global and local root signatures.
 * 
 * If any given function in a call graph is associated with a particular global root signature, any other functions in the graph must either be associated with the same global root signature or none, and the shader entry (the root of the call graph) must be associated with the global root signature.
 * 
 * Different shaders can use different global root signatures (or none) within a state object, however any shaders referenced during a particular <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist4-dispatchrays">DispatchRays</a> operation from a command list must have specified the same global root signature as what has been set on the command list as the compute root signature.  So it is valid to define a single large state object with multiple global root signatures associated with different subsets of the shaders. Apps are not forced to split their state object just because some shaders use different global root signatures.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_global_root_signature
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_GLOBAL_ROOT_SIGNATURE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The root signature that will function as a global root signature.  A state object holds a reference to this signature.
     * @type {ID3D12RootSignature}
     */
    pGlobalRootSignature {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
