#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ID3D12RootSignature.ahk" { ID3D12RootSignature }

/**
 * Defines a local root signature state subobject that will be used with associated shaders.
 * @remarks
 * The presence of this subobject in a state object is optional.  The combination of global and/or local root signatures associated with any given shader function must define all resource bindings declared by the shader (with no overlap across global and local root signatures).
 * 
 * If any given function in a call graph (not counting calls across shader tables) is associated with a particular local root signature, any other functions in the graph must either be associated with the same local root signature or none, and the shader entry (the root of the call graph) must be associated with the local root signature.  This is due to the fact that the set of code reachable from a given shader entry gets invoked from a shader identifier in a shader record, where a single set of local root arguments apply.  Of course different shaders can use different local root signatures (or none), as their shader identifiers will be in different shader records.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_local_root_signature
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_LOCAL_ROOT_SIGNATURE {
    #StructPack 8

    /**
     * The root signature that will function as a local root signature.  A state object holds a reference to this signature.
     */
    pLocalRootSignature : ID3D12RootSignature

}
