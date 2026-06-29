#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains more detailed information about an audio logotype.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_logotype_audio_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_LOGOTYPE_AUDIO_INFO {
    #StructPack 8

    /**
     * The size, in octets, of the audio.
     */
    dwFileSize : UInt32

    /**
     * The length of play time, in milliseconds, of the audio.
     */
    dwPlayTime : UInt32

    dwChannels : UInt32

    /**
     * The sample rate of the audio, in samples per second. This member is optional and may be zero.
     */
    dwSampleRate : UInt32

    /**
     * The address of a null-terminated IA5 string that contains the RFC 3066 language identifier that specifies the language of the audio. This member is optional and may be <b>NULL</b>.
     */
    pwszLanguage : PWSTR

}
