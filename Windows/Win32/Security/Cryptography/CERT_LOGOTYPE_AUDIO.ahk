#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_LOGOTYPE_AUDIO_INFO.ahk" { CERT_LOGOTYPE_AUDIO_INFO }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CERT_LOGOTYPE_DETAILS.ahk" { CERT_LOGOTYPE_DETAILS }
#Import ".\CERT_HASHED_URL.ahk" { CERT_HASHED_URL }

/**
 * Contains information about an audio logotype.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_logotype_audio
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_LOGOTYPE_AUDIO {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_logotype_details">CERT_LOGOTYPE_DETAILS</a> structure that contains additional information about the audio data.
     */
    LogotypeDetails : CERT_LOGOTYPE_DETAILS

    /**
     * The address of a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_logotype_audio_info">CERT_LOGOTYPE_AUDIO_INFO</a> structure that contains the audio information.
     */
    pLogotypeAudioInfo : CERT_LOGOTYPE_AUDIO_INFO.Ptr

}
