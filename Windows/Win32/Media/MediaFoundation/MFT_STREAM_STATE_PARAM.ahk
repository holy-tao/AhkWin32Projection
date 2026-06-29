#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MF_STREAM_STATE.ahk" { MF_STREAM_STATE }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFT_STREAM_STATE_PARAM {
    #StructPack 4

    StreamId : UInt32

    State : MF_STREAM_STATE

}
