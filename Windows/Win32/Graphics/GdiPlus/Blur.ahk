#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CGpEffect.ahk" { CGpEffect }
#Import ".\Effect.ahk" { Effect }

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct Blur {
    #StructPack 8

    Base : Effect

}
