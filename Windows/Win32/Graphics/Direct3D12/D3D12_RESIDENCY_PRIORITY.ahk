#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies broad residency priority buckets useful for quickly establishing an application priority scheme.
 * @remarks
 * 
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device1-setresidencypriority">SetResidencyPriority</a> method.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_residency_priority
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RESIDENCY_PRIORITY{

    /**
     * Indicates a minimum priority.
     * @type {Integer (Int32)}
     */
    static D3D12_RESIDENCY_PRIORITY_MINIMUM => 671088640

    /**
     * Indicates a low priority.
     * @type {Integer (Int32)}
     */
    static D3D12_RESIDENCY_PRIORITY_LOW => 1342177280

    /**
     * Indicates a normal, medium, priority.
     * @type {Integer (Int32)}
     */
    static D3D12_RESIDENCY_PRIORITY_NORMAL => 2013265920

    /**
     * Indicates a high priority. Applications are discouraged from using priories greater than this. For more information see <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device1-setresidencypriority">ID3D12Device1::SetResidencyPriority</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_RESIDENCY_PRIORITY_HIGH => -1610547200

    /**
     * Indicates a maximum priority. Applications are discouraged from using priorities greater than this; <b>D3D12_RESIDENCY_PRIORITY_MAXIMUM</b> is not guaranteed to be available. For more information see <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device1-setresidencypriority">ID3D12Device1::SetResidencyPriority</a>
     * @type {Integer (Int32)}
     */
    static D3D12_RESIDENCY_PRIORITY_MAXIMUM => -939524096
}
