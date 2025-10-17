#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSAUDIO_POSITION.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSAUDIO_POSITIONEX extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    TimerFrequency {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    TimeStamp1 {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * @type {KSAUDIO_POSITION}
     */
    Position{
        get {
            if(!this.HasProp("__Position"))
                this.__Position := KSAUDIO_POSITION(16, this)
            return this.__Position
        }
    }

    /**
     * @type {Integer}
     */
    TimeStamp2 {
        get => NumGet(this, 32, "int64")
        set => NumPut("int64", value, this, 32)
    }
}
