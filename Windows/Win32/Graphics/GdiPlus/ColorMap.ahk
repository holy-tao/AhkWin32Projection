#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Color.ahk" { Color }

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct ColorMap {
    #StructPack 4

    oldColor : Color

    newColor : Color

}
