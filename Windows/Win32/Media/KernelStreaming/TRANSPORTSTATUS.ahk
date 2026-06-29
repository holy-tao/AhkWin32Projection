#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct TRANSPORTSTATUS {
    #StructPack 4

    Mode : Int32

    LastError : Int32

    RecordInhibit : Int32

    ServoLock : Int32

    MediaPresent : Int32

    MediaLength : Int32

    MediaSize : Int32

    MediaTrackCount : Int32

    MediaTrackLength : Int32

    MediaTrackSide : Int32

    MediaType : Int32

    LinkMode : Int32

    NotifyOn : Int32

}
