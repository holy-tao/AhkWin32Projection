#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Gdi\RGBQUAD.ahk" { RGBQUAD }

/**
 * The TRUECOLORINFO structure contains color palette and bitmask information for a video image.
 * @remarks
 * This structure is not used for some RGB formats. For more information about which fields are valid under different circumstances, see the Platform SDK documentation for <b>BITMAPINFO</b>.
 * @see https://learn.microsoft.com/windows/win32/api/amvideo/ns-amvideo-truecolorinfo
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct TRUECOLORINFO {
    #StructPack 4

    /**
     * Array of color masks (one per color element).
     */
    dwBitMasks : UInt32[3]

    /**
     * Array of palette colors.
     */
    bmiColors : RGBQUAD[256]

}
