#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_LOGOTYPE_IMAGE.ahk" { CERT_LOGOTYPE_IMAGE }
#Import ".\CERT_LOGOTYPE_AUDIO.ahk" { CERT_LOGOTYPE_AUDIO }

/**
 * Contains logotype data.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_logotype_data
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_LOGOTYPE_DATA {
    #StructPack 8

    /**
     * The number of elements in the <b>rgLogotypeImage</b> array.
     */
    cLogotypeImage : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_logotype_image">CERT_LOGOTYPE_IMAGE</a> structures that contain the logotype images. The <b>cLogotypeImage</b> member contains the number of elements in this array.
     */
    rgLogotypeImage : CERT_LOGOTYPE_IMAGE.Ptr

    /**
     * The number of elements in the <b>rgLogotypeAudio</b> array.
     */
    cLogotypeAudio : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_logotype_audio">CERT_LOGOTYPE_AUDIO</a> structures that contain the logotype audio clips. The <b>cLogotypeAudio</b> member contains the number of elements in this array.
     */
    rgLogotypeAudio : CERT_LOGOTYPE_AUDIO.Ptr

}
