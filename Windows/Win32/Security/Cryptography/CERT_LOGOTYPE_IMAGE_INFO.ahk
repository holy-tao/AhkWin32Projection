#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains more detailed information about an image logotype.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_logotype_image_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_LOGOTYPE_IMAGE_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    dwLogotypeImageInfoChoice {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size, in octets, of the image.
     * @type {Integer}
     */
    dwFileSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The horizontal size, in pixels, of the image.
     * @type {Integer}
     */
    dwXSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The vertical size, in pixels, of the image.
     * @type {Integer}
     */
    dwYSize {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * 
     * @type {Integer}
     */
    dwLogotypeImageResolutionChoice {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwNumBits {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    dwTableSize {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The address of a null-terminated IA5 string that contains the RFC 3066 language identifier that specifies the language of the image. This member is optional and may be <b>NULL</b>.
     * @type {Pointer<Char>}
     */
    pwszLanguage {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
