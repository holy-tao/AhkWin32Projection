#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk

/**
 * Contains information on physical certificate stores.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_physical_store_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_PHYSICAL_STORE_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a string that names a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate store</a> provider type. This string is passed in a system call to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certopenstore">CertOpenStore</a> and determines the provider type of a certificate store to be opened. For the names of predefined certificate store types, see 
     * <b>CertOpenStore</b>. 
     * 
     * 
     * 
     * 
     * In addition to predefined certificate store provider types, new store provider types can be installed and registered with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptinstalloidfunctionaddress">CryptInstallOIDFunctionAddress</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptregisteroidfunction">CryptRegisterOIDFunction</a>. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/extending-certopenstore-functionality">CertOpenStore</a>.
     * @type {Pointer<PSTR>}
     */
    pszOpenStoreProvider {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * This member is applicable only when CERT_STORE_PROV_MSG, CERT_STORE_PROV_PKCS7, or CERT_STORE_PROV_FILENAME is passed in <i>lpszStoreProvider</i>. Otherwise, this member is not used. 
     * 
     * 
     * 
     * 
     * It is always acceptable to specify both the certificate and <a href="https://docs.microsoft.com/windows/desktop/SecGloss/m-gly">message encoding types</a> by combining them with a bitwise-<b>OR</b> operation as shown in the following example:
     * 
     * X509_ASN_ENCODING | PKCS_7_ASN_ENCODING Currently defined encoding types are:
     * 
     * <ul>
     * <li>X509_ASN_ENCODING</li>
     * <li>PKCS_7_ASN_ENCODING</li>
     * </ul>
     * @type {Integer}
     */
    dwOpenEncodingType {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * If a system store is opened with the SERVICES or USERS store location, the <b>dwOpenFlags</b> store location is set to CERT_SYSTEM_STORE_USERS or CERT_SYSTEM_STORE_SERVICES.
     * @type {Integer}
     */
    dwOpenFlags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> that contains data to be passed to the <i>pvPara</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certopenstore">CertOpenStore</a> function. The data type depends on the provider specified. For detailed information about the type and content to be passed, see descriptions of available providers in 
     * <b>CertOpenStore</b>.
     * @type {CRYPT_INTEGER_BLOB}
     */
    OpenParameters{
        get {
            if(!this.HasProp("__OpenParameters"))
                this.__OpenParameters := CRYPT_INTEGER_BLOB(this.ptr + 24)
            return this.__OpenParameters
        }
    }

    /**
     * The following <b>dwFlags</b> values for CERT_PHYSICAL_STORE_INFO are defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_PHYSICAL_STORE_ADD_ENABLE_FLAG"></a><a id="cert_physical_store_add_enable_flag"></a><dl>
     * <dt><b>CERT_PHYSICAL_STORE_ADD_ENABLE_FLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enables addition to a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">context</a> to the store.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_PHYSICAL_STORE_OPEN_DISABLE_FLAG"></a><a id="cert_physical_store_open_disable_flag"></a><dl>
     * <dt><b>CERT_PHYSICAL_STORE_OPEN_DISABLE_FLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Set by 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certregisterphysicalstore">CertRegisterPhysicalStore</a> function. By default, all system stores located in the registry have an implicit SystemRegistry physical store that is opened. To disable the opening of this store, the SystemRegistry physical store that corresponds to the System store must be registered by setting CERT_PHYSICAL_STORE_OPEN_DISABLE_FLAG or by registering a physical store named ".Default" with 
     * <b>CertRegisterPhysicalStore</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_PHYSICAL_STORE_REMOTE_OPEN_DISABLE_FLAG"></a><a id="cert_physical_store_remote_open_disable_flag"></a><dl>
     * <dt><b>CERT_PHYSICAL_STORE_REMOTE_OPEN_DISABLE_FLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disables remote opening of the physical store.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_PHYSICAL_STORE_INSERT_COMPUTER_NAME_ENABLE_FLAG"></a><a id="cert_physical_store_insert_computer_name_enable_flag"></a><dl>
     * <dt><b>CERT_PHYSICAL_STORE_INSERT_COMPUTER_NAME_ENABLE_FLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Places the string \\ComputerName in front of other provider types.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_SYSTEM_STORE_RELOCATE_FLAG"></a><a id="cert_system_store_relocate_flag"></a><dl>
     * <dt><b>CERT_SYSTEM_STORE_RELOCATE_FLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enables <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certopenstore">CertOpenStore</a> to open a store relative to a user-specified HKEY instead of one of the predefined HKEY constants. For example, HKEY_CURRENT_USER can be replaced with a user-specified HKEY. When CERT_SYSTEM_STORE_RELOCATE_FLAG is set, the <i>pvPara</i> parameter passed to <b>CertOpenStore</b> points to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_system_store_relocate_para">CERT_SYSTEM_STORE_RELOCATE_PARA</a> structure instead of pointing to the store name as a null-terminated <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">Unicode</a> or <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">ASCII</a> string.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * When a system store is opened, its physical stores are ordered according to their <b>dwPriority</b> settings. A higher <b>dwPriority</b> indicates higher priority. The <b>dwPriority</b> member is passed to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certaddstoretocollection">CertAddStoreToCollection</a>.
     * @type {Integer}
     */
    dwPriority {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 48
    }
}
