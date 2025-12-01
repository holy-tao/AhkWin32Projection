#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk

/**
 * The CRYPT_X942_OTHER_INFO structure contains additional key generation information.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_x942_other_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_X942_OTHER_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * OID of the content encryption algorithm.
     * @type {PSTR}
     */
    pszContentEncryptionObjId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Array of BYTES of length <b>CRYPT_X942_COUNTER_BYTE_LENGTH</b>. The value is stored in <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">little-endian</a> order.
     * @type {Array<Byte>}
     */
    rgbCounter{
        get {
            if(!this.HasProp("__rgbCounterProxyArray"))
                this.__rgbCounterProxyArray := Win32FixedArray(this.ptr + 8, 4, Primitive, "char")
            return this.__rgbCounterProxyArray
        }
    }

    /**
     * Array of BYTES of length <b>CRYPT_X942_KEY_LENGTH_BYTE_LENGTH</b>. The value is stored in little-endian order.
     * @type {Array<Byte>}
     */
    rgbKeyLength{
        get {
            if(!this.HasProp("__rgbKeyLengthProxyArray"))
                this.__rgbKeyLengthProxyArray := Win32FixedArray(this.ptr + 12, 4, Primitive, "char")
            return this.__rgbKeyLengthProxyArray
        }
    }

    /**
     * Optional <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> for additional information.
     * @type {CRYPT_INTEGER_BLOB}
     */
    PubInfo{
        get {
            if(!this.HasProp("__PubInfo"))
                this.__PubInfo := CRYPT_INTEGER_BLOB(16, this)
            return this.__PubInfo
        }
    }
}
