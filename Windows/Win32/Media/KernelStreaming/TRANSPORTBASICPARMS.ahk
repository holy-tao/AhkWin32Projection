#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class TRANSPORTBASICPARMS extends Win32Struct
{
    static sizeof => 232

    static packingSize => 4

    /**
     * @type {Integer}
     */
    TimeFormat {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    TimeReference {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Superimpose {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    EndStopAction {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    RecordFormat {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    StepFrames {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    SetpField {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    Preroll {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    RecPreroll {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    Postroll {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    EditDelay {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    PlayTCDelay {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    RecTCDelay {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    EditField {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    FrameServo {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    ColorFrameServo {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    ServoRef {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    WarnGenlock {
        get => NumGet(this, 68, "int")
        set => NumPut("int", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    SetTracking {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }

    /**
     * @type {Array<SByte>}
     */
    VolumeName{
        get {
            if(!this.HasProp("__VolumeNameProxyArray"))
                this.__VolumeNameProxyArray := Win32FixedArray(this.ptr + 76, 1, Primitive, "char")
            return this.__VolumeNameProxyArray
        }
    }

    /**
     * @type {Array<Int32>}
     */
    Ballistic{
        get {
            if(!this.HasProp("__BallisticProxyArray"))
                this.__BallisticProxyArray := Win32FixedArray(this.ptr + 116, 4, Primitive, "int")
            return this.__BallisticProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    Speed {
        get => NumGet(this, 196, "int")
        set => NumPut("int", value, this, 196)
    }

    /**
     * @type {Integer}
     */
    CounterFormat {
        get => NumGet(this, 200, "int")
        set => NumPut("int", value, this, 200)
    }

    /**
     * @type {Integer}
     */
    TunerChannel {
        get => NumGet(this, 204, "int")
        set => NumPut("int", value, this, 204)
    }

    /**
     * @type {Integer}
     */
    TunerNumber {
        get => NumGet(this, 208, "int")
        set => NumPut("int", value, this, 208)
    }

    /**
     * @type {Integer}
     */
    TimerEvent {
        get => NumGet(this, 212, "int")
        set => NumPut("int", value, this, 212)
    }

    /**
     * @type {Integer}
     */
    TimerStartDay {
        get => NumGet(this, 216, "int")
        set => NumPut("int", value, this, 216)
    }

    /**
     * @type {Integer}
     */
    TimerStartTime {
        get => NumGet(this, 220, "int")
        set => NumPut("int", value, this, 220)
    }

    /**
     * @type {Integer}
     */
    TimerStopDay {
        get => NumGet(this, 224, "int")
        set => NumPut("int", value, this, 224)
    }

    /**
     * @type {Integer}
     */
    TimerStopTime {
        get => NumGet(this, 228, "int")
        set => NumPut("int", value, this, 228)
    }
}
