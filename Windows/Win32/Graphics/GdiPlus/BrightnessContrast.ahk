#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CGpEffect.ahk" { CGpEffect }
#Import ".\Effect.ahk" { Effect }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct BrightnessContrast {
    #StructPack 8

    Base : Effect

}
