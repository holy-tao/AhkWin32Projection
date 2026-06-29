#Requires AutoHotkey v2.1-alpha.26+ 64-bit

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
 */
export default struct D3D12_TILE_MAPPING_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
