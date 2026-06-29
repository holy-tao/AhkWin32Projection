#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct DEVCAPS {
    #StructPack 4

    CanRecord : Int32

    CanRecordStrobe : Int32

    HasAudio : Int32

    HasVideo : Int32

    UsesFiles : Int32

    CanSave : Int32

    DeviceType : Int32

    TCRead : Int32

    TCWrite : Int32

    CTLRead : Int32

    IndexRead : Int32

    Preroll : Int32

    Postroll : Int32

    SyncAcc : Int32

    NormRate : Int32

    CanPreview : Int32

    CanMonitorSrc : Int32

    CanTest : Int32

    VideoIn : Int32

    AudioIn : Int32

    Calibrate : Int32

    SeekType : Int32

    SimulatedHardware : Int32

}
