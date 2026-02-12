#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_KEY_PROV_INFO.ahk

/**
 * Contains an array of simple certificate chains and a trust status structure that indicates summary validity data on all of the connected simple chains.
 * @remarks
 * When a <b>CERT_CHAIN_CONTEXT</b> is built, the first simple chain begins with an end certificate and ends with a self-signed certificate. If that self-signed certificate is not a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">root</a> or otherwise trusted certificate, an attempt is made to build a new chain. <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">CTLs</a> are used to create the new chain beginning with the self-signed certificate from the original chain as the end certificate of the new chain. This process continues building additional simple chains until the first self-signed certificate is a trusted certificate or until an additional simple chain cannot be built.
 * @see https://learn.microsoft.com/windows/win32/api//content/wincrypt/ns-wincrypt-cert_chain_context
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_CHAIN extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cCerts {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<CRYPT_INTEGER_BLOB>}
     */
    certs {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {CRYPT_KEY_PROV_INFO}
     */
    keyLocatorInfo{
        get {
            if(!this.HasProp("__keyLocatorInfo"))
                this.__keyLocatorInfo := CRYPT_KEY_PROV_INFO(16, this)
            return this.__keyLocatorInfo
        }
    }
}
