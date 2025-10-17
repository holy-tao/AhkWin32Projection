#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * Provides information about a signer or countersigner.
 * @see https://docs.microsoft.com/windows/win32/api//wintrust/ns-wintrust-crypt_provider_sgnr
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class CRYPT_PROVIDER_SGNR extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The current time, or the time stamp.
     * @type {FILETIME}
     */
    sftVerifyAsOf{
        get {
            if(!this.HasProp("__sftVerifyAsOf"))
                this.__sftVerifyAsOf := FILETIME(8, this)
            return this.__sftVerifyAsOf
        }
    }

    /**
     * Number of elements in the <b>pasCertChain</b> array.
     * @type {Integer}
     */
    csCertChain {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_provider_cert">CRYPT_PROVIDER_CERT</a> structures.
     * @type {Pointer<CRYPT_PROVIDER_CERT>}
     */
    pasCertChain {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Signer type, if known by the policy. This value is zero, if the signer type is unknown, or the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SGNR_TYPE_TIMESTAMP"></a><a id="sgnr_type_timestamp"></a><dl>
     * <dt><b>SGNR_TYPE_TIMESTAMP</b></dt>
     * <dt>     0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Time stamp signer.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwSignerType {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_signer_info">CMSG_SIGNER_INFO</a> structure.
     * @type {Pointer<CMSG_SIGNER_INFO>}
     */
    psSigner {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Error value, if any, while building or verifying the signer.
     * @type {Integer}
     */
    dwError {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Number of elements in the <b>pasCounterSigners</b>  array.
     * @type {Integer}
     */
    csCounterSigners {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * A pointer to an array of <b>CRYPT_PROVIDER_SGNR</b> structures that represent the countersigners.
     * @type {Pointer<CRYPT_PROVIDER_SGNR>}
     */
    pasCounterSigners {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_chain_context">CERT_CHAIN_CONTEXT</a> structure.
     * @type {Pointer<CERT_CHAIN_CONTEXT>}
     */
    pChainContext {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
