#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The TimedLevel structure holds data returned from the spectrum filter.
 * @remarks
 * 
  * The array dimension <b>SA_BUFFER_SIZE</b> is currently 1024.
  * 
  * The first dimension of each array corresponds to the channel: 0 is a monaural signal or the left channel of a stereo signal, and 1 is the right channel of a stereo signal. If the signal is monaural, the values in the array that would correspond to the right channel are undefined.
  * 
  * The second dimension contains the sampled levels. The frequency data ranges from 0 to 255. The waveform data represents -128 to 127 but is stored as 0 to 255, so subtract 128 to get the correct value.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//effects/ns-effects-timedlevel
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class TimedLevel extends Win32Struct
{
    static sizeof => 4112

    static packingSize => 8

    /**
     * A stereo snapshot of the frequency spectrum of the audio data at a time specified by the Plug-in Manager. It can be used for frequency spectrum effects such as real-time analyzers. The frequency value of the first cell is 20 Hz, and the frequency value of the last cell is 22050 Hz.
     * @type {Array<Byte>}
     */
    frequency{
        get {
            if(!this.HasProp("__frequencyProxyArray"))
                this.__frequencyProxyArray := Win32FixedArray(this.ptr + 0, 2048, Primitive, "char")
            return this.__frequencyProxyArray
        }
    }

    /**
     * A stereo snapshot of the power value of the audio data at a time specified by the Plug-in Manager as the first element; the next 1024 stereo power values fill out the rest of the array. It can be used for oscilloscope-type effects.
     * @type {Array<Byte>}
     */
    waveform{
        get {
            if(!this.HasProp("__waveformProxyArray"))
                this.__waveformProxyArray := Win32FixedArray(this.ptr + 2048, 2048, Primitive, "char")
            return this.__waveformProxyArray
        }
    }

    /**
     * One member of the <a href="https://docs.microsoft.com/windows/desktop/api/effects/ne-effects-playerstate">PlayerState</a> enumeration type.
     * @type {Integer}
     */
    state {
        get => NumGet(this, 4096, "int")
        set => NumPut("int", value, this, 4096)
    }

    /**
     * The time the snapshot took place, in a 64-bit integer. The time value is provided in 100-nanosecond units.
     * @type {Integer}
     */
    timeStamp {
        get => NumGet(this, 4104, "int64")
        set => NumPut("int64", value, this, 4104)
    }
}
