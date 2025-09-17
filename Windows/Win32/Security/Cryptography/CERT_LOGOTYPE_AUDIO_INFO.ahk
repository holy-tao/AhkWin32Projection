#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains more detailed information about an audio logotype.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_logotype_audio_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_LOGOTYPE_AUDIO_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The size, in octets, of the audio.
     * @type {Integer}
     */
    dwFileSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The length of play time, in milliseconds, of the audio.
     * @type {Integer}
     */
    dwPlayTime {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * 
     * @type {Integer}
     */
    dwChannels {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The sample rate of the audio, in samples per second. This member is optional and may be zero.
     * @type {Integer}
     */
    dwSampleRate {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The address of a null-terminated IA5 string that contains the RFC 3066 language identifier that specifies the language of the audio. This member is optional and may be <b>NULL</b>.
     * @type {Pointer<Char>}
     */
    pwszLanguage {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
