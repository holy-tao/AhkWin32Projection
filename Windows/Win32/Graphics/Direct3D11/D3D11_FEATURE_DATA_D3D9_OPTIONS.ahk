#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes Direct3D 9 feature options in the current graphics driver. (D3D11_FEATURE_DATA_D3D9_OPTIONS)
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_d3d9_options
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_FEATURE_DATA_D3D9_OPTIONS extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies whether the driver supports the nonpowers-of-2-unconditionally feature. For more information about this feature, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature level</a>. The runtime sets this member to <b>TRUE</b> for hardware at Direct3D 10 and higher feature levels.  For hardware at Direct3D 9.3 and lower feature levels, the runtime sets this member to <b>FALSE</b> if the hardware and driver support the powers-of-2 (2D textures must have widths and heights specified as powers of two) feature or the nonpowers-of-2-conditionally feature. For more information about this feature, see feature level.
     * @type {BOOL}
     */
    FullNonPow2TextureSupport {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
