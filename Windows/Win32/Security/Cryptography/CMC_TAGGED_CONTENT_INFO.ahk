#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk

/**
 * Used in the CMC_DATA_INFO and CMC_RESPONSE_INFO structures. (CMC_TAGGED_CONTENT_INFO)
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmc_tagged_content_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CMC_TAGGED_CONTENT_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * <b>DWORD</b> identifying the tagged other message.
     * @type {Integer}
     */
    dwBodyPartID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DER_BLOB</a> structure that contains the encoded content information.
     * @type {CRYPT_INTEGER_BLOB}
     */
    EncodedContentInfo{
        get {
            if(!this.HasProp("__EncodedContentInfo"))
                this.__EncodedContentInfo := CRYPT_INTEGER_BLOB(8, this)
            return this.__EncodedContentInfo
        }
    }
}
