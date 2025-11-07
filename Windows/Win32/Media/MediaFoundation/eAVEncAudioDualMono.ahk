#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies whether 2-channel audio is encoded as stereo or dual mono. This enumeration is used with the AVEncAudioDualMono property.
 * @remarks
 * 
 * In dual mono encoding, each channel is encoded separately. In stereo encoding, both channels are encoded together.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//codecapi/ne-codecapi-eavencaudiodualmono
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVEncAudioDualMono{

    /**
     * Use the setting specified in the input media type.
     * @type {Integer (Int32)}
     */
    static eAVEncAudioDualMono_SameAsInput => 0

    /**
     * Do not use dual mono encoding.
     * @type {Integer (Int32)}
     */
    static eAVEncAudioDualMono_Off => 1

    /**
     * Use dual mono encoding.
     * @type {Integer (Int32)}
     */
    static eAVEncAudioDualMono_On => 2
}
