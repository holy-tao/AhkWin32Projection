#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXGI_RGB.ahk" { DXGI_RGB }

/**
 * @namespace Windows.Win32.Graphics.Dxgi.Common
 */
export default struct DXGI_GAMMA_CONTROL {
    #StructPack 4

    Scale : DXGI_RGB

    Offset : DXGI_RGB

    GammaCurve : DXGI_RGB[1025]

}
