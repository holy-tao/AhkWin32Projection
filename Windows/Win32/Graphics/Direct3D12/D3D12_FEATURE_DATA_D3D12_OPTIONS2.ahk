#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Indicates the level of support that the adapter provides for depth-bounds tests and programmable sample positions.
 * @remarks
 * 
  * Use this structure with <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-checkfeaturesupport">CheckFeatureSupport</a> to determine the level of support offered for the optional Depth-bounds test and programmable sample positions features.
  * 
  * See the enumeration constant D3D12_FEATURE_D3D12_OPTIONS2 in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_feature">D3D12_FEATURE</a> enumeration.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_feature_data_d3d12_options2
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_D3D12_OPTIONS2 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-structs-and-classes?view=vs-2015">SAL</a>: <c>_Out_</c>
     * 
     * On return, contains true if depth-bounds tests are supported; otherwise, false.
     * @type {Integer}
     */
    DepthBoundsTestSupported {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-structs-and-classes?view=vs-2015">SAL</a>: <c>_Out_</c>
     * 
     * On return, contains a value that indicates the level of support offered for programmable sample positions.
     * @type {Integer}
     */
    ProgrammableSamplePositionsTier {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
