#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the Portable Network Graphics (PNG) sRGB chunk metadata properties.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/ne-wincodec-wicpngsrgbproperties
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICPngSrgbProperties{

    /**
     * [VT_UI1] Indicates the rendering intent for an sRGB color space image. The rendering intents have the following meaning.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td>0</td>
 * <td>Perceptual</td>
 * </tr>
 * <tr>
 * <td>1</td>
 * <td>Relative colorimetric</td>
 * </tr>
 * <tr>
 * <td>2</td>
 * <td>Saturation</td>
 * </tr>
 * <tr>
 * <td>3</td>
 * <td>Absolute colorimetric</td>
 * </tr>
 * </table>
     * @type {Integer (Int32)}
     */
    static WICPngSrgbRenderingIntent => 1
}
