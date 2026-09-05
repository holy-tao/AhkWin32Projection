#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether 2-channel audio is encoded as stereo or dual mono. This enumeration is used with the AVEncAudioDualMono property.
 * @remarks
 * In dual mono encoding, each channel is encoded separately. In stereo encoding, both channels are encoded together.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencaudiodualmono
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVEncAudioDualMono extends Win32Enum {

    /**
     * Use the setting specified in the input media type.
     * Native name: eAVEncAudioDualMono_SameAsInput
     * @type {Integer (Int32)}
     */
    static SameAsInput => 0

    /**
     * Do not use dual mono encoding.
     * Native name: eAVEncAudioDualMono_Off
     * @type {Integer (Int32)}
     */
    static Off => 1

    /**
     * Use dual mono encoding.
     * Native name: eAVEncAudioDualMono_On
     * @type {Integer (Int32)}
     */
    static On => 2
}
