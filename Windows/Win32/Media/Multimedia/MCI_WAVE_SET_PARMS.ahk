#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MCI\_WAVE\_SET\_PARMS structure contains information for the MCI\_SET command for waveform-audio devices.
 * @remarks
 * When assigning data to the members of this structure, set the corresponding flags in the *fdwCommand* parameter of the [**mciSendCommand**](/previous-versions//dd757160(v=vs.85)) function to validate the members.
 * @see https://learn.microsoft.com/windows/win32/Multimedia/mci-wave-set-parms
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class MCI_WAVE_SET_PARMS extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The low-order word specifies a window handle used for the MCI\_NOTIFY flag.
     * @type {Pointer}
     */
    dwCallback {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Device's time format.
     * @type {Integer}
     */
    dwTimeFormat {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Channel number for audio output. Typically used when turning a channel on or off.
     * @type {Integer}
     */
    dwAudio {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Audio input channel.
     * @type {Integer}
     */
    wInput {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Output device to use. For example, this value could be 2 if a system had two installed sound cards.
     * @type {Integer}
     */
    wOutput {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Format of the waveform-audio data, such as WAVE\_FORMAT\_PCM. Possible values are defined in Mmreg.h.
     * @type {Integer}
     */
    wFormatTag {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    wReserved2 {
        get => NumGet(this, 26, "ushort")
        set => NumPut("ushort", value, this, 26)
    }

    /**
     * Mono (1) or stereo (2).
     * @type {Integer}
     */
    nChannels {
        get => NumGet(this, 28, "ushort")
        set => NumPut("ushort", value, this, 28)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    wReserved3 {
        get => NumGet(this, 30, "ushort")
        set => NumPut("ushort", value, this, 30)
    }

    /**
     * Samples per second.
     * @type {Integer}
     */
    nSamplesPerSec {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Sample rate in bytes per second.
     * @type {Integer}
     */
    nAvgBytesPerSec {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Block alignment of the data.
     * @type {Integer}
     */
    nBlockAlign {
        get => NumGet(this, 40, "ushort")
        set => NumPut("ushort", value, this, 40)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    wReserved4 {
        get => NumGet(this, 42, "ushort")
        set => NumPut("ushort", value, this, 42)
    }

    /**
     * Bits per sample.
     * @type {Integer}
     */
    wBitsPerSample {
        get => NumGet(this, 44, "ushort")
        set => NumPut("ushort", value, this, 44)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    wReserved5 {
        get => NumGet(this, 46, "ushort")
        set => NumPut("ushort", value, this, 46)
    }
}
