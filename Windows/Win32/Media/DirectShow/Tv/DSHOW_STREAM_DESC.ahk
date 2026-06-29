#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct DSHOW_STREAM_DESC {
    #StructPack 4

    VersionNo : UInt32

    StreamId : UInt32

    Default : BOOL

    Creation : BOOL

    Reserved : UInt32

}
