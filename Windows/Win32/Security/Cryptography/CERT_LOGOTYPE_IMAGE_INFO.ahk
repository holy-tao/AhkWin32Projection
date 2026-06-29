#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_LOGOTYPE_CHOICE.ahk" { CERT_LOGOTYPE_CHOICE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CERT_LOGOTYPE_IMAGE_INFO_TYPE.ahk" { CERT_LOGOTYPE_IMAGE_INFO_TYPE }

/**
 * Contains more detailed information about an image logotype.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_logotype_image_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_LOGOTYPE_IMAGE_INFO {
    #StructPack 8

    dwLogotypeImageInfoChoice : CERT_LOGOTYPE_IMAGE_INFO_TYPE

    /**
     * The size, in octets, of the image.
     */
    dwFileSize : UInt32

    /**
     * The horizontal size, in pixels, of the image.
     */
    dwXSize : UInt32

    /**
     * The vertical size, in pixels, of the image.
     */
    dwYSize : UInt32

    dwLogotypeImageResolutionChoice : CERT_LOGOTYPE_CHOICE

    dwNumBits : UInt32

    /**
     * The address of a null-terminated IA5 string that contains the RFC 3066 language identifier that specifies the language of the image. This member is optional and may be <b>NULL</b>.
     */
    pwszLanguage : PWSTR

    static __New() {
        DefineProp(this.Prototype, 'dwTableSize', { type: UInt32, offset: 20 })
        this.DeleteProp("__New")
    }
}
