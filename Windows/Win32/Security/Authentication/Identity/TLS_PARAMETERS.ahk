#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Indicates TLS parameter restrictions.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//schannel/ns-schannel-tls_parameters
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class TLS_PARAMETERS extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The number of ALPN Ids in rgstrAlpnIds. 
     * 
     * Set to 0 if the following parameter restrictions apply regardless of the negotiated application protocol. It is an error to specify more than SCH_CRED_MAX_SUPPORTED_ALPN_IDS.
     * @type {Integer}
     */
    cAlpnIds {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of ALPN IDs that the following parameters apply to. 
     * 
     * Set to NULL if parameter restrictions apply regardless of the negotiated application protocol.
     * @type {Pointer<LSA_UNICODE_STRING>}
     */
    rgstrAlpnIds {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The bit string that represents the disabled protocols. 
     * 
     * Set to 0 to use system defaults. Schannel protocol flags are [documented here.](./ns-schannel-schannel_cred.md)
     * @type {Integer}
     */
    grbitDisabledProtocols {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The count of entries in the pDisabledCrypto array. It is an error to specify more than SCH_CRED_MAX_SUPPORTED_CRYPTO_SETTINGS.
     * @type {Integer}
     */
    cDisabledCrypto {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * An array of pointers to the CRYPTO_SETTINGS structures that express disabled cryptographic settings.
     * @type {Pointer<CRYPTO_SETTINGS>}
     */
    pDisabledCrypto {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * (*optional*) The flags to pass. 
     * 
     * When TLS_PARAMS_OPTIONAL is set, TLS_PARAMETERS will only be honored if they do not cause the server to terminate the handshake.
     * 
     * Otherwise, schannel may fail TLS handshakes in order to honor the TLS_PARAMETERS restrictions.
     * 
     * > [!NOTE]
     * > TLS_PARAMS_OPTIONAL is valid for server applications only. Must be zero otherwise.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
