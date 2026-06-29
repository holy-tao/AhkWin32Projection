#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct BlurParams {
    #StructPack 4

    radius : Float32

    expandEdge : BOOL

}
