#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies values for audio constriction.
 * @remarks
 * 
 * Values defined by the <b>MFAudioConstriction</b> enumeration matches the <b>EAudioConstriction</b> enumeration defined <b>audioenginebaseapo.h</b>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/ne-mfidl-mfaudioconstriction
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFAudioConstriction extends Win32Enum{

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
