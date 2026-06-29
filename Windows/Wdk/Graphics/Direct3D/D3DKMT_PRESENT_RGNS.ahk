#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_MOVE_RECT.ahk" { D3DKMT_MOVE_RECT }
#Import "..\..\..\Win32\Foundation\RECT.ahk" { RECT }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_PRESENT_RGNS {
    #StructPack 8

    DirtyRectCount : UInt32

    pDirtyRects : RECT.Ptr

    MoveRectCount : UInt32

    pMoveRects : D3DKMT_MOVE_RECT.Ptr

}
