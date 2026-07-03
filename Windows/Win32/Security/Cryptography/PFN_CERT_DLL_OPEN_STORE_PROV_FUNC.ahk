#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\CERT_OPEN_STORE_FLAGS.ahk" { CERT_OPEN_STORE_FLAGS }
#Import ".\CERT_QUERY_ENCODING_TYPE.ahk" { CERT_QUERY_ENCODING_TYPE }
#Import ".\CERT_STORE_PROV_INFO.ahk" { CERT_STORE_PROV_INFO }
#Import ".\HCERTSTORE.ahk" { HCERTSTORE }
#Import ".\HCRYPTPROV_LEGACY.ahk" { HCRYPTPROV_LEGACY }

/**
 * Implemented by a store-provider and is used to open a store.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nc-wincrypt-pfn_cert_dll_open_store_prov_func
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CERT_DLL_OPEN_STORE_PROV_FUNC {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CERT_DLL_OPEN_STORE_PROV_FUNC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PSTR} lpszStoreProvider A pointer to a null-terminated ANSI string that contains the store provider type. 
     * 
     * The following values  represent the predefined store types. The store provider type determines the contents of the <i>pvPara</i> parameter and the use and meaning of the high word of the <i>dwFlags</i> parameter. Additional store providers can be installed or registered by using 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptinstalloidfunctionaddress">CryptInstallOIDFunctionAddress</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptregisteroidfunction">CryptRegisterOIDFunction</a> function. For more information about adding store providers, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/extending-certopenstore-functionality">Extending CertOpenStore Functionality</a>.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Provider identifier</th>
     * <th>Description</th>
     * <th><i>pvPara</i> contents</th>
     * </tr>
     * <tr>
     * <td>
     * <b>CERT_STORE_PROV_MEMORY</b>
     * 
     * <b>sz_CERT_STORE_PROV_MEMORY</b>
     * 
     * </td>
     * <td>
     * Creates a certificate store in cached memory. No certificates, <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate revocation lists</a> (CRLs), or <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate trust lists</a> (CTLs) are initially loaded into the store. Typically used to create a temporary store.
     * 
     * Any addition of certificates, CRLs, or CTLs or changes in properties of certificates, CRLs, or CTLs in a memory store are not automatically saved. They can be saved to a file or to a memory <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a> by using <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certsavestore">CertSaveStore</a>.
     * 
     * </td>
     * <td>
     * Not used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>CERT_STORE_PROV_FILE</b>
     * 
     * </td>
     * <td>
     * Initializes the store with certificates, CRLs, and CTLs read from a specified open file. This provider expects the file to contain only a serialized store and not either PKCS #7 signed messages or a single encoded certificate.
     * 
     * The file pointer must be positioned at the beginning of the serialized store information. After the data in the serialized store has been loaded into the certificate store, the file pointer is positioned at the beginning of any data that can follow the serialized store data in the file. If CERT_FILE_STORE_COMMIT_ENABLE is set in <i>dwFlags</i>, the file handle is duplicated and the store is always committed as a serialized store. The file is not closed when the store is closed.
     * 
     * </td>
     * <td>
     * A pointer to the handle of a file opened with <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>CERT_STORE_PROV_FILENAME_A</b>
     * 
     * </td>
     * <td>
     * Initializes the store with certificates, CRLs, and CTLs from a file. The provider opens the file and first attempts to read the file as a serialized store, then as a PKCS #7 signed message, and finally as a single encoded certificate.
     * 
     * 
     * The <i>dwEncodingType</i> parameter must contain the encoding types to be used with both messages and certificates. If the file contains an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/x-gly">X.509</a> encoded certificate, the open operation fails with <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> and returns ERROR_ACCESS_DENIED.
     *          If the CERT_FILE_STORE_COMMIT_ENABLE flag is set in <i>dwFlags</i>, the <i>dwCreationDisposition</i> value passed to CreateFile is as follows:
     * 
     * <ul>
     * <li>If the CERT_STORE_CREATE_NEW_FLAG flag is set, 
     *          <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> uses CREATE_NEW.</li>
     * <li>If the CERT_STORE_OPEN_EXISTING_FLAG flag is set, <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> uses OPEN_EXISTING.</li>
     * <li>For all other settings of <i>dwFlags</i>, <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> uses OPEN_ALWAYS.</li>
     * </ul>
     * 
     * 
     * If <i>dwFlags</i> includes CERT_FILE_STORE_COMMIT_ENABLE, the file is committed as either a PKCS #7 or a serialized store depending on the file type opened. If the file was empty or if the file name has either a .p7c or .spc extension, the file is committed as a PKCS #7. Otherwise, the file is committed as a serialized store.
     * 
     * </td>
     * <td>
     * A pointer to null-terminated ANSI string that contains the name of an existing, unopened file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>CERT_STORE_PROV_FILENAME</b>
     * 
     * <b>CERT_STORE_PROV_FILENAME_W</b>
     * 
     * <b>sz_CERT_STORE_PROV_FILENAME</b>
     * 
     * <b>sz_CERT_STORE_PROV_FILENAME_W</b>
     * 
     * </td>
     * <td>
     * Same as <b>CERT_STORE_PROV_FILENAME_A</b>.
     * 
     * </td>
     * <td>
     * A pointer to null-terminated Unicode string that contains the name of an existing, unopened file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>CERT_STORE_PROV_COLLECTION</b>
     * 
     * <b>sz_CERT_STORE_PROV_COLLECTION</b>
     * 
     * </td>
     * <td>
     * Opens a store that will be a collection of other stores. Stores are added to or removed from the collection by using <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certaddstoretocollection">CertAddStoreToCollection</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certremovestorefromcollection">CertRemoveStoreFromCollection</a>. When a store is added to a collection, all certificates, CRLs, and CTLs in that store become available to searches or enumerations of the collection store.
     * 
     * The high word of <i>dwFlags</i> is set to zero.
     * 
     * </td>
     * <td>
     * Must be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>CERT_STORE_PROV_REG</b>
     * 
     * </td>
     * <td>
     * Initializes the store with certificates, CRLs, and CTLs from a registry subkey.
     * 
     * This provider opens or creates the registry subkeys <b>Certificates</b>, <b>CRLs</b>, and <b>CTLs</b> under the key passed in <i>pvPara</i>. The input key is not closed by the provider. Before returning, the provider opens its own copy of the key passed in <i>pvPara</i>. If CERT_STORE_READONLY_FLAG is set in the low word of <i>dwFlags</i>, registry subkeys are opened by using the <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeya">RegOpenKey</a> with KEY_READ_ACCESS. Otherwise, registry subkeys are created by using <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeya">RegCreateKey</a> with KEY_ALL_ACCESS. Any changes to the contents of the opened store are immediately persisted to the registry. However, if CERT_STORE_READONLY_FLAG is set in the low word of <i>dwFlags</i>, any attempt to add to the contents of the store or to change a context's property results in an error with <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returning the E_ACCESSDENIED code.
     * 
     * </td>
     * <td>
     * The handle of an open registry key.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>CERT_STORE_PROV_SYSTEM_A</b>
     * 
     * </td>
     * <td>
     * Initializes the store with certificates, CRLs, and CTLs from the specified system store.
     * 
     * The system store is a logical, collection store that consists of one or more physical stores. A physical store associated with a system store is registered with the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certregisterphysicalstore">CertRegisterPhysicalStore</a> function. After the system store is opened, all of the physical stores that are associated with it are also opened by calls to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certopenstore">CertOpenStore</a> and are added to the system store collection by using the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certaddstoretocollection">CertAddStoreToCollection</a> function. The high word of <i>dwFlags</i> indicates the system store location, usually set to CERT_SYSTEM_STORE_CURRENT_USER. For details about registry locations, see <i>dwFlags</i> later in this topic and <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/system-store-locations">System Store Locations</a>. Some system store locations can be opened remotely; for more information, see System Store Locations.
     * 
     * </td>
     * <td>
     * A pointer to a null-terminated ANSI string that contains a system store name, such as "My" or "Root".
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>CERT_STORE_PROV_SYSTEM</b>
     * 
     * <b>CERT_STORE_PROV_SYSTEM_W</b>
     * 
     * <b>sz_CERT_STORE_PROV_SYSTEM</b>
     * 
     * <b>sz_CERT_STORE_PROV_SYSTEM_W</b>
     * 
     * </td>
     * <td>
     * Same as <b>CERT_STORE_PROV_SYSTEM_A</b>.
     * 
     * </td>
     * <td>
     * A pointer to a null-terminated Unicode string that contains a system store name, such as "My" or "Root".
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>CERT_STORE_PROV_SYSTEM_REGISTRY_A</b>
     * 
     * </td>
     * <td>
     * Initializes the store with certificates, CRLs, and CTLs from a physical registry store. The physical store is not opened as a collection store. Enumerations and searches go through only the certificates, CRLs, and CTLs in that one physical store.
     * 
     * The high word of <i>dwFlags</i> indicates the system store location, usually set to CERT_SYSTEM_STORE_CURRENT_USER. For more information, see <i>dwFlags</i> later in this topic. Some system store locations can be open remotely; for more information, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/system-store-locations">System Store Locations</a>.
     * 
     * </td>
     * <td>
     * A pointer to a null-terminated ANSI string that contains a system store name, such as "My" or "Root".
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>CERT_STORE_PROV_SYSTEM_REGISTRY</b>
     * 
     * <b>CERT_STORE_PROV_SYSTEM_REGISTRY_W</b>
     * 
     * <b>sz_CERT_STORE_PROV_SYSTEM_REGISTRY</b>
     * 
     * <b>sz_CERT_STORE_PROV_SYSTEM_REGISTRY_W</b>
     * 
     * </td>
     * <td>
     * Same as <b>CERT_STORE_PROV_SYSTEM_REGISTRY_A</b>.
     * 
     * </td>
     * <td>
     * A pointer to a null-terminated Unicode string that contains a system store name, such as "My" or "Root".
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>CERT_STORE_PROV_PHYSICAL</b>
     * 
     * <b>CERT_STORE_PROV_PHYSICAL_W</b>
     * 
     * <b>sz_CERT_STORE_PROV_PHYSICAL</b>
     * 
     * <b>sz_CERT_STORE_PROV_PHYSICAL_W</b>
     * 
     * </td>
     * <td>
     * Initializes the store with certificates, CRLs, and CTLs from a specified physical store that is a member of a logical system store.
     * 
     * Two names are separated with an intervening backslash (\\), for example "Root\.LocalMachine". Here, "Root" is the name of the system store and ".LocalMachine" is the name of the physical store. The system and physical store names cannot contain any backslashes. The high word of <i>dwFlags</i> indicates the system store location, usually CERT_SYSTEM_STORE_CURRENT_USER. For more information, see <i>dwFlags</i> later in this topic. Some physical store locations can be opened remotely.
     * 
     * </td>
     * <td>
     * A pointer to a null-terminated Unicode string that contains both the system store name and physical names.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>CERT_STORE_PROV_MSG</b>
     * 
     * </td>
     * <td>
     * Initializes the store with certificates, CRLs, and CTLs from the specified cryptographic message. The <i>dwEncodingType</i> parameter must contain the encoding types used with both messages and certificates.
     * 
     * </td>
     * <td>
     * An <b>HCRYPTMSG</b> handle of the encoded message, returned by a call to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptmsgopentodecode">CryptMsgOpenToDecode</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>CERT_STORE_PROV_PKCS7</b>
     * 
     * <b>sz_CERT_STORE_PROV_PKCS7</b>
     * 
     * </td>
     * <td>
     * Initializes the store with certificates, CRLs, and CTLs from an encoded PKCS #7 signed message. The <i>dwEncodingType</i> parameter must specify the encoding types to be used with both messages and certificates.
     * 
     * </td>
     * <td>
     * A pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that represents the encoded message.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>CERT_STORE_PROV_SERIALIZED</b>
     * 
     * <b>sz_CERT_STORE_PROV_SERIALIZED</b>
     * 
     * </td>
     * <td>
     * Initializes the store with certificates, CRLs, and CTLs from a memory location that contains a serialized store.
     * 
     * </td>
     * <td>
     * A pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that contains the serialized memory BLOB.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>CERT_STORE_PROV_LDAP</b>
     * 
     * <b>CERT_STORE_PROV_LDAP_W</b>
     * 
     * <b>sz_CERT_STORE_PROV_LDAP</b>
     * 
     * <b>sz_CERT_STORE_PROV_LDAP_W</b>
     * 
     * </td>
     * <td>
     * Initializes the store with certificates, CRLs, and CTLs from the results of an LDAP query.
     * 
     * To perform write operations on the store, the query string must specify a BASE query with no filter and a single attribute.
     * 
     * </td>
     * <td>
     * If the <i>dwFlags</i> parameter contains the <b>CERT_LDAP_STORE_OPENED_FLAG</b> flag, this is the address of a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_ldap_store_opened_para">CERT_LDAP_STORE_OPENED_PARA</a> structure that specifies the established LDAP session to use.
     * 
     * Otherwise, this is a pointer to a null-terminated Unicode string that contains the LDAP query string. For more information about LDAP query strings, see <a href="https://docs.microsoft.com/windows/desktop/ADSI/ldap-dialect">LDAP Dialect</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>CERT_STORE_PROV_SMART_CARD</b>
     * 
     * <b>CERT_STORE_PROV_SMART_CARD_W</b>
     * 
     * <b>sz_CERT_STORE_PROV_SMART_CARD</b>
     * 
     * <b>sz_CERT_STORE_PROV_SMART_CARD_W</b>
     * 
     * </td>
     * <td>
     * Not currently used.
     * 
     * </td>
     * <td>
     *  
     * 
     * </td>
     * </tr>
     * </table>
     * @param {CERT_QUERY_ENCODING_TYPE} dwEncodingType Specifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate encoding type</a> and <a href="https://docs.microsoft.com/windows/desktop/SecGloss/m-gly">message encoding type</a>. Encoding is used only when the <i>dwSaveAs</i> parameter of  the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certsavestore">CertSaveStore</a> function contains <b>CERT_STORE_SAVE_AS_PKCS7</b>. Otherwise, the <i>dwEncodingType</i> parameter is not used.
     * 
     * This parameter is only applicable  when the <b>CERT_STORE_PROV_MSG</b>, <b>CERT_STORE_PROV_PKCS7</b>, or <b>CERT_STORE_PROV_FILENAME</b> provider type is specified in the <i>lpszStoreProvider</i> parameter. For all other provider types, this parameter is unused and should be set to zero.
     * @param {HCRYPTPROV_LEGACY} hCryptProv A handle to a cryptographic provider. This parameter can be <b>NULL</b>.
     * @param {CERT_OPEN_STORE_FLAGS} dwFlags These values consist of high-word and low-word values combined by using a bitwise-<b>OR</b> operation.
     * @param {Pointer<Void>} pvPara A 32-bit value that can contain additional information for this function. The contents of this parameter depends on the value of the <i>lpszStoreProvider</i> and other parameters.
     * @param {HCERTSTORE} _hCertStore The handle of the store in memory that has been opened and can be used to make calls to other store-related API calls, such as 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certaddserializedelementtostore">CertAddSerializedElementToStore</a>.
     * @param {Pointer<CERT_STORE_PROV_INFO>} pStoreProvInfo A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_store_prov_info">CERT_STORE_PROV_INFO</a>   structure to be updated. The data structure has been zeroed, and <b>cbSize</b> set before the call.
     * 
     * The <b>cStoreProvFunc</b>  member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_store_prov_info">CERT_STORE_PROV_INFO</a> structure is the count of callback functions that are implemented and should be set last. After <b>cStoreProvFunc</b> is set, all subsequent store calls, such as 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certaddencodedcertificatetostore">CertAddEncodedCertificateToStore</a>, will call the appropriate provider callback function.
     * @returns {BOOL} <b>TRUE</b> if successful; otherwise, <b>FALSE</b>.
     */
    Call(lpszStoreProvider, dwEncodingType, hCryptProv, dwFlags, pvPara, _hCertStore, pStoreProvInfo) {
        lpszStoreProvider := lpszStoreProvider is String ? StrPtr(lpszStoreProvider) : lpszStoreProvider

        pvParaMarshal := pvPara is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, "ptr", lpszStoreProvider, CERT_QUERY_ENCODING_TYPE, dwEncodingType, HCRYPTPROV_LEGACY, hCryptProv, CERT_OPEN_STORE_FLAGS, dwFlags, pvParaMarshal, pvPara, HCERTSTORE, _hCertStore, CERT_STORE_PROV_INFO.Ptr, pStoreProvInfo, BOOL)
        return result
    }

    /**
     * A PFN_CERT_DLL_OPEN_STORE_PROV_FUNC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CERT_DLL_OPEN_STORE_PROV_FUNC {
        /**
         * Creates a PFN_CERT_DLL_OPEN_STORE_PROV_FUNC pointer that invokes the given AHK function when called.
         * @param {Func(PSTR, CERT_QUERY_ENCODING_TYPE, HCRYPTPROV_LEGACY, CERT_OPEN_STORE_FLAGS, "ptr", HCERTSTORE, CERT_STORE_PROV_INFO) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PSTR, CERT_QUERY_ENCODING_TYPE, HCRYPTPROV_LEGACY, CERT_OPEN_STORE_FLAGS, "ptr", HCERTSTORE, CERT_STORE_PROV_INFO.Ptr, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
