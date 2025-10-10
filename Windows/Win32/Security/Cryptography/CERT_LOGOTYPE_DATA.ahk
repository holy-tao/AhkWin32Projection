#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains logotype data.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_logotype_data
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_LOGOTYPE_DATA extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The number of elements in the <b>rgLogotypeImage</b> array.
     * @type {Integer}
     */
    cLogotypeImage {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_logotype_image">CERT_LOGOTYPE_IMAGE</a> structures that contain the logotype images. The <b>cLogotypeImage</b> member contains the number of elements in this array.
     * @type {Pointer<CERT_LOGOTYPE_IMAGE>}
     */
    rgLogotypeImage {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The number of elements in the <b>rgLogotypeAudio</b> array.
     * @type {Integer}
     */
    cLogotypeAudio {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_logotype_audio">CERT_LOGOTYPE_AUDIO</a> structures that contain the logotype audio clips. The <b>cLogotypeAudio</b> member contains the number of elements in this array.
     * @type {Pointer<CERT_LOGOTYPE_AUDIO>}
     */
    rgLogotypeAudio {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
