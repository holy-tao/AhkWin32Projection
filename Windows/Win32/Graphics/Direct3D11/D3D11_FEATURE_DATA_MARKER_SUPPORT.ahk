#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes whether a GPU profiling technique is supported.
 * @remarks
 * If the Direct3D API is the Direct3D 11.2 runtime and can support 11.2 features, <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-checkfeaturesupport">ID3D11Device::CheckFeatureSupport</a> for <b>D3D11_FEATURE_MARKER_SUPPORT</b> will return a SUCCESS code when valid parameters are passed. The <b>Profile</b> member of <b>D3D11_FEATURE_DATA_MARKER_SUPPORT</b> will be set to <b>TRUE</b> or <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_marker_support
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_FEATURE_DATA_MARKER_SUPPORT extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies whether the hardware and driver support a GPU profiling technique that can be used with development tools. The runtime sets this member to <b>TRUE</b> if  the hardware and driver support data marking.
     * @type {Integer}
     */
    Profile {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
