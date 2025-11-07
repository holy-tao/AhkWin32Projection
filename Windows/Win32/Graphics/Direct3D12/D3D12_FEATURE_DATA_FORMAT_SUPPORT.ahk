#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes which resources are supported by the current graphics driver for a given format.
 * @remarks
 * 
 * Refer to <a href="https://docs.microsoft.com/windows/desktop/direct3d11/typed-unordered-access-view-loads">Typed unordered access view loads</a> for an example use of this structure.
 * 
 * Also see <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_feature">D3D12_FEATURE</a>.
 * 
 * <h3><a id="Hardware_support_for_DXGI_Formats"></a><a id="hardware_support_for_dxgi_formats"></a><a id="HARDWARE_SUPPORT_FOR_DXGI_FORMATS"></a>Hardware support for DXGI Formats</h3>
 * To view tables of DXGI formats and hardware features, refer to:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/hardware-support-for-direct3d-12-1-formats">DXGI Format  Support for Direct3D Feature Level 12.1 Hardware</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/hardware-support-for-direct3d-12-0-formats">DXGI Format  Support for Direct3D Feature Level 12.0 Hardware</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/format-support-for-direct3d-11-1-feature-level-hardware">DXGI Format  Support for Direct3D Feature Level 11.1 Hardware</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/format-support-for-direct3d-11-0-feature-level-hardware">DXGI Format  Support for Direct3D Feature Level 11.0 Hardware</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/ff471324(v=vs.85)">Hardware Support for Direct3D 10Level9 Formats</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/format-support-for-direct3d-feature-level-10-1-hardware">Hardware Support for Direct3D 10.1 Formats</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/format-support-for-direct3d-feature-level-10-0-hardware">Hardware Support for Direct3D 10 Formats</a>
 * </li>
 * </ul>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_feature_data_format_support
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_FORMAT_SUPPORT extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>-typed value for the format to return info about.
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_format_support1">D3D12_FORMAT_SUPPORT1</a>-typed values that are combined by using a bitwise OR operation. The resulting value specifies which resources are supported.
     * @type {Integer}
     */
    Support1 {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_format_support2">D3D12_FORMAT_SUPPORT2</a>-typed values that are combined by using a bitwise OR operation. The resulting value specifies which unordered resource options are supported.
     * @type {Integer}
     */
    Support2 {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
