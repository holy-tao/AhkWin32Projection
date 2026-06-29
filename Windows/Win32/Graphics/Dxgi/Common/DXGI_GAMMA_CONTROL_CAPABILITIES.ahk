#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Graphics.Dxgi.Common
 */
export default struct DXGI_GAMMA_CONTROL_CAPABILITIES {
    #StructPack 4

    ScaleAndOffsetSupported : BOOL

    MaxConvertedValue : Float32

    MinConvertedValue : Float32

    NumGammaControlPoints : UInt32

    ControlPointPositions : Float32[1025]

}
