#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines a local root signature state subobject that will be used with associated shaders.
 * @remarks
 * 
  * The presence of this subobject in a state object is optional.  The combination of global and/or local root signatures associated with any given shader function must define all resource bindings declared by the shader (with no overlap across global and local root signatures).
  * 
  * If any given function in a call graph (not counting calls across shader tables) is associated with a particular local root signature, any other functions in the graph must either be associated with the same local root signature or none, and the shader entry (the root of the call graph) must be associated with the local root signature.  This is due to the fact that the set of code reachable from a given shader entry gets invoked from a shader identifier in a shader record, where a single set of local root arguments apply.  Of course different shaders can use different local root signatures (or none), as their shader identifiers will be in different shader records.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_local_root_signature
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_LOCAL_ROOT_SIGNATURE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The root signature that will function as a local root signature.  A state object holds a reference to this signature.
     * @type {ID3D12RootSignature}
     */
    pLocalRootSignature {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
