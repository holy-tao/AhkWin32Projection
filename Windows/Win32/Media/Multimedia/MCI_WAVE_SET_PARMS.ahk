#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MCI\_WAVE\_SET\_PARMS structure contains information for the MCI\_SET command for waveform-audio devices.
 * @remarks
 * When assigning data to the members of this structure, set the corresponding flags in the *fdwCommand* parameter of the [**mciSendCommand**](/previous-versions//dd757160(v=vs.85)) function to validate the members.
 * @see https://learn.microsoft.com/windows/win32/Multimedia/mci-wave-set-parms
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct MCI_WAVE_SET_PARMS {
    #StructPack 8

    /**
     * The low-order word specifies a window handle used for the MCI\_NOTIFY flag.
     */
    dwCallback : IntPtr

    /**
     * Device's time format.
     */
    dwTimeFormat : UInt32

    /**
     * Channel number for audio output. Typically used when turning a channel on or off.
     */
    dwAudio : UInt32

    /**
     * Audio input channel.
     */
    wInput : UInt32

    /**
     * Output device to use. For example, this value could be 2 if a system had two installed sound cards.
     */
    wOutput : UInt32

    /**
     * Format of the waveform-audio data, such as WAVE\_FORMAT\_PCM. Possible values are defined in Mmreg.h.
     */
    wFormatTag : UInt16

    /**
     * Reserved.
     */
    wReserved2 : UInt16

    /**
     * Mono (1) or stereo (2).
     */
    nChannels : UInt16

    /**
     * Reserved.
     */
    wReserved3 : UInt16

    /**
     * Samples per second.
     */
    nSamplesPerSec : UInt32

    /**
     * Sample rate in bytes per second.
     */
    nAvgBytesPerSec : UInt32

    /**
     * Block alignment of the data.
     */
    nBlockAlign : UInt16

    /**
     * Reserved.
     */
    wReserved4 : UInt16

    /**
     * Bits per sample.
     */
    wBitsPerSample : UInt16

    /**
     * Reserved.
     */
    wReserved5 : UInt16

}
