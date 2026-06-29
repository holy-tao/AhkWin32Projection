#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIEW_INSTANCE_LOCATION.ahk" { D3D12_VIEW_INSTANCE_LOCATION }
#Import ".\D3D12_VIEW_INSTANCING_FLAGS.ahk" { D3D12_VIEW_INSTANCING_FLAGS }

/**
 * Specifies parameters used during view instancing configuration.
 * @remarks
 * View instancing is declared in a PSO using this structure. The view instance count is set in the PSO to allow whole-pipeline optimization based on the number of views.
 * 
 * View instancing is disabled when it's not declared in the PSO or when ViewInstanceCount is set to 0. When disabled, rendering behaves as if view instancing is enabled and ViewInstanceCount is set to 1; shaders only see a value of 0 in SV_ViewID and just one view instance is produced. This allows shaders that are aware of view instancing to still be used in PSOs that disable it. Some adapters might support shader model 6.1 (which exposes SV_ViewID) but not view instancing; these adapters must still support shaders that input SV_ViewID in PSOs that declare ViewInstanceCount as 0 or 1.
 * 
 * The shader prior to rasterization can output SV_RenderTargetArrayIndex and SV_ViewportArrayIndex values which don't have to depend on SV_ViewID. To compute the final effective index of the viewport and render target where primitives will be sent, these values, when present, are added to the ViewportArrayIndex and RenderTargetArrayIndex values of the view instance locations declared in the PSO. If a computed index is out of range (that is, when the index is larger than the number of viewport or render target elements in their respective arrays) then the effective index becomes 0.
 * 
 * For shaders that dynamically select the viewport or render target indices, an application can set all the view instance locations declared in the PSO to a single value (such as 0) to act as a uniform base index to which the dynamically-selected SV_RenderTargetArrayIndex and SV_ViewportArrayIndex values are added.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_view_instancing_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_VIEW_INSTANCING_DESC {
    #StructPack 8

    /**
     * Specifies the number of views to be used, up to D3D12_MAX_VIEW_INSTANCE_COUNT.
     */
    ViewInstanceCount : UInt32

    /**
     * The address of a memory location that contains <b>ViewInstanceCount</b> view instance location structures that specify the location of viewport/scissor and render target details of each view instance.
     */
    pViewInstanceLocations : D3D12_VIEW_INSTANCE_LOCATION.Ptr

    /**
     * Configures view instancing with additional options.
     */
    Flags : D3D12_VIEW_INSTANCING_FLAGS

}
