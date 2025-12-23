#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies what type of texture copy is to take place.
 * @remarks
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_texture_copy_location">D3D12_TEXTURE_COPY_LOCATION</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_texture_copy_type
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_TEXTURE_COPY_TYPE extends Win32Enum{

    /**
     * Indicates a subresource, identified by an index, is to be copied.
     * @type {Integer (Int32)}
     */
    static D3D12_TEXTURE_COPY_TYPE_SUBRESOURCE_INDEX => 0

    /**
     * Indicates a place footprint, identified by a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_placed_subresource_footprint">D3D12_PLACED_SUBRESOURCE_FOOTPRINT</a> structure, is to be copied.
     * @type {Integer (Int32)}
     */
    static D3D12_TEXTURE_COPY_TYPE_PLACED_FOOTPRINT => 1
}
