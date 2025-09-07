#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NCRYPT_EXPORTED_ISOLATED_KEY_HEADER.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class NCRYPT_EXPORTED_ISOLATED_KEY_ENVELOPE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {NCRYPT_EXPORTED_ISOLATED_KEY_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := NCRYPT_EXPORTED_ISOLATED_KEY_HEADER(this.ptr + 0)
            return this.__Header
        }
    }
}
