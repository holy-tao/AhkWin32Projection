#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct TRANSPORTBASICPARMS {
    #StructPack 4

    TimeFormat : Int32

    TimeReference : Int32

    Superimpose : Int32

    EndStopAction : Int32

    RecordFormat : Int32

    StepFrames : Int32

    SetpField : Int32

    Preroll : Int32

    RecPreroll : Int32

    Postroll : Int32

    EditDelay : Int32

    PlayTCDelay : Int32

    RecTCDelay : Int32

    EditField : Int32

    FrameServo : Int32

    ColorFrameServo : Int32

    ServoRef : Int32

    WarnGenlock : Int32

    SetTracking : Int32

    VolumeName : Int8[40]

    Ballistic : Int32[20]

    Speed : Int32

    CounterFormat : Int32

    TunerChannel : Int32

    TunerNumber : Int32

    TimerEvent : Int32

    TimerStartDay : Int32

    TimerStartTime : Int32

    TimerStopDay : Int32

    TimerStopTime : Int32

}
