#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Dxgi\Common\DXGI_FORMAT.ahk

/**
 * Describes a DXGI data format and plane count.
 * @remarks
 * See <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_feature">D3D12_FEATURE</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_format_info
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_FEATURE_DATA_FORMAT_INFO extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>-typed value for the format to return info about.
     * @type {DXGI_FORMAT}
     */
    Format {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The number of planes to provide information about.
     * @type {Integer}
     */
    PlaneCount {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }
}
