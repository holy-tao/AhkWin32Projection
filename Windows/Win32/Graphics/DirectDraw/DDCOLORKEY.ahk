#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DDCOLORKEY structure describes a source color key, destination color key, or color space.
 * @see https://learn.microsoft.com/windows/win32/api/ddraw/ns-ddraw-ddcolorkey
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDCOLORKEY {
    #StructPack 4

    /**
     * Low value of the color range that is to be used as the color key.
     */
    dwColorSpaceLowValue : UInt32

    /**
     * High value of the color range that is to be used as the color key.
     */
    dwColorSpaceHighValue : UInt32

}
