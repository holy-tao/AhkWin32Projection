#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies values for audio constriction.
 * @remarks
 * Values defined by the <b>MFAudioConstriction</b> enumeration matches the <b>EAudioConstriction</b> enumeration defined <b>audioenginebaseapo.h</b>.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mfaudioconstriction
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFAudioConstriction {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Audio is not constricted.
     * @type {Integer (Int32)}
     */
    static MFaudioConstrictionOff => 0

    /**
     * Audio is down sampled to 48 kHz/16-bit.
     * @type {Integer (Int32)}
     */
    static MFaudioConstriction48_16 => 1

    /**
     * Audio is down sampled to 44 kHz/16-bit.
     * @type {Integer (Int32)}
     */
    static MFaudioConstriction44_16 => 2

    /**
     * Audio is down sampled to 14hKz/16-bit.
     * @type {Integer (Int32)}
     */
    static MFaudioConstriction14_14 => 3

    /**
     * Audio is muted.
     * @type {Integer (Int32)}
     */
    static MFaudioConstrictionMute => 4
}
