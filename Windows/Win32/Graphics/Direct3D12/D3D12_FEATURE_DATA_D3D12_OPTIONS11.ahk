#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Indicates whether or not 64-bit integer atomics on resources in descriptor heaps are supported.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options11
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_FEATURE_DATA_D3D12_OPTIONS11 {
    #StructPack 4

    /**
     * Type: \_Out\_ **[BOOL](/windows/desktop/winprog/windows-data-types)**
     * 
     * Indicates whether or not 64-bit integer atomics on resources in descriptor heaps are supported. `true` if supported, otherwise `false`.
     */
    AtomicInt64OnDescriptorHeapResourceSupported : BOOL

}
