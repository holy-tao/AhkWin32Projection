#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of root signature slot.
 * @remarks
 * 
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_root_parameter">D3D12_ROOT_PARAMETER</a> structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_root_parameter_type
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_ROOT_PARAMETER_TYPE{

    /**
     * The slot is for a descriptor table.
     * @type {Integer (Int32)}
     */
    static D3D12_ROOT_PARAMETER_TYPE_DESCRIPTOR_TABLE => 0

    /**
     * The slot is for root constants.
     * @type {Integer (Int32)}
     */
    static D3D12_ROOT_PARAMETER_TYPE_32BIT_CONSTANTS => 1

    /**
     * The slot is for a constant-buffer view (CBV).
     * @type {Integer (Int32)}
     */
    static D3D12_ROOT_PARAMETER_TYPE_CBV => 2

    /**
     * The slot is for a shader-resource view (SRV).
     * @type {Integer (Int32)}
     */
    static D3D12_ROOT_PARAMETER_TYPE_SRV => 3

    /**
     * The slot is for a unordered-access view (UAV).
     * @type {Integer (Int32)}
     */
    static D3D12_ROOT_PARAMETER_TYPE_UAV => 4
}
