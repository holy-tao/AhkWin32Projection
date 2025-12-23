#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how to perform a tile-mapping operation.
 * @remarks
 * This enum is used by the following methods:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12commandqueue-copytilemappings">CopyTileMappings</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12commandqueue-updatetilemappings">UpdateTileMappings</a>
 * </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_tile_mapping_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_TILE_MAPPING_FLAGS extends Win32BitflagEnum{

    /**
     * No tile-mapping flags are specified.
     * @type {Integer (Int32)}
     */
    static D3D12_TILE_MAPPING_FLAG_NONE => 0

    /**
     * Unsupported, do not use.
     * @type {Integer (Int32)}
     */
    static D3D12_TILE_MAPPING_FLAG_NO_HAZARD => 1
}
