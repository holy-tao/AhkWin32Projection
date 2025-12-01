#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the tier level at which view instancing is supported.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_view_instancing_tier
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_VIEW_INSTANCING_TIER extends Win32Enum{

    /**
     * View instancing is not supported.
     * @type {Integer (Int32)}
     */
    static D3D12_VIEW_INSTANCING_TIER_NOT_SUPPORTED => 0

    /**
     * View instancing is supported by draw-call level looping only.
     * @type {Integer (Int32)}
     */
    static D3D12_VIEW_INSTANCING_TIER_1 => 1

    /**
     * View instancing is supported by draw-call level looping at worst, but the GPU can perform view instancing more efficiently in certain circumstances which are architecture-dependent.
     * @type {Integer (Int32)}
     */
    static D3D12_VIEW_INSTANCING_TIER_2 => 2

    /**
     * View instancing is supported and instancing begins with the first shader stage that references SV_ViewID or with rasterization if no shader stage references SV_ViewID. This means that redundant work is eliminated across view instances when it's not dependent on SV_ViewID. Before rasterization, work that doesn't directly depend on SV_ViewID is shared across all views; only work that depends on SV_ViewID is repeated for each view.
     * 
     * <div class="alert"><b>Note</b>  If a hull shader produces tessellation factors that are dependent on SV_ViewID, then tessellation and all subsequent work must be repeated per-view. Similarly, if the amount of geometry produced by the geometry shader depends on SV_ViewID, then the geometry shader must be repeated per-view before proceeding to rasterization.</div>
     * <div> </div>
     * View instance masking only effects whether work that directly depends on SV_ViewID is performed, not the entire loop iteration (per-view). If the view instance mask is non-0, some work that depends on SV_ViewID might still be performed on masked-off pixels but will have no externally-visible effect; for example, no UAV writes are performed and clipping/rasterization is not invoked. If the view instance mask is 0 no work is performed, including work that's not dependent on SV_ViewID.
     * @type {Integer (Int32)}
     */
    static D3D12_VIEW_INSTANCING_TIER_3 => 3
}
