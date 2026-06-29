#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXVAHD_STREAM_STATE.ahk" { DXVAHD_STREAM_STATE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVAHDETW_VIDEOPROCESSSTREAMSTATE {
    #StructPack 8

    pObject : Int64

    StreamNumber : UInt32

    State : DXVAHD_STREAM_STATE

    DataSize : UInt32

    SetState : BOOL

}
