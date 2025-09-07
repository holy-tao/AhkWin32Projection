#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CERT_LOGOTYPE_DETAILS.ahk

/**
 * Contains information about an image logotype.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_logotype_image
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_LOGOTYPE_IMAGE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_logotype_details">CERT_LOGOTYPE_DETAILS</a> structure that contains additional information about the image.
     * @type {CERT_LOGOTYPE_DETAILS}
     */
    LogotypeDetails{
        get {
            if(!this.HasProp("__LogotypeDetails"))
                this.__LogotypeDetails := CERT_LOGOTYPE_DETAILS(this.ptr + 0)
            return this.__LogotypeDetails
        }
    }

    /**
     * The address of a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_logotype_image_info">CERT_LOGOTYPE_IMAGE_INFO</a> structure that contains the image information.
     * @type {Pointer<CERT_LOGOTYPE_IMAGE_INFO>}
     */
    pLogotypeImageInfo {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
