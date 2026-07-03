#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DWRITE_COLOR_F.ahk" { DWRITE_COLOR_F }
#Import ".\DWRITE_PAINT_ATTRIBUTES.ahk" { DWRITE_PAINT_ATTRIBUTES }

/**
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_PAINT_COLOR {
    #StructPack 4

    value : DWRITE_COLOR_F

    paletteEntryIndex : UInt16

    alphaMultiplier : Float32

    colorAttributes : DWRITE_PAINT_ATTRIBUTES

}
