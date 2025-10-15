#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HCERTSTOREPROV.ahk

/**
 * Contains information returned by the installed CertDllOpenStoreProv function when a store is opened by using the CertOpenStore function.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_store_prov_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_STORE_PROV_INFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Contains the size, in bytes, of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Contains the number of elements in the <b>rgpvStoreProvFunc</b> array. This count must include any <b>NULL</b> values that are used in indexes prior to the last callback function implemented. For example, if only one callback function is implemented, but it is at index 2 (<b>CERT_STORE_PROV_WRITE_CERT_FUNC</b>), with <b>NULL</b> for indexes 0 and 1, then the number 3 should be passed for this parameter.
     * @type {Integer}
     */
    cStoreProvFunc {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * An array of pointers to the callback functions that are implemented by the provider. This array is indexed by the values given in the following table, and they must be in the order shown. The associated callback function is shown as well. All callback functions that are not implemented must be set to <b>NULL</b>. The array does not have to contain all callback function indexes, it only needs to contain the highest callback function index implemented. For example, if only the <b>CERT_STORE_PROV_WRITE_CERT_FUNC</b> (2) callback function is implemented, the array only needs to contain three elements.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_STORE_PROV_CLOSE_FUNC"></a><a id="cert_store_prov_close_func"></a><dl>
     * <dt><b>CERT_STORE_PROV_CLOSE_FUNC</b></dt>
     * <dt>0 (0x0)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_cert_store_prov_close">CertStoreProvCloseCallback</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_STORE_PROV_READ_CERT_FUNC"></a><a id="cert_store_prov_read_cert_func"></a><dl>
     * <dt><b>CERT_STORE_PROV_READ_CERT_FUNC</b></dt>
     * <dt>1 (0x1)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_cert_store_prov_read_cert">CertStoreProvReadCertCallback</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_STORE_PROV_WRITE_CERT_FUNC"></a><a id="cert_store_prov_write_cert_func"></a><dl>
     * <dt><b>CERT_STORE_PROV_WRITE_CERT_FUNC</b></dt>
     * <dt>2 (0x2)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_cert_store_prov_write_cert">CertStoreProvWriteCertCallback</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_STORE_PROV_DELETE_CERT_FUNC"></a><a id="cert_store_prov_delete_cert_func"></a><dl>
     * <dt><b>CERT_STORE_PROV_DELETE_CERT_FUNC</b></dt>
     * <dt>3 (0x3)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_cert_store_prov_delete_cert">CertStoreProvDeleteCertCallback</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_STORE_PROV_SET_CERT_PROPERTY_FUNC"></a><a id="cert_store_prov_set_cert_property_func"></a><dl>
     * <dt><b>CERT_STORE_PROV_SET_CERT_PROPERTY_FUNC</b></dt>
     * <dt>4 (0x4)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_cert_store_prov_set_cert_property">CertStoreProvSetCertPropertyCallback</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_STORE_PROV_READ_CRL_FUNC"></a><a id="cert_store_prov_read_crl_func"></a><dl>
     * <dt><b>CERT_STORE_PROV_READ_CRL_FUNC</b></dt>
     * <dt>5 (0x5)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_cert_store_prov_read_crl">CertStoreProvReadCRLCallback</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_STORE_PROV_WRITE_CRL_FUNC"></a><a id="cert_store_prov_write_crl_func"></a><dl>
     * <dt><b>CERT_STORE_PROV_WRITE_CRL_FUNC</b></dt>
     * <dt>6 (0x6)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_cert_store_prov_write_crl">CertStoreProvWriteCRLCallback</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_STORE_PROV_DELETE_CRL_FUNC"></a><a id="cert_store_prov_delete_crl_func"></a><dl>
     * <dt><b>CERT_STORE_PROV_DELETE_CRL_FUNC</b></dt>
     * <dt>7 (0x7)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_cert_store_prov_delete_crl">CertStoreProvDeleteCRLCallback</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_STORE_PROV_SET_CRL_PROPERTY_FUNC"></a><a id="cert_store_prov_set_crl_property_func"></a><dl>
     * <dt><b>CERT_STORE_PROV_SET_CRL_PROPERTY_FUNC</b></dt>
     * <dt>8 (0x8)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_cert_store_prov_set_crl_property">CertStoreProvSetCRLPropertyCallback</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_STORE_PROV_READ_CTL_FUNC"></a><a id="cert_store_prov_read_ctl_func"></a><dl>
     * <dt><b>CERT_STORE_PROV_READ_CTL_FUNC</b></dt>
     * <dt>9 (0x9)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_cert_store_prov_read_ctl">CertStoreProvReadCTL</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_STORE_PROV_WRITE_CTL_FUNC"></a><a id="cert_store_prov_write_ctl_func"></a><dl>
     * <dt><b>CERT_STORE_PROV_WRITE_CTL_FUNC</b></dt>
     * <dt>10 (0xA)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_cert_store_prov_write_ctl">CertStoreProvWriteCTL</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_STORE_PROV_DELETE_CTL_FUNC"></a><a id="cert_store_prov_delete_ctl_func"></a><dl>
     * <dt><b>CERT_STORE_PROV_DELETE_CTL_FUNC</b></dt>
     * <dt>11 (0xB)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/certstoreprovdeletectl">CertStoreProvDeleteCTL</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_STORE_PROV_SET_CTL_PROPERTY_FUNC"></a><a id="cert_store_prov_set_ctl_property_func"></a><dl>
     * <dt><b>CERT_STORE_PROV_SET_CTL_PROPERTY_FUNC</b></dt>
     * <dt>12 (0xC)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_cert_store_prov_set_ctl_property">CertStoreProvSetCTLProperty</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_STORE_PROV_CONTROL_FUNC"></a><a id="cert_store_prov_control_func"></a><dl>
     * <dt><b>CERT_STORE_PROV_CONTROL_FUNC</b></dt>
     * <dt>13 (0xD)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_cert_store_prov_control">CertStoreProvControl</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_STORE_PROV_FIND_CERT_FUNC"></a><a id="cert_store_prov_find_cert_func"></a><dl>
     * <dt><b>CERT_STORE_PROV_FIND_CERT_FUNC</b></dt>
     * <dt>14 (0xE)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/certstoreprovfindcert">CertStoreProvFindCert</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_STORE_PROV_FREE_FIND_CERT_FUNC"></a><a id="cert_store_prov_free_find_cert_func"></a><dl>
     * <dt><b>CERT_STORE_PROV_FREE_FIND_CERT_FUNC</b></dt>
     * <dt>15 (0xF)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/certstoreprovfreefindcert">CertStoreProvFreeFindCert</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_STORE_PROV_GET_CERT_PROPERTY_FUNC"></a><a id="cert_store_prov_get_cert_property_func"></a><dl>
     * <dt><b>CERT_STORE_PROV_GET_CERT_PROPERTY_FUNC</b></dt>
     * <dt>16 (0x10)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/certstoreprovgetcertproperty">CertStoreProvGetCertProperty</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_STORE_PROV_FIND_CRL_FUNC"></a><a id="cert_store_prov_find_crl_func"></a><dl>
     * <dt><b>CERT_STORE_PROV_FIND_CRL_FUNC</b></dt>
     * <dt>17 (0x11)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/certstoreprovfindcrl">CertStoreProvFindCRL</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_STORE_PROV_FREE_FIND_CRL_FUNC"></a><a id="cert_store_prov_free_find_crl_func"></a><dl>
     * <dt><b>CERT_STORE_PROV_FREE_FIND_CRL_FUNC</b></dt>
     * <dt>18 (0x12)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/certstoreprovfreefindcrl">CertStoreProvFreeFindCRL</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_STORE_PROV_GET_CRL_PROPERTY_FUNC"></a><a id="cert_store_prov_get_crl_property_func"></a><dl>
     * <dt><b>CERT_STORE_PROV_GET_CRL_PROPERTY_FUNC</b></dt>
     * <dt>19 (0x13)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/certstoreprovgetcrlproperty">CertStoreProvGetCRLProperty</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_STORE_PROV_FIND_CTL_FUNC"></a><a id="cert_store_prov_find_ctl_func"></a><dl>
     * <dt><b>CERT_STORE_PROV_FIND_CTL_FUNC</b></dt>
     * <dt>20 (0x14)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/certstoreprovfindctl">CertStoreProvFindCTL</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_STORE_PROV_FREE_FIND_CTL_FUNC"></a><a id="cert_store_prov_free_find_ctl_func"></a><dl>
     * <dt><b>CERT_STORE_PROV_FREE_FIND_CTL_FUNC</b></dt>
     * <dt>21 (0x15)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/certstoreprovfreefindctl">CertStoreProvFreeFindCTL</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_STORE_PROV_GET_CTL_PROPERTY_FUNC"></a><a id="cert_store_prov_get_ctl_property_func"></a><dl>
     * <dt><b>CERT_STORE_PROV_GET_CTL_PROPERTY_FUNC</b></dt>
     * <dt>22 (0x16)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/certstoreprovgetctlproperty">CertStoreProvGetCTLProperty</a>
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Pointer<Void>}
     */
    rgpvStoreProvFunc {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A 32-bit, application-defined value that is the first parameter passed to all callbacks. An application can specify the contents of this member as desired. Typically, this is a pointer to data that is specific to the application, such as provider state information for each store opened.
     * @type {HCERTSTOREPROV}
     */
    hStoreProv{
        get {
            if(!this.HasProp("__hStoreProv"))
                this.__hStoreProv := HCERTSTOREPROV(this.ptr + 16)
            return this.__hStoreProv
        }
    }

    /**
     * 
     * @type {Integer}
     */
    dwStoreProvFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Contains the handle returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptgetoidfunctionaddress">CryptGetOIDFunctionAddress</a>. 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certclosestore">CertCloseStore</a> calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptfreeoidfunctionaddress">CryptFreeOIDFunctionAddress</a> to free a non-null <b>hStoreProvFuncAddr2</b>. This allows the callback to call one other installable function that will be freed when the store is closed.
     * @type {Pointer<Void>}
     */
    hStoreProvFuncAddr2 {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 40
    }
}
