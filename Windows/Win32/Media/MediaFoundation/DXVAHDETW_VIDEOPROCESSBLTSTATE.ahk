#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DXVAHD_BLT_STATE.ahk" { DXVAHD_BLT_STATE }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVAHDETW_VIDEOPROCESSBLTSTATE {
    #StructPack 8

    pObject : Int64

    State : DXVAHD_BLT_STATE

    DataSize : UInt32

    SetState : BOOL

}
