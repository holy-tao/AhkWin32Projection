#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_MULTIPLANEOVERLAY_HUD_SUPPORT {
    #StructPack 4

    VidPnSourceId : UInt32

    Update : BOOL

    KernelSupported : BOOL

    HudSupported : BOOL

}
