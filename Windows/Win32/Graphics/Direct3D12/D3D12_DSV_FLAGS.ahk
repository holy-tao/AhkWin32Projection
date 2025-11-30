#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies depth-stencil view options.
 * @remarks
 * 
 * Specify a combination of the values in this enumeration in the <b>Flags</b> member of a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_depth_stencil_view_desc">D3D12_DEPTH_STENCIL_VIEW_DESC</a> structure.
 *           The values are combined by using a bitwise OR operation.
 *         
 * 
 * Limiting a depth-stencil buffer to read-only access allows more than one depth-stencil view to be bound to the pipeline simultaneously, since it is not possible to have read/write conflicts between separate views.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_dsv_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_DSV_FLAGS extends Win32BitflagEnum{

    /**
     * Indicates a default view.
     * @type {Integer (Int32)}
     */
    static D3D12_DSV_FLAG_NONE => 0

    /**
     * Indicates that depth values are read only.
     * @type {Integer (Int32)}
     */
    static D3D12_DSV_FLAG_READ_ONLY_DEPTH => 1

    /**
     * Indicates that stencil values are read only.
     * @type {Integer (Int32)}
     */
    static D3D12_DSV_FLAG_READ_ONLY_STENCIL => 2
}
