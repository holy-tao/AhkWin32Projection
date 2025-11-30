#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of access that an application is given to the specified resource(s) at the transition out of a render pass.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_render_pass_ending_access_type
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RENDER_PASS_ENDING_ACCESS_TYPE extends Win32Enum{

    /**
     * Indicates that your application won't have any future dependency on any data that you wrote to the resource(s) during this render pass. For example, a depth buffer that won't be textured from before it's written to again.
     * @type {Integer (Int32)}
     */
    static D3D12_RENDER_PASS_ENDING_ACCESS_TYPE_DISCARD => 0

    /**
     * Indicates that your application will have a dependency on the written contents of the resource(s) in the future, and so they must be preserved.
     * @type {Integer (Int32)}
     */
    static D3D12_RENDER_PASS_ENDING_ACCESS_TYPE_PRESERVE => 1

    /**
     * Indicates that the resource(s)—for example, a multi-sample anti-aliasing (MSAA) surface—should be directly resolved to a separate resource at the conclusion of the render pass. For a tile-based deferred renderer (TBDR), this should ideally happenwhile the MSAA contents are still in the tile cache. You should ensure that the resolve destination is in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATE_RESOLVE_DEST</a> resource state when the render pass ends. The resolve source is left in its initial resource state at the time the render pass ends.  A resolve operation submitted by a render pass doesn't implicitly change the state of any resource.
     * @type {Integer (Int32)}
     */
    static D3D12_RENDER_PASS_ENDING_ACCESS_TYPE_RESOLVE => 2

    /**
     * Indicates that your application will neither read from nor write  to the resource(s) during the render pass. You would most likely use this value to indicate that you won't be accessing the depth/stencil plane for a depth/stencil view (DSV). You must pair this value with <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_render_pass_beginning_access_type">D3D12_RENDER_PASS_BEGINNING_ACCESS_TYPE_NO_ACCESS</a> in the corresponding <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_render_pass_beginning_access">D3D12_RENDER_PASS_BEGINNING_ACCESS</a> structure.
     * @type {Integer (Int32)}
     */
    static D3D12_RENDER_PASS_ENDING_ACCESS_TYPE_NO_ACCESS => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_RENDER_PASS_ENDING_ACCESS_TYPE_PRESERVE_LOCAL_RENDER => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_RENDER_PASS_ENDING_ACCESS_TYPE_PRESERVE_LOCAL_SRV => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_RENDER_PASS_ENDING_ACCESS_TYPE_PRESERVE_LOCAL_UAV => 6
}
