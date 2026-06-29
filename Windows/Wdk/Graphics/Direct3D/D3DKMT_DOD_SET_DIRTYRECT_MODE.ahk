#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_DOD_SET_DIRTYRECT_MODE {
    #StructPack 4

    bForceFullScreenDirty : BOOL

}
