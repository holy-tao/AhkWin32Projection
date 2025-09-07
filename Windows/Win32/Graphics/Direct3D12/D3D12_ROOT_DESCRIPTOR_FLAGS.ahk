#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the volatility of the data referenced by descriptors in a Root Signature 1.1 description, which can enable some driver optimizations.
 * @remarks
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_root_descriptor1">D3D12_ROOT_DESCRIPTOR1</a> structure.
  * 
  * To specify the volatility of both descriptors and data, refer to <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_descriptor_range_flags">D3D12_DESCRIPTOR_RANGE_FLAGS</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_root_descriptor_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_ROOT_DESCRIPTOR_FLAGS{

    /**
     * Default assumptions are made for data (for SRV/CBV: DATA_STATIC_WHILE_SET_AT_EXECUTE, and for UAV: DATA_VOLATILE).
     * @type {Integer (Int32)}
     */
    static D3D12_ROOT_DESCRIPTOR_FLAG_NONE => 0

    /**
     * Data is volatile. Equivalent to Root Signature Version 1.0.
     * @type {Integer (Int32)}
     */
    static D3D12_ROOT_DESCRIPTOR_FLAG_DATA_VOLATILE => 2

    /**
     * Data is static while set at execute.
     * @type {Integer (Int32)}
     */
    static D3D12_ROOT_DESCRIPTOR_FLAG_DATA_STATIC_WHILE_SET_AT_EXECUTE => 4

    /**
     * Data is static. The best potential for driver optimization.
     * @type {Integer (Int32)}
     */
    static D3D12_ROOT_DESCRIPTOR_FLAG_DATA_STATIC => 8
}
