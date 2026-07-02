#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\Effect.ahk" { Effect }
#Import ".\CGpEffect.ahk" { CGpEffect }

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct ColorLUT {
    #StructPack 8

    Base : Effect

}
