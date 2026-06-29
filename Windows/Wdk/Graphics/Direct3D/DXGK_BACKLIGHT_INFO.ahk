#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGK_BACKLIGHT_INFO {
    #StructPack 8

    BacklightUsersetting : UInt16

    BacklightEffective : UInt16

    GammaRamp : IntPtr

}
