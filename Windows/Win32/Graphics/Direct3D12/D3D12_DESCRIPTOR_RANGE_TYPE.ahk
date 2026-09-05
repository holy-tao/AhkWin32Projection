#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies a range so that, for example, if part of a descriptor table has 100 shader-resource views (SRVs) that range can be declared in one entry rather than 100.
 * @remarks
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_descriptor_range">D3D12_DESCRIPTOR_RANGE</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_descriptor_range_type
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_DESCRIPTOR_RANGE_TYPE extends Win32Enum {

    /**
     * Specifies a range of SRVs.
     * Native name: D3D12_DESCRIPTOR_RANGE_TYPE_SRV
     * @type {Integer (Int32)}
     */
    static SRV => 0

    /**
     * Specifies a range of unordered-access views (UAVs).
     * Native name: D3D12_DESCRIPTOR_RANGE_TYPE_UAV
     * @type {Integer (Int32)}
     */
    static UAV => 1

    /**
     * Specifies a range of constant-buffer views (CBVs).
     * Native name: D3D12_DESCRIPTOR_RANGE_TYPE_CBV
     * @type {Integer (Int32)}
     */
    static CBV => 2

    /**
     * Specifies a range of samplers.
     * Native name: D3D12_DESCRIPTOR_RANGE_TYPE_SAMPLER
     * @type {Integer (Int32)}
     */
    static SAMPLER => 3
}
