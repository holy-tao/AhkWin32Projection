#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.Catalog
 * @version v4.0.30319
 */
class Catalog {

;@region Constants

    /**
     * @type {String}
     */
    static szOID_CATALOG_LIST => "1.3.6.1.4.1.311.12.1.1"

    /**
     * @type {String}
     */
    static szOID_CATALOG_LIST_MEMBER => "1.3.6.1.4.1.311.12.1.2"

    /**
     * @type {String}
     */
    static szOID_CATALOG_LIST_MEMBER2 => "1.3.6.1.4.1.311.12.1.3"

    /**
     * @type {String}
     */
    static CRYPTCAT_FILEEXT => "CAT"

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTCAT_MAX_MEMBERTAG => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTCAT_MEMBER_SORTED => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTCAT_E_AREA_HEADER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTCAT_E_AREA_MEMBER => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTCAT_E_AREA_ATTRIBUTE => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTCAT_E_CDF_UNSUPPORTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTCAT_E_CDF_DUPLICATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTCAT_E_CDF_TAGNOTFOUND => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTCAT_E_CDF_MEMBER_FILE_PATH => 65537

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTCAT_E_CDF_MEMBER_INDIRECTDATA => 65538

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTCAT_E_CDF_MEMBER_FILENOTFOUND => 65540

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTCAT_E_CDF_BAD_GUID_CONV => 131073

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTCAT_E_CDF_ATTR_TOOFEWVALUES => 131074

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTCAT_E_CDF_ATTR_TYPECOMBO => 131076

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTCAT_ADDCATALOG_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTCAT_ADDCATALOG_HARDLINK => 1
;@endregion Constants

;@region Methods
    /**
     * Opens a catalog and returns a context handle to the open catalog.
     * @param {Pointer<Char>} pwszFileName A pointer to a null-terminated string for the catalog file name.
     * @param {Integer} fdwOpenFlags 
     * @param {Pointer} hProv A handle to a cryptographic service provider (CSP).
     * @param {Integer} dwPublicVersion 
     * @param {Integer} dwEncodingType Encoding type used for the file. If this value is 0, then the encoding type is set to PKCS_7_ASN_ENCODING | X509_ASN_ENCODING.
     * @returns {Pointer<Void>} Upon success, this function returns a handle to the open catalog. When you have finished using the handle, close it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mscat/nf-mscat-cryptcatclose">CryptCATClose</a> function. The <b>CryptCATOpen</b> function returns INVALID_HANDLE_VALUE if it fails.
     * @see https://learn.microsoft.com/windows/win32/api/mscat/nf-mscat-cryptcatopen
     * @since windows5.1.2600
     */
    static CryptCATOpen(pwszFileName, fdwOpenFlags, hProv, dwPublicVersion, dwEncodingType) {
        pwszFileName := pwszFileName is String? StrPtr(pwszFileName) : pwszFileName

        result := DllCall("WINTRUST.dll\CryptCATOpen", "ptr", pwszFileName, "uint", fdwOpenFlags, "ptr", hProv, "uint", dwPublicVersion, "uint", dwEncodingType)
        return result
    }

    /**
     * Closes a catalog handle opened previously by the CryptCATOpen function.
     * @param {Pointer<Void>} hCatalog Handle opened previously by a call to the  <a href="https://docs.microsoft.com/windows/desktop/api/mscat/nf-mscat-cryptcatopen">CryptCATOpen</a> function.
     * @returns {Integer} The return value is <b>TRUE</b> if the function succeeds; <b>FALSE</b> if the function fails.
     * @see https://learn.microsoft.com/windows/win32/api/mscat/nf-mscat-cryptcatclose
     * @since windows5.1.2600
     */
    static CryptCATClose(hCatalog) {
        result := DllCall("WINTRUST.dll\CryptCATClose", "ptr", hCatalog, "int")
        return result
    }

    /**
     * Retrieves a CRYPTCATSTORE structure from a catalog handle.
     * @param {Pointer<Void>} hCatalog A handle to the catalog obtained from the <a href="https://docs.microsoft.com/windows/desktop/api/mscat/nf-mscat-cryptcatopen">CryptCATOpen</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mscat/nf-mscat-cryptcathandlefromstore">CryptCATHandleFromStore</a> function.
     * @returns {Pointer} A pointer to a [CRYPTCATSTORE](/windows/desktop/api/mscat/ns-mscat-cryptcatstore) structure that contains the catalog store. The caller must not free this pointer or any of its members.
     * @see https://learn.microsoft.com/windows/win32/api/mscat/nf-mscat-cryptcatstorefromhandle
     * @since windows5.1.2600
     */
    static CryptCATStoreFromHandle(hCatalog) {
        result := DllCall("WINTRUST.dll\CryptCATStoreFromHandle", "ptr", hCatalog)
        return result
    }

    /**
     * Retrieves a catalog handle from memory.
     * @param {Pointer<CRYPTCATSTORE>} pCatStore A pointer to a [CRYPTCATSTORE](/windows/desktop/api/mscat/ns-mscat-cryptcatstore) structure that contains the handle to retrieve.
     * @returns {Pointer<Void>} A handle to the catalog.
     * @see https://learn.microsoft.com/windows/win32/api/mscat/nf-mscat-cryptcathandlefromstore
     * @since windows5.1.2600
     */
    static CryptCATHandleFromStore(pCatStore) {
        result := DllCall("WINTRUST.dll\CryptCATHandleFromStore", "ptr", pCatStore)
        return result
    }

    /**
     * Saves the information in the specified catalog store to an unsigned catalog file.
     * @remarks
     * The [CRYPTCATSTORE](/windows/desktop/api/mscat/ns-mscat-cryptcatstore)  structure must be initialized before you call <b>CryptCATPersistStore</b>.
     * 
     * Beginning with Windows 8 and Windows Server 2012, the following changes apply to this function:
     * 
     * <ul>
     * <li>If <a href="https://docs.microsoft.com/windows/desktop/api/mscat/nf-mscat-cryptcatopen">CryptCATOpen</a> was called with a <i>dwPublicVersion</i> parameter of 0x200, the catalog is written by using the v2 format.</li>
     * <li>If <a href="https://docs.microsoft.com/windows/desktop/api/mscat/nf-mscat-cryptcatopen">CryptCATOpen</a> was called with a <i>dwPublicVersion</i> parameter of 0x100, the catalog is written by using the v1 format.</li>
     * <li>If <a href="https://docs.microsoft.com/windows/desktop/api/mscat/nf-mscat-cryptcatopen">CryptCATOpen</a> was called with a <i>dwPublicVersion</i> parameter other than 0x200 or 0x100, the <b>CryptCATPersistStore</b> function returns <b>FALSE</b> and the error code is set to <b>ERROR_NOT_SUPPORTED</b>.</li>
     * </ul>
     * @param {Pointer<Void>} hCatalog A handle to the catalog obtained from <a href="https://docs.microsoft.com/windows/desktop/api/mscat/nf-mscat-cryptcathandlefromstore">CryptCATHandleFromStore</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mscat/nf-mscat-cryptcatopen">CryptCATOpen</a> function.   Beginning with Windows 8 you must use only <b>CryptCATOpen</b> to retrieve a handle.
     * @returns {Integer} The return value is <b>TRUE</b> if the function succeeds; otherwise, <b>FALSE</b>.
     * 
     * 
     * If this function returns <b>FALSE</b>, additional error information can be obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function. <b>GetLastError</b> will return the following error code.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>ERROR_NOT_SUPPORTED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Beginning with Windows 8 and Windows Server 2012, you must retrieve a handle by calling the  <a href="https://docs.microsoft.com/windows/desktop/api/mscat/nf-mscat-cryptcatopen">CryptCATOpen</a> function with the <i>dwPublicVersion</i> parameter set to 0x100 or 0x200. For more information, see Remarks.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mscat/nf-mscat-cryptcatpersiststore
     * @since windows5.1.2600
     */
    static CryptCATPersistStore(hCatalog) {
        A_LastError := 0

        result := DllCall("WINTRUST.dll\CryptCATPersistStore", "ptr", hCatalog, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hCatalog 
     * @param {Pointer<Char>} pwszReferenceTag 
     * @returns {Pointer} 
     */
    static CryptCATGetCatAttrInfo(hCatalog, pwszReferenceTag) {
        pwszReferenceTag := pwszReferenceTag is String? StrPtr(pwszReferenceTag) : pwszReferenceTag

        result := DllCall("WINTRUST.dll\CryptCATGetCatAttrInfo", "ptr", hCatalog, "ptr", pwszReferenceTag)
        return result
    }

    /**
     * Allocates memory for a catalog file attribute and adds it to the catalog.
     * @param {Pointer<Void>} hCatalog A handle to the catalog obtained from the <a href="https://docs.microsoft.com/windows/desktop/api/mscat/nf-mscat-cryptcatopen">CryptCATOpen</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mscat/nf-mscat-cryptcathandlefromstore">CryptCATHandleFromStore</a> functions.
     * @param {Pointer<Char>} pwszReferenceTag A pointer to a null-terminated string for the name of the attribute.
     * @param {Integer} dwAttrTypeAndAction A value that represents a bitwise combination of the following flags. The caller must at least specify <b>CRYPTCAT_ATTR_DATAASCII</b> or <b>CRYPTCAT_ATTR_DATABASE64</b>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPTCAT_ATTR_AUTHENTICATED"></a><a id="cryptcat_attr_authenticated"></a><dl>
     * <dt><b>CRYPTCAT_ATTR_AUTHENTICATED</b></dt>
     * <dt>0x10000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute is authenticated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPTCAT_ATTR_UNAUTHENTICATED"></a><a id="cryptcat_attr_unauthenticated"></a><dl>
     * <dt><b>CRYPTCAT_ATTR_UNAUTHENTICATED</b></dt>
     * <dt>0x20000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute is unauthenticated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPTCAT_ATTR_NAMEASCII"></a><a id="cryptcat_attr_nameascii"></a><dl>
     * <dt><b>CRYPTCAT_ATTR_NAMEASCII</b></dt>
     * <dt>             0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute is an ASCII string.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPTCAT_ATTR_NAMEOBJID"></a><a id="cryptcat_attr_nameobjid"></a><dl>
     * <dt><b>CRYPTCAT_ATTR_NAMEOBJID</b></dt>
     * <dt>             0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute is a cryptographic <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPTCAT_ATTR_DATAASCII"></a><a id="cryptcat_attr_dataascii"></a><dl>
     * <dt><b>CRYPTCAT_ATTR_DATAASCII</b></dt>
     * <dt>             0x00010000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute contains simple ASCII characters that should not be decoded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPTCAT_ATTR_DATABASE64"></a><a id="cryptcat_attr_database64"></a><dl>
     * <dt><b>CRYPTCAT_ATTR_DATABASE64</b></dt>
     * <dt>            0x00020000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute is in base 64 format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPTCAT_ATTR_DATAREPLACE"></a><a id="cryptcat_attr_datareplace"></a><dl>
     * <dt><b>CRYPTCAT_ATTR_DATAREPLACE</b></dt>
     * <dt>           0x00040000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute replaces the value for an existing attribute.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} cbData A value that specifies the number of bytes in the <i>pbData</i> buffer.
     * @param {Pointer<Byte>} pbData A pointer to a memory buffer that contains the attribute value.
     * @returns {Pointer} A pointer to a [CRYPTCATATTRIBUTE](/windows/desktop/api/mscat/ns-mscat-cryptcatattribute) structure that contains the catalog attribute. The caller must not free this pointer or any of its members.
     * 
     * 
     * If this function returns <b>NULL</b>, additional error information can be obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function. <b>GetLastError</b> will return one of the following error codes.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operating system ran out of memory during the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mscat/nf-mscat-cryptcatputcatattrinfo
     * @since windows5.1.2600
     */
    static CryptCATPutCatAttrInfo(hCatalog, pwszReferenceTag, dwAttrTypeAndAction, cbData, pbData) {
        pwszReferenceTag := pwszReferenceTag is String? StrPtr(pwszReferenceTag) : pwszReferenceTag

        A_LastError := 0

        result := DllCall("WINTRUST.dll\CryptCATPutCatAttrInfo", "ptr", hCatalog, "ptr", pwszReferenceTag, "uint", dwAttrTypeAndAction, "uint", cbData, "char*", pbData)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates the attributes associated with a catalog. This function has no associated import library.
     * @remarks
     * Do not free the returned pointer nor any of the members pointed to by the returned pointer.
     * @param {Pointer<Void>} hCatalog Handle for the catalog whose attributes are being enumerated. This value cannot be <b>NULL</b>.
     * @param {Pointer<CRYPTCATATTRIBUTE>} pPrevAttr A pointer to the previously returned pointer to  the [CRYPTCATATTRIBUTE](/windows/desktop/api/mscat/ns-mscat-cryptcatattribute) structure from this function or pointer to <b>NULL</b> to start the enumeration.
     * @returns {Pointer} The return value is a pointer to the  [CRYPTCATATTRIBUTE](/windows/desktop/api/mscat/ns-mscat-cryptcatattribute) structure that contains the attribute information or <b>NULL</b>, if no more attributes are in the enumeration or if an error is encountered. The returned pointer is passed in as the <i>pPrevAttr</i> parameter for subsequent calls to this function.
     * @see https://learn.microsoft.com/windows/win32/api/mscat/nf-mscat-cryptcatenumeratecatattr
     * @since windows5.1.2600
     */
    static CryptCATEnumerateCatAttr(hCatalog, pPrevAttr) {
        result := DllCall("WINTRUST.dll\CryptCATEnumerateCatAttr", "ptr", hCatalog, "ptr", pPrevAttr)
        return result
    }

    /**
     * Retrieves member information from the catalog's PKCS
     * @remarks
     * Do not free the returned pointer nor any of the members pointed to by the returned pointer.
     * @param {Pointer<Void>} hCatalog A handle to the catalog. This parameter cannot be <b>NULL</b>.
     * @param {Pointer<Char>} pwszReferenceTag A pointer to a <b>null</b>-terminated string that represents the reference tag for the member information being retrieved.
     * @returns {Pointer} A pointer to the [CRYPTCATMEMBER](/windows/desktop/api/mscat/ns-mscat-cryptcatmember) structure that contains the member information or <b>NULL</b>, if no information can be found.
     * @see https://learn.microsoft.com/windows/win32/api/mscat/nf-mscat-cryptcatgetmemberinfo
     * @since windows5.1.2600
     */
    static CryptCATGetMemberInfo(hCatalog, pwszReferenceTag) {
        pwszReferenceTag := pwszReferenceTag is String? StrPtr(pwszReferenceTag) : pwszReferenceTag

        result := DllCall("WINTRUST.dll\CryptCATGetMemberInfo", "ptr", hCatalog, "ptr", pwszReferenceTag)
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hCatalog 
     * @param {Pointer<Char>} pwszReferenceTag 
     * @returns {Pointer} 
     */
    static CryptCATAllocSortedMemberInfo(hCatalog, pwszReferenceTag) {
        pwszReferenceTag := pwszReferenceTag is String? StrPtr(pwszReferenceTag) : pwszReferenceTag

        result := DllCall("WINTRUST.dll\CryptCATAllocSortedMemberInfo", "ptr", hCatalog, "ptr", pwszReferenceTag)
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hCatalog 
     * @param {Pointer<CRYPTCATMEMBER>} pCatMember 
     * @returns {Pointer} 
     */
    static CryptCATFreeSortedMemberInfo(hCatalog, pCatMember) {
        result := DllCall("WINTRUST.dll\CryptCATFreeSortedMemberInfo", "ptr", hCatalog, "ptr", pCatMember)
        return result
    }

    /**
     * Retrieves information about an attribute of a member of a catalog.
     * @param {Pointer<Void>} hCatalog The handle of the catalog that contains the member to retrieve the attribute information for. This handle is obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mscat/nf-mscat-cryptcatopen">CryptCATOpen</a> function. This parameter is required and cannot be <b>NULL</b>.
     * @param {Pointer<CRYPTCATMEMBER>} pCatMember A pointer to a [CRYPTCATMEMBER](/windows/desktop/api/mscat/ns-mscat-cryptcatmember) structure that represents the member to retrieve the attribute information for. This can be obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mscat/nf-mscat-cryptcatgetmemberinfo">CryptCATGetMemberInfo</a> function. This parameter is required and cannot be <b>NULL</b>.
     * @param {Pointer<Char>} pwszReferenceTag A pointer to a null-terminated Unicode string that contains the name of the attribute to retrieve the information for. This parameter is required and cannot be <b>NULL</b>.
     * @returns {Pointer} This function returns a pointer to a [CRYPTCATATTRIBUTE](/windows/desktop/api/mscat/ns-mscat-cryptcatattribute) structure that contains the attribute information. If the function fails, it returns <b>NULL</b>.
     * 
     * 
     * <div class="alert"><b>Important</b>  Do not free the returned pointer nor any of the members pointed to by the returned pointer.</div>
     * <div> </div>
     * 
     * 
     * 
     * If this function returns <b>NULL</b>, additional error information can be obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function. <b>GetLastError</b> will return one of the following error codes.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CRYPT_E_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The member or the attribute could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters are not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mscat/nf-mscat-cryptcatgetattrinfo
     * @since windows5.1.2600
     */
    static CryptCATGetAttrInfo(hCatalog, pCatMember, pwszReferenceTag) {
        pwszReferenceTag := pwszReferenceTag is String? StrPtr(pwszReferenceTag) : pwszReferenceTag

        A_LastError := 0

        result := DllCall("WINTRUST.dll\CryptCATGetAttrInfo", "ptr", hCatalog, "ptr", pCatMember, "ptr", pwszReferenceTag)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Allocates memory for a catalog member and adds it to the catalog.
     * @param {Pointer<Void>} hCatalog A handle to the catalog obtained from the <a href="https://docs.microsoft.com/windows/desktop/api/mscat/nf-mscat-cryptcatopen">CryptCATOpen</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mscat/nf-mscat-cryptcathandlefromstore">CryptCATHandleFromStore</a> function.
     * @param {Pointer<Char>} pwszFileName A pointer to a null-terminated string for the catalog file name.
     * @param {Pointer<Char>} pwszReferenceTag A pointer to a null-terminated string that contains the name of the member.
     * @param {Pointer<Guid>} pgSubjectType A GUID for the subject type of the member.
     * @param {Integer} dwCertVersion A value that specifies the certificate version.
     * @param {Integer} cbSIPIndirectData A value that specifies the number of bytes in the <i>pbSIPIndirectData</i> buffer.
     * @param {Pointer<Byte>} pbSIPIndirectData A pointer to  a memory buffer for <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">subject interface package</a> (SIP)-indirect data.
     * @returns {Pointer} A pointer to a [CRYPTCATMEMBER](/windows/desktop/api/mscat/ns-mscat-cryptcatmember) structure that contains the assigned member. The caller must not free this pointer or any of its members.
     * 
     * 
     * If this function returns <b>NULL</b>, additional error information can be obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function. <b>GetLastError</b> will return one of the following error codes.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operating system ran out of memory during the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mscat/nf-mscat-cryptcatputmemberinfo
     * @since windows5.1.2600
     */
    static CryptCATPutMemberInfo(hCatalog, pwszFileName, pwszReferenceTag, pgSubjectType, dwCertVersion, cbSIPIndirectData, pbSIPIndirectData) {
        pwszFileName := pwszFileName is String? StrPtr(pwszFileName) : pwszFileName
        pwszReferenceTag := pwszReferenceTag is String? StrPtr(pwszReferenceTag) : pwszReferenceTag

        A_LastError := 0

        result := DllCall("WINTRUST.dll\CryptCATPutMemberInfo", "ptr", hCatalog, "ptr", pwszFileName, "ptr", pwszReferenceTag, "ptr", pgSubjectType, "uint", dwCertVersion, "uint", cbSIPIndirectData, "char*", pbSIPIndirectData)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Allocates memory for an attribute and adds it to a catalog member.
     * @param {Pointer<Void>} hCatalog A handle to the catalog obtained from the <a href="https://docs.microsoft.com/windows/desktop/api/mscat/nf-mscat-cryptcatopen">CryptCATOpen</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mscat/nf-mscat-cryptcathandlefromstore">CryptCATHandleFromStore</a> function.
     * @param {Pointer<CRYPTCATMEMBER>} pCatMember A pointer to a [CRYPTCATMEMBER](/windows/desktop/api/mscat/ns-mscat-cryptcatmember) structure that contains the catalog member.
     * @param {Pointer<Char>} pwszReferenceTag A pointer to a null-terminated string that contains the name of the attribute.
     * @param {Integer} dwAttrTypeAndAction A value that represents a bitwise combination of the following flags. The caller must at least specify <b>CRYPTCAT_ATTR_DATABASE64</b> or <b>CRYPTCAT_ATTR_DATAASCII</b>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPTCAT_ATTR_AUTHENTICATED"></a><a id="cryptcat_attr_authenticated"></a><dl>
     * <dt><b>CRYPTCAT_ATTR_AUTHENTICATED</b></dt>
     * <dt>0x10000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute is authenticated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPTCAT_ATTR_UNAUTHENTICATED"></a><a id="cryptcat_attr_unauthenticated"></a><dl>
     * <dt><b>CRYPTCAT_ATTR_UNAUTHENTICATED</b></dt>
     * <dt>0x20000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute is unauthenticated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPTCAT_ATTR_NAMEASCII"></a><a id="cryptcat_attr_nameascii"></a><dl>
     * <dt><b>CRYPTCAT_ATTR_NAMEASCII</b></dt>
     * <dt>             0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute is an ASCII string.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPTCAT_ATTR_NAMEOBJID"></a><a id="cryptcat_attr_nameobjid"></a><dl>
     * <dt><b>CRYPTCAT_ATTR_NAMEOBJID</b></dt>
     * <dt>             0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute is a cryptographic <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPTCAT_ATTR_DATAASCII"></a><a id="cryptcat_attr_dataascii"></a><dl>
     * <dt><b>CRYPTCAT_ATTR_DATAASCII</b></dt>
     * <dt>             0x00010000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute contains simple ASCII characters that should not be decoded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPTCAT_ATTR_DATABASE64"></a><a id="cryptcat_attr_database64"></a><dl>
     * <dt><b>CRYPTCAT_ATTR_DATABASE64</b></dt>
     * <dt>            0x00020000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute is in base 64 format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPTCAT_ATTR_DATAREPLACE"></a><a id="cryptcat_attr_datareplace"></a><dl>
     * <dt><b>CRYPTCAT_ATTR_DATAREPLACE</b></dt>
     * <dt>           0x00040000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attribute replaces the value for an existing attribute.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} cbData A value that specifies the number of bytes in the <i>pbData</i> buffer.
     * @param {Pointer<Byte>} pbData A pointer to a memory buffer that contains the attribute value.
     * @returns {Pointer} Upon success, this function returns a pointer to a [CRYPTCATATTRIBUTE](/windows/desktop/api/mscat/ns-mscat-cryptcatattribute) structure that contains the assigned attribute. The caller must not free this pointer or any of its members.
     * 
     * 
     * If this function returns <b>NULL</b>, additional error information can be obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function. <b>GetLastError</b> will return one of the following error codes.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operating system ran out of memory during the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mscat/nf-mscat-cryptcatputattrinfo
     * @since windows5.1.2600
     */
    static CryptCATPutAttrInfo(hCatalog, pCatMember, pwszReferenceTag, dwAttrTypeAndAction, cbData, pbData) {
        pwszReferenceTag := pwszReferenceTag is String? StrPtr(pwszReferenceTag) : pwszReferenceTag

        A_LastError := 0

        result := DllCall("WINTRUST.dll\CryptCATPutAttrInfo", "ptr", hCatalog, "ptr", pCatMember, "ptr", pwszReferenceTag, "uint", dwAttrTypeAndAction, "uint", cbData, "char*", pbData)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates the members of a catalog.
     * @remarks
     * Do not free the returned pointer nor any of the members pointed to by the returned pointer.
     * @param {Pointer<Void>} hCatalog The handle of the catalog that contains the members to enumerate. This value cannot be <b>NULL</b>.
     * @param {Pointer<CRYPTCATMEMBER>} pPrevMember A pointer to a [CRYPTCATMEMBER](/windows/desktop/api/mscat/ns-mscat-cryptcatmember) structure that identifies which member of the catalog was last retrieved. If this parameter is <b>NULL</b>, this function will retrieve the first member of the catalog.
     * @returns {Pointer} This function returns a pointer to a [CRYPTCATMEMBER](/windows/desktop/api/mscat/ns-mscat-cryptcatmember) structure that represents the next member of the catalog. If there are no more members in the catalog to enumerate, this function returns <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mscat/nf-mscat-cryptcatenumeratemember
     * @since windows5.1.2600
     */
    static CryptCATEnumerateMember(hCatalog, pPrevMember) {
        result := DllCall("WINTRUST.dll\CryptCATEnumerateMember", "ptr", hCatalog, "ptr", pPrevMember)
        return result
    }

    /**
     * Enumerates the attributes associated with a member of a catalog. This function has no associated import library.
     * @remarks
     * Do not free the returned pointer nor any of the members pointed to by the returned pointer.
     * @param {Pointer<Void>} hCatalog Handle for the catalog that contains the member identified by <i>pCatMember</i>. This value cannot be <b>NULL</b>.
     * @param {Pointer<CRYPTCATMEMBER>} pCatMember A pointer to the [CRYPTCATMEMBER](/windows/desktop/api/mscat/ns-mscat-cryptcatmember) structure that identifies which member of the catalog is being enumerated.
     * @param {Pointer<CRYPTCATATTRIBUTE>} pPrevAttr A pointer to the previously returned value from this function or pointer to <b>NULL</b> to start the enumeration.
     * @returns {Pointer} The return value is a pointer to the  CRYPTCATATTRIBUTE structure that contains the attribute information or <b>NULL</b>, if no more attributes are in the enumeration or if an error is encountered. The returned pointer is passed in as the <i>pPrevAttr</i> parameter for subsequent calls to this function.
     * @see https://learn.microsoft.com/windows/win32/api/mscat/nf-mscat-cryptcatenumerateattr
     * @since windows5.1.2600
     */
    static CryptCATEnumerateAttr(hCatalog, pCatMember, pPrevAttr) {
        result := DllCall("WINTRUST.dll\CryptCATEnumerateAttr", "ptr", hCatalog, "ptr", pCatMember, "ptr", pPrevAttr)
        return result
    }

    /**
     * Opens an existing catalog definition file (CDF) for reading and initializes a CRYPTCATCDF structure.
     * @remarks
     * The following default values are used by the <b>CryptCATCDFOpen</b> function for given conditions in the CDF <b>CatalogHeader</b> section.
     * 
     * <table>
     * <tr>
     * <th><b>CatalogHeader</b> condition</th>
     * <th>Default value</th>
     * </tr>
     * <tr>
     * <td>
     * No <b>Name</b> value is specified.
     * 
     * </td>
     * <td>
     * The file name in <i>pwszFilePath</i> is used for the catalog (.cat) output file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * No <b>PublicVersion</b> value is specified.
     * 
     * </td>
     * <td>
     * 0x00000001
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * No <b>EncodingType</b> value is specified.
     * 
     * </td>
     * <td>
     * <b>PKCS_7_ASN_ENCODING</b> or <b>X509_ASN_ENCODING</b> (0x00010001)
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The following actions are performed by the <b>CryptCATCDFOpen</b> function for given error conditions.
     * 
     * <table>
     * <tr>
     * <th>Error condition</th>
     * <th>Action performed</th>
     * </tr>
     * <tr>
     * <td>
     * No <b>CatalogHeader</b> or <b>Name</b> tags are found in CDF.
     * 
     * </td>
     * <td>
     * If specified by the caller, the <b>CryptCATCDFOpen</b> function calls the function specified by <i>pfnParseError</i> and returns a <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * The <b>CryptCATCDFOpen</b> function calls the <a href="https://docs.microsoft.com/windows/desktop/api/mscat/nf-mscat-cryptcatopen">CryptCATOpen</a> function to get a handle to the catalog (.cat) output file, but it gets an invalid or <b>NULL</b> handle.
     * 
     * </td>
     * <td>
     * Calls the <a href="https://docs.microsoft.com/windows/desktop/api/mscat/nf-mscat-cryptcatcdfclose">CryptCATCDFClose</a> function and returns a <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <table>
     * <tr>
     * <th>Additional OIDs for the Catalog branch</th>
     * <th>Definition</th>
     * </tr>
     * <tr>
     * <td>
     * szOID_CATALOG_LIST_MEMBER_V2
     * 
     * </td>
     * <td>
     * 1.3.6.1.4.1.311.12.1.3
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * CAT_MEMBERINFO2_OBJID
     * 
     * </td>
     * <td>
     * 1.3.6.1.4.1.311.12.2.3
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>The additional 	Catalog OIDs are not available.
     * @param {Pointer<Char>} pwszFilePath A pointer to a null-terminated string that contains the path of the CDF file to open.
     * @param {Pointer<PFN_CDF_PARSE_ERROR_CALLBACK>} pfnParseError A pointer to a user-defined function to handle file parse errors.
     * @returns {Pointer} Upon success, this function returns a pointer to the newly created [CRYPTCATCDF](/windows/desktop/api/mscat/ns-mscat-cryptcatcdf) structure. The <b>CryptCATCDFOpen</b> function returns a <b>NULL</b> pointer if it fails.
     * @see https://learn.microsoft.com/windows/win32/api/mscat/nf-mscat-cryptcatcdfopen
     * @since windows5.1.2600
     */
    static CryptCATCDFOpen(pwszFilePath, pfnParseError) {
        pwszFilePath := pwszFilePath is String? StrPtr(pwszFilePath) : pwszFilePath

        result := DllCall("WINTRUST.dll\CryptCATCDFOpen", "ptr", pwszFilePath, "ptr", pfnParseError)
        return result
    }

    /**
     * Closes a catalog definition file (CDF) and frees the memory for the corresponding CRYPTCATCDF structure.
     * @remarks
     * Before closing the catalog output file specified in  <i>pCDF</i>, the <b>CryptCATCDFClose</b> function signs and persists it to the file system.
     * @param {Pointer<CRYPTCATCDF>} pCDF A pointer to a [CRYPTCATCDF](/windows/desktop/api/mscat/ns-mscat-cryptcatcdf) structure.
     * @returns {Integer} Upon success, this function returns <b>TRUE</b>. The <b>CryptCATCDFClose</b> function returns <b>FALSE</b> with an <b>ERROR_INVALID_PARAMETER</b> error if it fails.
     * @see https://learn.microsoft.com/windows/win32/api/mscat/nf-mscat-cryptcatcdfclose
     * @since windows5.1.2600
     */
    static CryptCATCDFClose(pCDF) {
        result := DllCall("WINTRUST.dll\CryptCATCDFClose", "ptr", pCDF, "int")
        return result
    }

    /**
     * Enumerates catalog-level attributes within the CatalogHeader section of a catalog definition file (CDF).
     * @remarks
     * You typically call this function in a loop to enumerate all of the catalog header attributes in a CDF. Before entering the loop, set <i>pPrevAttr</i> to <b>NULL</b>. The function returns a pointer to the first attribute. Set <i>pPrevAttr</i> to the return  value of the function for subsequent iterations of the loop.
     * @param {Pointer<CRYPTCATCDF>} pCDF A pointer to a [CRYPTCATCDF](/windows/desktop/api/mscat/ns-mscat-cryptcatcdf) structure.
     * @param {Pointer<CRYPTCATATTRIBUTE>} pPrevAttr A pointer to a [CRYPTCATATTRIBUTE](/windows/desktop/api/mscat/ns-mscat-cryptcatattribute) structure for a catalog attribute in the CDF pointed to by <i>pCDF</i>.
     * @param {Pointer<PFN_CDF_PARSE_ERROR_CALLBACK>} pfnParseError A pointer to a user-defined function to handle file parse errors.
     * @returns {Pointer} Upon success, this function returns a pointer to a [CRYPTCATATTRIBUTE](/windows/desktop/api/mscat/ns-mscat-cryptcatattribute) structure. The <b>CryptCATCDFEnumCatAttributes</b> function returns a <b>NULL</b> pointer if it fails.
     * @see https://learn.microsoft.com/windows/win32/api/mscat/nf-mscat-cryptcatcdfenumcatattributes
     * @since windows5.1.2600
     */
    static CryptCATCDFEnumCatAttributes(pCDF, pPrevAttr, pfnParseError) {
        result := DllCall("WINTRUST.dll\CryptCATCDFEnumCatAttributes", "ptr", pCDF, "ptr", pPrevAttr, "ptr", pfnParseError)
        return result
    }

    /**
     * 
     * @param {Pointer<CRYPTCATCDF>} pCDF 
     * @param {Pointer<CRYPTCATMEMBER>} pPrevMember 
     * @param {Pointer<PFN_CDF_PARSE_ERROR_CALLBACK>} pfnParseError 
     * @returns {Pointer} 
     */
    static CryptCATCDFEnumMembers(pCDF, pPrevMember, pfnParseError) {
        result := DllCall("WINTRUST.dll\CryptCATCDFEnumMembers", "ptr", pCDF, "ptr", pPrevMember, "ptr", pfnParseError)
        return result
    }

    /**
     * 
     * @param {Pointer<CRYPTCATCDF>} pCDF 
     * @param {Pointer<CRYPTCATMEMBER>} pMember 
     * @param {Pointer<CRYPTCATATTRIBUTE>} pPrevAttr 
     * @param {Pointer<PFN_CDF_PARSE_ERROR_CALLBACK>} pfnParseError 
     * @returns {Pointer} 
     */
    static CryptCATCDFEnumAttributes(pCDF, pMember, pPrevAttr, pfnParseError) {
        result := DllCall("WINTRUST.dll\CryptCATCDFEnumAttributes", "ptr", pCDF, "ptr", pMember, "ptr", pPrevAttr, "ptr", pfnParseError)
        return result
    }

    /**
     * Retrieves a Boolean value that indicates whether the specified file is a catalog file.
     * @param {Pointer<Void>} hFile A handle to the file to check. This parameter is optional, but it must contain a valid handle if the <i>pwszFileName</i> parameter is <b>NULL</b>.
     * @param {Pointer<Char>} pwszFileName A pointer to a null-terminated wide character string that contains the name of the file to check. This parameter is optional, but it must contain a valid file name if the <i>hFile</i> parameter is <b>NULL</b>.
     * @returns {Integer} Returns nonzero if the specified file is a catalog file or zero otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/mscat/nf-mscat-iscatalogfile
     * @since windows5.1.2600
     */
    static IsCatalogFile(hFile, pwszFileName) {
        pwszFileName := pwszFileName is String? StrPtr(pwszFileName) : pwszFileName

        result := DllCall("WINTRUST.dll\IsCatalogFile", "ptr", hFile, "ptr", pwszFileName, "int")
        return result
    }

    /**
     * Acquires a handle to a catalog administrator context.
     * @param {Pointer<IntPtr>} phCatAdmin A pointer to the catalog administrator context handle that is assigned by this function. When you have finished using the handle, close it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mscat/nf-mscat-cryptcatadminreleasecontext">CryptCATAdminReleaseContext</a> function.
     * @param {Pointer<Guid>} pgSubsystem A pointer to the GUID that identifies the subsystem. DRIVER_ACTION_VERIFY represents the subsystem for operating system components and third party drivers. This is the subsystem used by most implementations.
     * @returns {Integer} The return value is <b>TRUE</b> if the function succeeds; <b>FALSE</b> if the function fails.
     * 
     * For extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function. For a complete list of error codes provided by the operating system, see <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mscat/nf-mscat-cryptcatadminacquirecontext
     * @since windows5.1.2600
     */
    static CryptCATAdminAcquireContext(phCatAdmin, pgSubsystem) {
        static dwFlags := 0 ;Reserved parameters must always be NULL

        A_LastError := 0

        result := DllCall("WINTRUST.dll\CryptCATAdminAcquireContext", "ptr*", phCatAdmin, "ptr", pgSubsystem, "uint", dwFlags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Acquires a handle to a catalog administrator context for a given hash algorithm and hash policy.
     * @remarks
     * This function enables you to choose, or chooses for you, the hash algorithm to be used in  functions that require the catalog administrator context. Although you can set the name of the hashing algorithm, we recommend that you let the function determine the algorithm. Doing so protects your application from hard coding algorithms that may become untrusted in the future.
     * @param {Pointer<IntPtr>} phCatAdmin A pointer to the catalog administrator context handle that is assigned by this function. When you have finished using the handle, close it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mscat/nf-mscat-cryptcatadminreleasecontext">CryptCATAdminReleaseContext</a> function.
     * @param {Pointer<Guid>} pgSubsystem A pointer to the <b>GUID</b> that identifies the subsystem. DRIVER_ACTION_VERIFY represents the subsystem for operating system components and third party drivers. This is the subsystem used by most implementations.
     * @param {Pointer<Char>} pwszHashAlgorithm Optional null-terminated Unicode string that specifies the name of the hash algorithm to use when calculating and verifying hashes. This value can be <b>NULL</b>. If it is <b>NULL</b>, the default hashing algorithm may be chosen, depending on the value you set for the <i>pStrongHashPolicy</i> parameter. The default algorithm in Windows 8 is SHA1. The default may change in future Windows versions. For more information, see Remarks.
     * @param {Pointer<CERT_STRONG_SIGN_PARA>} pStrongHashPolicy Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_strong_sign_para">CERT_STRONG_SIGN_PARA</a> structure that contains the parameters used to check for strong signatures. The function chooses the lowest common hashing algorithm that satisfies the specified policy and the algorithm specified by the <i>pwszHashAlgorithm</i> parameter or the system default algorithm (if no algorithm is specified).
     * @returns {Integer} If the function succeeds, the return value is nonzero (<b>TRUE</b>).
     * 
     * If the function fails, the return value is zero (<b>FALSE</b>). For extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following table lists the error codes most commonly returned by the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>phCatAdmin</i> parameter cannot be <b>NULL</b>.
     * 
     * The <i>dwFlags</i> parameter must be zero (0).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was insufficient memory to create a new catalog administrator object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NTE_BAD_ALGID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The hash algorithm specified by the <i>pwszHashAlgorithm</i> parameter cannot be found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mscat/nf-mscat-cryptcatadminacquirecontext2
     * @since windows8.0
     */
    static CryptCATAdminAcquireContext2(phCatAdmin, pgSubsystem, pwszHashAlgorithm, pStrongHashPolicy) {
        static dwFlags := 0 ;Reserved parameters must always be NULL

        pwszHashAlgorithm := pwszHashAlgorithm is String? StrPtr(pwszHashAlgorithm) : pwszHashAlgorithm

        A_LastError := 0

        result := DllCall("WINTRUST.dll\CryptCATAdminAcquireContext2", "ptr*", phCatAdmin, "ptr", pgSubsystem, "ptr", pwszHashAlgorithm, "ptr", pStrongHashPolicy, "uint", dwFlags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Releases the handle previously assigned by the CryptCATAdminAcquireContext function.
     * @param {Pointer} hCatAdmin Catalog administrator context handle previously  assigned by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/mscat/nf-mscat-cryptcatadminacquirecontext">CryptCATAdminAcquireContext</a> function.
     * @param {Integer} dwFlags Not used; set to  zero.
     * @returns {Integer} The return value is <b>TRUE</b> if the function succeeds; <b>FALSE</b> if the function fails.
     * @see https://learn.microsoft.com/windows/win32/api/mscat/nf-mscat-cryptcatadminreleasecontext
     * @since windows5.1.2600
     */
    static CryptCATAdminReleaseContext(hCatAdmin, dwFlags) {
        result := DllCall("WINTRUST.dll\CryptCATAdminReleaseContext", "ptr", hCatAdmin, "uint", dwFlags, "int")
        return result
    }

    /**
     * Releases a handle to a catalog context previously returned by the CryptCATAdminAddCatalog function.
     * @param {Pointer} hCatAdmin Valid handle previously assigned by the  <a href="https://docs.microsoft.com/windows/desktop/api/mscat/nf-mscat-cryptcatadminacquirecontext">CryptCATAdminAcquireContext</a> function.
     * @param {Pointer} hCatInfo Valid handle previously assigned by the <a href="https://docs.microsoft.com/windows/desktop/api/mscat/nf-mscat-cryptcatadminaddcatalog">CryptCATAdminAddCatalog</a> function or the <a href="https://docs.microsoft.com/windows/desktop/api/mscat/nf-mscat-cryptcatadminenumcatalogfromhash">CryptCATAdminEnumCatalogFromHash</a> function.
     * @param {Integer} dwFlags This parameter is reserved for future use and must be set to zero.
     * @returns {Integer} The return value is <b>TRUE</b> if the function succeeds; <b>FALSE</b> if the function fails.
     * @see https://learn.microsoft.com/windows/win32/api/mscat/nf-mscat-cryptcatadminreleasecatalogcontext
     * @since windows5.1.2600
     */
    static CryptCATAdminReleaseCatalogContext(hCatAdmin, hCatInfo, dwFlags) {
        result := DllCall("WINTRUST.dll\CryptCATAdminReleaseCatalogContext", "ptr", hCatAdmin, "ptr", hCatInfo, "uint", dwFlags, "int")
        return result
    }

    /**
     * Enumerates the catalogs that contain a specified hash.
     * @param {Pointer} hCatAdmin A handle to a catalog administrator context previously assigned by the <a href="https://docs.microsoft.com/windows/desktop/api/mscat/nf-mscat-cryptcatadminacquirecontext">CryptCATAdminAcquireContext</a> function.
     * @param {Pointer} pbHash A pointer to the buffer that contains the hash retrieved by calling <a href="https://docs.microsoft.com/windows/desktop/api/mscat/nf-mscat-cryptcatadmincalchashfromfilehandle">CryptCATAdminCalcHashFromFileHandle</a>.
     * @param {Integer} cbHash Number of bytes in the buffer allocated for <i>pbHash</i>.
     * @param {Pointer<IntPtr>} phPrevCatInfo A pointer to the handle to the previous catalog context or <b>NULL</b>. To get the first catalog that contains the hash, or to start an enumeration of all catalogs, pass <b>NULL</b> for this parameter. To continue the enumeration, pass the previous call's return value until no more catalogs are found.
     * @returns {Pointer} The return value is a handle to the catalog context, or <b>NULL</b> if there are no more catalogs to enumerate. 
     *   
     * **Note:** The type HCATINFO is simply a typedef for HANDLE, which makes it easy to accidentally use the HCATINFO in the wrong context. In particular, this is NOT the same as a HANDLE returned from **CryptCATOpen**, even though the compiler will not prevent you from using the HCATINFO in any function that expects a catalog handle. To acquire a catalog handle from this function, first call [**CryptCATCatalogInfoFromContext**](/windows/win32/api/mscat/nf-mscat-cryptcatcataloginfofromcontext) to get the filename of the catalog, and then call [**CryptCATOpen**](/windows/win32/api/mscat/nf-mscat-cryptcatopen) with that filename.
     *   
     *  
     * 
     * 
     * For extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function. For a complete list of error codes provided by the operating system, see <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * 
     * 
     * 
     * **Note:** The function returns a value of type **HCATINFO**, but this is simply a typedef for **HANDLE**. Because of this, it is easy to accidentally use the **HCATINFO** when calling a function that expects a different kind of **HANDLE**. In particular, this is not the same as a **HANDLE** returned from **CryptCATOpen**, even though the compiler will not prevent you from using the **HCATINFO** in any function that expects a catalog handle. 
     *   
     * To acquire a catalog handle from this function, first call [CryptCATCatalogInfoFromContext](/windows/win32/api/mscat/nf-mscat-cryptcatcataloginfofromcontext) to get the filename of the catalog, and then call [CryptCATOpen](/windows/win32/api/mscat/nf-mscat-cryptcatopen) with that filename to open the catalog.
     * @see https://learn.microsoft.com/windows/win32/api/mscat/nf-mscat-cryptcatadminenumcatalogfromhash
     * @since windows5.1.2600
     */
    static CryptCATAdminEnumCatalogFromHash(hCatAdmin, pbHash, cbHash, phPrevCatInfo) {
        static dwFlags := 0 ;Reserved parameters must always be NULL

        A_LastError := 0

        result := DllCall("WINTRUST.dll\CryptCATAdminEnumCatalogFromHash", "ptr", hCatAdmin, "ptr", pbHash, "uint", cbHash, "uint", dwFlags, "ptr*", phPrevCatInfo, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Calculates the hash for a file.
     * @param {Pointer<Void>} hFile A handle to the file whose hash is being calculated. This parameter cannot be <b>NULL</b> and must be a valid file handle.
     * @param {Pointer<UInt32>} pcbHash A pointer to a <b>DWORD</b> variable that contains the number of bytes in <i>pbHash</i>. Upon input, set <i>pcbHash</i>  to the number of bytes allocated for <i>pbHash</i>. Upon return, <i>pcbHash</i> contains the number of returned bytes in  <i>pbHash</i>. If <i>pbHash</i> is passed as <b>NULL</b>, then <i>pcbHash</i> contains the number of bytes to allocate for  <i>pbHash</i>.
     * @param {Pointer} pbHash A pointer to a <b>BYTE</b> buffer that receives the hash. If this parameter is passed in as <b>NULL</b>, then <i>pcbHash</i> contains the number of bytes to allocate for  <i>pbHash</i>, and a subsequent call can be made to retrieve the hash.
     * @returns {Integer} The return value is <b>TRUE</b> if the function succeeds; <b>FALSE</b> if the function fails. If <b>FALSE</b> is returned, call the <b>GetLastError</b> function to determine the reason for failure. If not enough memory has been allocated for <i>pbHash</i>, the <b>CryptCATAdminCalcHashFromFileHandle</b> function will set the last error to ERROR_INSUFFICIENT_BUFFER.
     * @see https://learn.microsoft.com/windows/win32/api/mscat/nf-mscat-cryptcatadmincalchashfromfilehandle
     * @since windows5.1.2600
     */
    static CryptCATAdminCalcHashFromFileHandle(hFile, pcbHash, pbHash) {
        static dwFlags := 0 ;Reserved parameters must always be NULL

        result := DllCall("WINTRUST.dll\CryptCATAdminCalcHashFromFileHandle", "ptr", hFile, "uint*", pcbHash, "ptr", pbHash, "uint", dwFlags, "int")
        return result
    }

    /**
     * Calculates the hash for a file by using the specified algorithm.
     * @remarks
     * The amount of time this function takes to execute depends on the length of the file being hashed, the algorithm being used, and the file location. For example, it takes several seconds to calculate the hash of a local file that is very large (a few hundred megabytes).
     * @param {Pointer} hCatAdmin Handle of an open catalog administrator context. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/mscat/nf-mscat-cryptcatadminacquirecontext2">CryptCATAdminAcquireContext2</a>.
     * @param {Pointer<Void>} hFile A handle to the file whose hash is being calculated. This parameter cannot be <b>NULL</b> and must be a valid file handle.
     * @param {Pointer<UInt32>} pcbHash Pointer to a <b>DWORD</b> variable that contains the number of bytes in the <i>pbHash</i> parameter. Upon input, set <i>pcbHash</i>  to the number of bytes allocated for <i>pbHash</i>. Upon return, <i>pcbHash</i> contains the number of returned bytes in  <i>pbHash</i>. If <i>pbHash</i> is set to <b>NULL</b>, then <i>pcbHash</i> contains the number of bytes to allocate for  <i>pbHash</i>.
     * @param {Pointer} pbHash Pointer to a <b>BYTE</b> buffer that receives the hash. If you set this parameter  to <b>NULL</b>, then <i>pcbHash</i> will contain the number of bytes to allocate for  <i>pbHash</i>, and a subsequent call can be made to retrieve the hash.
     * @returns {Integer} If the function succeeds, the return value is nonzero (<b>TRUE</b>).
     * 
     * If the function fails, the return value is zero (<b>FALSE</b>). For extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following table lists the error codes most commonly returned by the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hFile</i> parameter must not be <b>NULL</b>.
     * 
     * The <i>hFile</i> parameter must be a valid file handle.
     * 
     * The <i>pcbHash</i> parameter must not be <b>NULL</b>.
     * 
     * The <i>dwFlags</i> parameter must be zero (0).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by the <i>pbHash</i> parameter was not <b>NULL</b> but was not large enough to be written. The correct size of the required buffer is contained in the value pointed to by the <i>pcbHash</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NTE_BAD_ALGID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The hash algorithm specified by the <i>pwszHashAlgorithm</i> parameter cannot be found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mscat/nf-mscat-cryptcatadmincalchashfromfilehandle2
     * @since windows8.0
     */
    static CryptCATAdminCalcHashFromFileHandle2(hCatAdmin, hFile, pcbHash, pbHash) {
        static dwFlags := 0 ;Reserved parameters must always be NULL

        A_LastError := 0

        result := DllCall("WINTRUST.dll\CryptCATAdminCalcHashFromFileHandle2", "ptr", hCatAdmin, "ptr", hFile, "uint*", pcbHash, "ptr", pbHash, "uint", dwFlags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Adds a catalog to the catalog database.
     * @param {Pointer} hCatAdmin Handle previously assigned by the  <a href="https://docs.microsoft.com/windows/desktop/api/mscat/nf-mscat-cryptcatadminacquirecontext">CryptCATAdminAcquireContext</a> function.
     * @param {Pointer<Char>} pwszCatalogFile A pointer to a <b>null</b>-terminated string for the fully qualified path of the catalog to be added.
     * @param {Pointer<Char>} pwszSelectBaseName A pointer to a <b>null</b>-terminated string for the name of the catalog when it is stored. If the parameter is <b>NULL</b>, then a unique name will be generated for the catalog.
     * @param {Integer} dwFlags If the CRYPTCAT_ADDCATALOG_HARDLINK (0x00000001) flag is specified, the catalog specified in the call will be hard-linked to rather than copied. Hard-linking instead of copying a catalog reduces the amount of disk space required by Windows.
     * @returns {Pointer} If the function succeeds, the return value is a handle to the catalog information context. If the function fails, the return value is <b>NULL</b>. After you have finished using the returned handle, free it by calling the  <a href="https://docs.microsoft.com/windows/desktop/api/mscat/nf-mscat-cryptcatadminreleasecatalogcontext">CryptCATAdminReleaseCatalogContext</a> function.
     * 
     * For extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function. For a complete list of error codes provided by the operating system, see <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mscat/nf-mscat-cryptcatadminaddcatalog
     * @since windows5.1.2600
     */
    static CryptCATAdminAddCatalog(hCatAdmin, pwszCatalogFile, pwszSelectBaseName, dwFlags) {
        pwszCatalogFile := pwszCatalogFile is String? StrPtr(pwszCatalogFile) : pwszCatalogFile
        pwszSelectBaseName := pwszSelectBaseName is String? StrPtr(pwszSelectBaseName) : pwszSelectBaseName

        A_LastError := 0

        result := DllCall("WINTRUST.dll\CryptCATAdminAddCatalog", "ptr", hCatAdmin, "ptr", pwszCatalogFile, "ptr", pwszSelectBaseName, "uint", dwFlags, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Deletes a catalog file and removes that catalog's entry from the Windows catalog database.
     * @param {Pointer} hCatAdmin Handle previously assigned by the  <a href="https://docs.microsoft.com/windows/desktop/api/mscat/nf-mscat-cryptcatadminacquirecontext">CryptCATAdminAcquireContext</a> function.
     * @param {Pointer<Char>} pwszCatalogFile A pointer to a null-terminated string for the name of the catalog to remove. This string must contain only the name, without any path information.
     * @param {Integer} dwFlags This parameter is reserved for future use and must be set to zero.
     * @returns {Integer} The return value is <b>TRUE</b> if the function succeeds; <b>FALSE</b> if the function fails.
     * 
     * For extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function. For a complete list of error codes provided by the operating system, see <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mscat/nf-mscat-cryptcatadminremovecatalog
     * @since windows5.1.2600
     */
    static CryptCATAdminRemoveCatalog(hCatAdmin, pwszCatalogFile, dwFlags) {
        pwszCatalogFile := pwszCatalogFile is String? StrPtr(pwszCatalogFile) : pwszCatalogFile

        A_LastError := 0

        result := DllCall("WINTRUST.dll\CryptCATAdminRemoveCatalog", "ptr", hCatAdmin, "ptr", pwszCatalogFile, "uint", dwFlags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves catalog information from a specified catalog context.
     * @param {Pointer} hCatInfo A handle to the catalog context. This value cannot be <b>NULL</b>.
     * @param {Pointer<CATALOG_INFO>} psCatInfo A pointer to the [CATALOG_INFO](/windows/desktop/api/mscat/ns-mscat-catalog_info) structure. This value cannot be <b>NULL</b>. Upon return from this function, the <i>wszCatalogFile</i> member of the CATALOG_INFO structure contains the catalog file name.
     * @param {Integer} dwFlags Unused; set to zero.
     * @returns {Integer} The return value is <b>TRUE</b> if the function succeeds; <b>FALSE</b> if the function fails.
     * 
     * For extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function. For a complete list of error codes provided by the operating system, see <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mscat/nf-mscat-cryptcatcataloginfofromcontext
     * @since windows5.1.2600
     */
    static CryptCATCatalogInfoFromContext(hCatInfo, psCatInfo, dwFlags) {
        A_LastError := 0

        result := DllCall("WINTRUST.dll\CryptCATCatalogInfoFromContext", "ptr", hCatInfo, "ptr", psCatInfo, "uint", dwFlags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the fully qualified path of the specified catalog.
     * @param {Pointer} hCatAdmin A handle that was previously assigned by the  <a href="https://docs.microsoft.com/windows/desktop/api/mscat/nf-mscat-cryptcatadminacquirecontext">CryptCATAdminAcquireContext</a> function.
     * @param {Pointer<Char>} pwszCatalogFile The name of the catalog file for which to retrieve the fully qualified path.
     * @param {Pointer<CATALOG_INFO>} psCatInfo A pointer to the [CATALOG_INFO](/windows/desktop/api/mscat/ns-mscat-catalog_info) structure. This value cannot be <b>NULL</b>. Upon return from this function, the <i>wszCatalogFile</i> member of the <b>CATALOG_INFO</b> structure contains the catalog file name.
     * @param {Integer} dwFlags This parameter is reserved and must be set to zero.
     * @returns {Integer} Returns nonzero if successful or zero otherwise.
     * 
     * For extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function. For a complete list of error codes provided by the operating system, see <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mscat/nf-mscat-cryptcatadminresolvecatalogpath
     * @since windows5.1.2600
     */
    static CryptCATAdminResolveCatalogPath(hCatAdmin, pwszCatalogFile, psCatInfo, dwFlags) {
        pwszCatalogFile := pwszCatalogFile is String? StrPtr(pwszCatalogFile) : pwszCatalogFile

        A_LastError := 0

        result := DllCall("WINTRUST.dll\CryptCATAdminResolveCatalogPath", "ptr", hCatAdmin, "ptr", pwszCatalogFile, "ptr", psCatInfo, "uint", dwFlags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Integer} fResume 
     * @returns {Integer} 
     */
    static CryptCATAdminPauseServiceForBackup(dwFlags, fResume) {
        result := DllCall("WINTRUST.dll\CryptCATAdminPauseServiceForBackup", "uint", dwFlags, "int", fResume, "int")
        return result
    }

    /**
     * Enumerates the individual file members in the CatalogFiles section of a catalog definition file (CDF).
     * @remarks
     * You typically call this function in a loop to enumerate all of the catalog file members in a CDF. Before entering the loop, set *pwszPrevCDFTag* to **NULL**. The function returns a pointer to the first member. Set *pwszPrevCDFTag* to the return value of the function for subsequent iterations of the loop.
     * @param {Pointer<CRYPTCATCDF>} pCDF A pointer to a [**CRYPTCATCDF**](/windows/win32/api/mscat/ns-mscat-cryptcatcdf) structure.
     * @param {Pointer<Char>} pwszPrevCDFTag A pointer to a **null**-terminated string that identifies the catalog file member.
     * @param {Pointer<PFN_CDF_PARSE_ERROR_CALLBACK>} pfnParseError A pointer to a user-defined function to handle file parse errors.
     * @param {Pointer<CRYPTCATMEMBER>} ppMember A pointer to a [**CRYPTCATMEMBER**](/windows/win32/api/mscat/ns-mscat-cryptcatmember) structure that contains the file member information.
     * @param {Integer} fContinueOnError A value that specifies whether to keep in memory a reference to the last enumerated member.
     * @param {Pointer<Void>} pvReserved This parameter is reserved; do not use it.
     * @returns {Pointer<Char>} Upon success, this function returns a pointer to a **null**-terminated string that identifies a file member in the **CatalogFiles** section of a CDF. The **CryptCATCDFEnumMembersByCDFTagEx** function returns a **NULL** pointer if it fails.
     * @see https://learn.microsoft.com/windows/win32/SecCrypto/cryptcatcdfenummembersbycdftagex
     */
    static CryptCATCDFEnumMembersByCDFTagEx(pCDF, pwszPrevCDFTag, pfnParseError, ppMember, fContinueOnError, pvReserved) {
        pwszPrevCDFTag := pwszPrevCDFTag is String? StrPtr(pwszPrevCDFTag) : pwszPrevCDFTag

        result := DllCall("WINTRUST.dll\CryptCATCDFEnumMembersByCDFTagEx", "ptr", pCDF, "ptr", pwszPrevCDFTag, "ptr", pfnParseError, "ptr", ppMember, "int", fContinueOnError, "ptr", pvReserved, "char*")
        return result
    }

    /**
     * Enumerates the attributes of member files in the CatalogFiles section of a catalog definition file (CDF).
     * @remarks
     * You typically call this function in a loop to enumerate all of the catalog file member attributes in a CDF. Before entering the loop, set *pPrevAttr* to **NULL**. The function returns a pointer to the first attribute. Set *pPrevAttr* to the return value of the function for subsequent iterations of the loop.
     * @param {Pointer<CRYPTCATCDF>} pCDF A pointer to a [**CRYPTCATCDF**](/windows/win32/api/mscat/ns-mscat-cryptcatcdf) structure.
     * @param {Pointer<Char>} pwszMemberTag A pointer to a **null**-terminated string that identifies the catalog file member.
     * @param {Pointer<CRYPTCATMEMBER>} pMember A pointer to a [**CRYPTCATMEMBER**](/windows/win32/api/mscat/ns-mscat-cryptcatmember) structure that contains the member information.
     * @param {Pointer<CRYPTCATATTRIBUTE>} pPrevAttr A pointer to a [**CRYPTCATATTRIBUTE**](/windows/win32/api/mscat/ns-mscat-cryptcatattribute) structure for a file member attribute in the CDF pointed to by *pCDF*.
     * @param {Pointer<PFN_CDF_PARSE_ERROR_CALLBACK>} pfnParseError A pointer to a user-defined function to handle file parse errors.
     * @returns {Pointer} Upon success, this function returns a pointer to a [**CRYPTCATATTRIBUTE**](/windows/win32/api/mscat/ns-mscat-cryptcatattribute) structure. The **CryptCATCDFEnumAttributesWithCDFTag** function returns a **NULL** pointer if it fails.
     * @see https://learn.microsoft.com/windows/win32/SecCrypto/cryptcatcdfenumattributeswithcdftag
     */
    static CryptCATCDFEnumAttributesWithCDFTag(pCDF, pwszMemberTag, pMember, pPrevAttr, pfnParseError) {
        pwszMemberTag := pwszMemberTag is String? StrPtr(pwszMemberTag) : pwszMemberTag

        result := DllCall("WINTRUST.dll\CryptCATCDFEnumAttributesWithCDFTag", "ptr", pCDF, "ptr", pwszMemberTag, "ptr", pMember, "ptr", pPrevAttr, "ptr", pfnParseError)
        return result
    }

;@endregion Methods
}
