#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_GETOVERLAYSTATE {
    #StructPack 4

    hDevice : UInt32

    hOverlay : UInt32

    OverlayEnabled : BOOLEAN

}
