#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies a YCbCr color value. (D3D11_VIDEO_COLOR_YCbCrA)
 * @remarks
 * Values have a nominal range of [0...1]. Given a format with  <i>n</i> bits per channel, the value of each color component is calculated as follows:
 * 
 * <c>val = f * ((1 &lt;&lt; n)-1)</c>
 * 
 * For example, for 8-bit YUV formats, <c>val = BYTE(f * 255.0)</c>.  Reference black is (0.0625, 0.5, 0.5), which corresponds to (16, 128, 128) in an 8-bit representation.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_color_ycbcra
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_VIDEO_COLOR_YCbCrA {
    #StructPack 4

    /**
     * The Y luma value.
     */
    Y : Float32

    /**
     * The Cb chroma value.
     */
    Cb : Float32

    /**
     * The Cr chroma value.
     */
    Cr : Float32

    /**
     * The alpha value. Values range from 0 (transparent) to 1 (opaque).
     */
    A : Float32

}
