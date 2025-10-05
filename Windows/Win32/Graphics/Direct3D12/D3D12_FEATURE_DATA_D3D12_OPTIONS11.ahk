#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Indicates whether or not 64-bit integer atomics on resources in descriptor heaps are supported.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options11
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_D3D12_OPTIONS11 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Type: \_Out\_ **[BOOL](/windows/desktop/winprog/windows-data-types)**
     * 
     * Indicates whether or not 64-bit integer atomics on resources in descriptor heaps are supported. `true` if supported, otherwise `false`.
     * @type {Integer}
     */
    AtomicInt64OnDescriptorHeapResourceSupported {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
