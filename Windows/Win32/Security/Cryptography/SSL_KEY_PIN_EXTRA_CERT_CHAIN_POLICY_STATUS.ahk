#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class SSL_KEY_PIN_EXTRA_CERT_CHAIN_POLICY_STATUS extends Win32Struct
{
    static sizeof => 1032

    static packingSize => 4

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    lError {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {String}
     */
    wszErrorText {
        get => StrGet(this.ptr + 8, 511, "UTF-16")
        set => StrPut(value, this.ptr + 8, 511, "UTF-16")
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 1032
    }
}
