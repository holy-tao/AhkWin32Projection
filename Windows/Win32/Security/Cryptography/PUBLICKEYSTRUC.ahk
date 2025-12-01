#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Indicates a key's BLOB type and the algorithm that the key uses.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-publickeystruc
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PUBLICKEYSTRUC extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Contains the key BLOB type.
     * 
     * 
     * The following are the predefined values for this member. <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">Cryptographic service providers</a> (CSPs) can use other type identifiers as needed.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KEYSTATEBLOB"></a><a id="keystateblob"></a><dl>
     * <dt><b>KEYSTATEBLOB</b></dt>
     * <dt>0xC</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The BLOB is a key state BLOB.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OPAQUEKEYBLOB"></a><a id="opaquekeyblob"></a><dl>
     * <dt><b>OPAQUEKEYBLOB</b></dt>
     * <dt>0x9</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The key is a session key.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PLAINTEXTKEYBLOB"></a><a id="plaintextkeyblob"></a><dl>
     * <dt><b>PLAINTEXTKEYBLOB</b></dt>
     * <dt>0x8</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The key is a session key.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PRIVATEKEYBLOB"></a><a id="privatekeyblob"></a><dl>
     * <dt><b>PRIVATEKEYBLOB</b></dt>
     * <dt>0x7</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The key is a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">public/private key pair</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PUBLICKEYBLOB"></a><a id="publickeyblob"></a><dl>
     * <dt><b>PUBLICKEYBLOB</b></dt>
     * <dt>0x6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The key is a public key.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PUBLICKEYBLOBEX"></a><a id="publickeyblobex"></a><dl>
     * <dt><b>PUBLICKEYBLOBEX</b></dt>
     * <dt>0xA</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The key is a public key.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SIMPLEBLOB"></a><a id="simpleblob"></a><dl>
     * <dt><b>SIMPLEBLOB</b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The key is a session key.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMMETRICWRAPKEYBLOB"></a><a id="symmetricwrapkeyblob"></a><dl>
     * <dt><b>SYMMETRICWRAPKEYBLOB</b></dt>
     * <dt>0xB</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The key is a symmetric key.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    bType {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Contains the version number of the key BLOB format. For example, if the BLOB is a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">Digital Signature Standard</a> (DSS) version 3 key, this member will contain 3. The minimum value for this member is defined by the <b>CUR_BLOB_VERSION</b> (2) identifier.
     * @type {Integer}
     */
    bVersion {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * This member is reserved for future use and must be set to zero.
     * @type {Integer}
     */
    reserved {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Contains one of the <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/alg-id">ALG_ID</a> values that identifies the algorithm of the key contained by the key BLOB.
     * 
     * Not all algorithm identifiers are valid with all BLOB types. For example, since an RC4 key is a session key, it cannot be exported into a PUBLICKEYBLOB.
     * 
     * PLAINTEXTBLOBs can be used with any algorithm or type of key combination supported by the CSP in use. Note that a 3DES key cannot be imported when the Microsoft Base Provider is in use.
     * @type {Integer}
     */
    aiKeyAlg {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
