#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies constraints for state objects. Use values from this enumeration in the D3D12_STATE_OBJECT_CONFIG structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_state_object_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_STATE_OBJECT_FLAGS extends Win32BitflagEnum{

    /**
     * No state object constraints.
     * @type {Integer (Int32)}
     */
    static D3D12_STATE_OBJECT_FLAG_NONE => 0

    /**
     * This flag applies to state objects of type collection only. Otherwise this flag is ignored.  
     * 
     * The exports from this collection are allowed to have unresolved references (dependencies) that would have to be resolved (defined) when the collection is included in a containing state object, such as a raytracing pipeline state object (RTPSO).  This includes depending on externally defined subobject associations to associate an external subobject (e.g. root signature) to a local export.
     * 
     * In the absence of this flag, all exports in this collection must have their dependencies fully locally resolved, including any necessary subobject associations being defined locally.  Advanced implementations/drivers will have enough information to compile the code in the collection and not need to keep around any uncompiled code (unless the <b>D3D12_STATE_OBJECT_FLAG_ALLOW_EXTERNAL_DEPENDENCIES_ON_LOCAL_DEFINITIONS</b> flag is set), so that when the collection is used in a containing state object (e.g. RTPSO), minimal work needs to be done by the driver, ideally a “cheap” link at most.
     * @type {Integer (Int32)}
     */
    static D3D12_STATE_OBJECT_FLAG_ALLOW_LOCAL_DEPENDENCIES_ON_EXTERNAL_DEFINITIONS => 1

    /**
     * This flag applies to state objects of type collection only. Otherwise this flag is ignored.  
     * 
     * If this collection is included in another state object (e.g. RTPSO), shaders / functions in the rest of the containing state object are allowed to depend on (e.g. call) exports from this collection.
     * 
     * In the absence of this flag (default), exports from this collection cannot be directly referenced by other parts of containing state objects (e.g. RTPSO).  This can reduce memory footprint for the collection slightly since drivers don’t need to keep uncompiled code in the collection on the off chance that it may get called by some external function that would then compile all the code together.  That said, if not all necessary subobject associations have been locally defined for code in this collection, the driver may not be able to compile shader code yet and may still need to keep uncompiled code around.  
     * 
     * A subobject association defined externally that associates an external subobject to a local export does not count as an external dependency on a local definition, so the presence or absence of this flag does not affect whether the association is allowed or not. On the other hand if the current collection defines a subobject association for a locally defined subobject to an external export (e.g. shader), that counts as an external dependency on a local definition and this flag must be set.
     * 
     * Regardless of the presence or absence of this flag, shader entrypoints (such as hit groups or miss shaders) in the collection are visible as entrypoints to a containing state object (e.g. RTPSO) if exported by it.  In the case of an RTPSO, the exported entrypoints can be used in shader tables for raytracing.
     * @type {Integer (Int32)}
     */
    static D3D12_STATE_OBJECT_FLAG_ALLOW_EXTERNAL_DEPENDENCIES_ON_LOCAL_DEFINITIONS => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_STATE_OBJECT_FLAG_ALLOW_STATE_OBJECT_ADDITIONS => 4
}
