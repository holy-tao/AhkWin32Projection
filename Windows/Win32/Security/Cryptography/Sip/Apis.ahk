#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.Sip
 * @version v4.0.30319
 */
class Sip {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static MSSIP_FLAGS_PROHIBIT_RESIZE_ON_CREATE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static MSSIP_FLAGS_USE_CATALOG => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static MSSIP_FLAGS_MULTI_HASH => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static SPC_RELAXED_PE_MARKER_CHECK => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static SPC_MARKER_CHECK_SKIP_SIP_INDIRECT_DATA_FLAG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SPC_MARKER_CHECK_CURRENTLY_SUPPORTED_FLAGS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MSSIP_ADDINFO_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MSSIP_ADDINFO_FLAT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MSSIP_ADDINFO_CATMEMBER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MSSIP_ADDINFO_BLOB => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MSSIP_ADDINFO_DETACHEDSIG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MSSIP_ADDINFO_NONMSSIP => 500

    /**
     * @type {Integer (UInt32)}
     */
    static SIP_CAP_SET_VERSION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SIP_CAP_SET_VERSION_3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SIP_CAP_SET_CUR_VER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SIP_CAP_FLAG_SEALING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SIP_MAX_MAGIC_NUMBER => 4
;@endregion Constants

;@region Methods
    /**
     * Retrieves an Authenticode signature from the file.
     * @param {Pointer<SIP_SUBJECTINFO>} pSubjectInfo A pointer to a [SIP_SUBJECTINFO](/windows/desktop/api/mssip/ns-mssip-sip_subjectinfo) structure that contains information about the message subject.
     * @param {Pointer<UInt32>} pdwEncodingType The encoding type of the Authenticode signature.
     * @param {Integer} dwIndex This parameter is reserved and should be set to zero.
     * @param {Pointer<UInt32>} pcbSignedDataMsg The length, in bytes, of the buffer pointed to by the <i>pbSignedDataMsg</i> parameter.
     * @param {Pointer<Byte>} pbSignedDataMsg A pointer to a buffer to receive the returned Authenticode signature. 
     * 
     * To determine the size of the buffer needed, set the <i>pbSignedDataMsg</i> parameter to <b>NULL</b> and call the <b>CryptSIPGetSignedDataMsg</b> function. This function will place the required size of the buffer, in bytes, in the value pointed to by <i>pcbSignedDataMsg</i>. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/retrieving-data-of-unknown-length">Retrieving Data of Unknown Length</a>.
     * @returns {Integer} If the function succeeds, the function returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. For extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Some possible error codes follow.
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
     * <dt><b>CRYPT_E_NO_MATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The signature specified by the index could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified data or file format of the <a href="/windows/desktop/SecGloss/s-gly">subject interface package</a> (SIP) is not valid.
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
     * The [SIP_SUBJECTINFO](/windows/desktop/api/mssip/ns-mssip-sip_subjectinfo) structure is a null pointer.
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
     * The size of the message buffer was insufficient to hold the retrieved data, the <i>pcbSignedDataMsg</i>parameter has been set to indicate the required buffer size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUST_E_SUBJECT_FORM_UNKNOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified subject type is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mssip/nf-mssip-cryptsipgetsigneddatamsg
     * @since windows5.1.2600
     */
    static CryptSIPGetSignedDataMsg(pSubjectInfo, pdwEncodingType, dwIndex, pcbSignedDataMsg, pbSignedDataMsg) {
        A_LastError := 0

        result := DllCall("WINTRUST.dll\CryptSIPGetSignedDataMsg", "ptr", pSubjectInfo, "uint*", pdwEncodingType, "uint", dwIndex, "uint*", pcbSignedDataMsg, "char*", pbSignedDataMsg, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Stores an Authenticode signature in the target file.
     * @param {Pointer<SIP_SUBJECTINFO>} pSubjectInfo Pointer to a [SIP_SUBJECTINFO](/windows/desktop/api/mssip/ns-mssip-sip_subjectinfo) structure that contains information about the message subject.
     * @param {Integer} dwEncodingType 
     * @param {Pointer<UInt32>} pdwIndex Pointer to the message index.
     * @param {Integer} cbSignedDataMsg Length, in bytes, of the buffer pointed to by the <i>pbSignedDataMsg</i> parameter.
     * @param {Pointer<Byte>} pbSignedDataMsg Pointer to the buffer that contains the message.
     * @returns {Integer} If the function succeeds, the function returns <b>TRUE</b>.
     * 
     * If the function fails, it returns  <b>FALSE</b>. For extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Some possible error codes follow.
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
     * <dt><b>ERROR_BAD_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified data or file format of the <a href="/windows/desktop/SecGloss/s-gly">subject interface package</a> (SIP) is not valid.
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
     * This code can be returned for the following reasons:
     * 
     * <ul>
     * <li>The <i>pSubjectInfo</i> is <b>NULL</b>.</li>
     * <li>The <i>pdwIndex</i> is <b>NULL</b>.</li>
     * <li>The <i>pbSignedDataMsg</i> is <b>NULL</b>.</li>
     * <li>The value of the <i>cbSignedDataMsg</i> parameter is less than one.</li>
     * [SIP_SUBJECTINFO](/windows/desktop/api/mssip/ns-mssip-sip_subjectinfo) structure.</li>
     * [SIP_SUBJECTINFO](/windows/desktop/api/mssip/ns-mssip-sip_subjectinfo) structure.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUST_E_SUBJECT_FORM_UNKNOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified subject type is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mssip/nf-mssip-cryptsipputsigneddatamsg
     * @since windows5.1.2600
     */
    static CryptSIPPutSignedDataMsg(pSubjectInfo, dwEncodingType, pdwIndex, cbSignedDataMsg, pbSignedDataMsg) {
        A_LastError := 0

        result := DllCall("WINTRUST.dll\CryptSIPPutSignedDataMsg", "ptr", pSubjectInfo, "uint", dwEncodingType, "uint*", pdwIndex, "uint", cbSignedDataMsg, "char*", pbSignedDataMsg, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Returns a SIP_INDIRECT_DATA structure that contains a hash of the supplied SIP_SUBJECTINFO structure, the digest algorithm, and an encoding attribute. The hash can be used as an indirect reference to the data.
     * @param {Pointer<SIP_SUBJECTINFO>} pSubjectInfo A pointer to a [SIP_SUBJECTINFO](/windows/desktop/api/mssip/ns-mssip-sip_subjectinfo) structure that contains the subject to which the indirect data reference will point.
     * @param {Pointer<UInt32>} pcbIndirectData A pointer to a [SIP_INDIRECT_DATA](/windows/desktop/api/mssip/ns-mssip-sip_indirect_data) structure.
     * @param {Pointer<SIP_INDIRECT_DATA>} pIndirectData A pointer to a [SIP_INDIRECT_DATA](/windows/desktop/api/mssip/ns-mssip-sip_indirect_data) structure to receive the catalog item.
     * @returns {Integer} The return value is <b>TRUE</b> if the function succeeds; otherwise, <b>FALSE</b>.
     * 
     * 
     * If this function returns <b>FALSE</b>, additional error information can be obtained by calling the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function. <b>GetLastError</b> will return one of the following error codes.
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
     * <dt><b>ERROR_BAD_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file or data format is not correct for the specified <a href="/windows/desktop/SecGloss/s-gly">subject interface package</a> (SIP) type.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was an error allocating memory.
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
     * The specified algorithm is not supported by the SIP.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUST_E_SUBJECT_FORM_UNKNOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subject type is not recognized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mssip/nf-mssip-cryptsipcreateindirectdata
     * @since windows5.1.2600
     */
    static CryptSIPCreateIndirectData(pSubjectInfo, pcbIndirectData, pIndirectData) {
        A_LastError := 0

        result := DllCall("WINTRUST.dll\CryptSIPCreateIndirectData", "ptr", pSubjectInfo, "uint*", pcbIndirectData, "ptr", pIndirectData, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Validates the indirect hashed data against the supplied subject.
     * @param {Pointer<SIP_SUBJECTINFO>} pSubjectInfo A pointer to a [SIP_SUBJECTINFO](/windows/desktop/api/mssip/ns-mssip-sip_subjectinfo) structure that contains information about the message subject.
     * @param {Pointer<SIP_INDIRECT_DATA>} pIndirectData A pointer to a [SIP_INDIRECT_DATA](/windows/desktop/api/mssip/ns-mssip-sip_indirect_data) structure that contains information about the hashed subject information.
     * @returns {Integer} The return value is <b>TRUE</b> if the function succeeds; otherwise, <b>FALSE</b>.
     * 
     * 
     * If this function returns <b>FALSE</b>, additional error information can be obtained by calling the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function. <b>GetLastError</b> will return one of the following error codes.
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
     * <dt><b>TRUST_E_SUBJECT_FORM_UNKNOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subject type is an unknown type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mssip/nf-mssip-cryptsipverifyindirectdata
     * @since windows5.1.2600
     */
    static CryptSIPVerifyIndirectData(pSubjectInfo, pIndirectData) {
        A_LastError := 0

        result := DllCall("WINTRUST.dll\CryptSIPVerifyIndirectData", "ptr", pSubjectInfo, "ptr", pIndirectData, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Removes a specified Authenticode signature.
     * @param {Pointer<SIP_SUBJECTINFO>} pSubjectInfo A pointer to a [SIP_SUBJECTINFO](/windows/desktop/api/mssip/ns-mssip-sip_subjectinfo) structure that contains information about the message subject.
     * @param {Integer} dwIndex This parameter is reserved and should be set to zero.
     * @returns {Integer} If the function succeeds, the function returns <b>TRUE</b>.
     * 
     * If the function fails, it returns  <b>FALSE</b>. For extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mssip/nf-mssip-cryptsipremovesigneddatamsg
     * @since windows5.1.2600
     */
    static CryptSIPRemoveSignedDataMsg(pSubjectInfo, dwIndex) {
        A_LastError := 0

        result := DllCall("WINTRUST.dll\CryptSIPRemoveSignedDataMsg", "ptr", pSubjectInfo, "uint", dwIndex, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Loads the dynamic-link library (DLL) that implements a subject interface package (SIP) and assigns appropriate library export functions to a SIP_DISPATCH_INFO structure.
     * @param {Pointer<Guid>} pgSubject A pointer to a GUID returned by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mssip/nf-mssip-cryptsipretrievesubjectguid">CryptSIPRetrieveSubjectGuid</a> function.
     * @param {Integer} dwFlags This parameter is reserved and must be set to zero.
     * @param {Pointer<SIP_DISPATCH_INFO>} pSipDispatch A pointer to a [SIP_DISPATCH_INFO](/windows/desktop/api/mssip/ns-mssip-sip_dispatch_info) structure that contains pointers to SIP provider functions that are specific to the subject type. The caller must initialize this structure to binary zeros, and set the <b>cbSize</b> member to <c>sizeof(SIP_DISPATCH_INFO)</c> before calling the <b>CryptSIPLoad</b> function.
     * @returns {Integer} If the function succeeds, the function returns <b>TRUE</b>.
     * 
     * If the function fails, it returns  <b>FALSE</b>. For extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mssip/nf-mssip-cryptsipload
     * @since windows5.1.2600
     */
    static CryptSIPLoad(pgSubject, dwFlags, pSipDispatch) {
        A_LastError := 0

        result := DllCall("CRYPT32.dll\CryptSIPLoad", "ptr", pgSubject, "uint", dwFlags, "ptr", pSipDispatch, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves a GUID based on the header information in a specified file.
     * @param {Pointer<Char>} FileName The name of the file.
     * @param {Pointer<Void>} hFileIn A handle to the file to check.
     * @param {Pointer<Guid>} pgSubject A GUID that identifies the subject.
     * @returns {Integer} If the function succeeds, the function returns <b>TRUE</b>.
     * 
     * If the function fails, it returns  <b>FALSE</b>. For extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mssip/nf-mssip-cryptsipretrievesubjectguid
     * @since windows5.1.2600
     */
    static CryptSIPRetrieveSubjectGuid(FileName, hFileIn, pgSubject) {
        FileName := FileName is String? StrPtr(FileName) : FileName

        A_LastError := 0

        result := DllCall("CRYPT32.dll\CryptSIPRetrieveSubjectGuid", "ptr", FileName, "ptr", hFileIn, "ptr", pgSubject, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the subject GUID associated with the specified file.
     * @param {Pointer<Char>} FileName The name of the file. If the <i>hFileIn</i> parameter is set, the value in this parameter is ignored.
     * @param {Pointer<Void>} hFileIn A handle to the file to check. This parameter must contain a valid handle if the <i>FileName</i> parameter is <b>NULL</b>.
     * @param {Pointer<Guid>} pgSubject A globally unique ID that identifies the subject.
     * @returns {Integer} The return value is <b>TRUE</b> if the function succeeds; otherwise, <b>FALSE</b>.
     * 
     * 
     * If this function returns <b>FALSE</b>, additional error information can be obtained by calling the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function. <b>GetLastError</b> will return one of the following error codes.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mssip/nf-mssip-cryptsipretrievesubjectguidforcatalogfile
     * @since windows5.1.2600
     */
    static CryptSIPRetrieveSubjectGuidForCatalogFile(FileName, hFileIn, pgSubject) {
        FileName := FileName is String? StrPtr(FileName) : FileName

        A_LastError := 0

        result := DllCall("CRYPT32.dll\CryptSIPRetrieveSubjectGuidForCatalogFile", "ptr", FileName, "ptr", hFileIn, "ptr", pgSubject, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The CryptSIPAddProvider function registers functions that are exported by a given DLL file that implements a Subject Interface Package (SIP).
     * @param {Pointer<SIP_ADD_NEWPROVIDER>} psNewProv A pointer to a [SIP_ADD_NEWPROVIDER](/windows/desktop/api/mssip/ns-mssip-sip_add_newprovider) structure that specifies the DLL file and function names to register.
     * @returns {Integer} The return value is <b>TRUE</b> if the function succeeds; <b>FALSE</b> if the function fails. If the function fails, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to determine the reason for failure.
     * @see https://docs.microsoft.com/windows/win32/api//mssip/nf-mssip-cryptsipaddprovider
     * @since windows5.1.2600
     */
    static CryptSIPAddProvider(psNewProv) {
        A_LastError := 0

        result := DllCall("CRYPT32.dll\CryptSIPAddProvider", "ptr", psNewProv, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Removes registry details of a Subject Interface Package (SIP) DLL file added by a previous call to the CryptSIPAddProvider function.
     * @param {Pointer<Guid>} pgProv A pointer to the GUID that identifies the SIP DLL  to remove.
     * @returns {Integer} The return value is <b>TRUE</b> if the function succeeds; <b>FALSE</b> if the function fails. If the function fails, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to determine the reason for failure.
     * @see https://docs.microsoft.com/windows/win32/api//mssip/nf-mssip-cryptsipremoveprovider
     * @since windows5.1.2600
     */
    static CryptSIPRemoveProvider(pgProv) {
        A_LastError := 0

        result := DllCall("CRYPT32.dll\CryptSIPRemoveProvider", "ptr", pgProv, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the capabilities of a subject interface package (SIP).
     * @remarks
     * 
     * Unlike other SIP functions, [SIP_DISPATCH_INFO](/windows/desktop/api/mssip/ns-mssip-sip_dispatch_info) structure. Instead, callers must map the object identifier (OID) to the function entry point.
     * 
     * 
     * @param {Pointer<SIP_SUBJECTINFO>} pSubjInfo Pointer to a [SIP_SUBJECTINFO](/windows/desktop/api/mssip/ns-mssip-sip_subjectinfo) structure that specifies subject information data to the SIP APIs.
     * @param {Pointer<SIP_CAP_SET_V3>} pCaps Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mssip/ns-mssip-sip_cap_set_v2">SIP_CAP_SET</a> structure that defines the capabilities of an SIP.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//mssip/nf-mssip-cryptsipgetcaps
     * @since windows8.0
     */
    static CryptSIPGetCaps(pSubjInfo, pCaps) {
        result := DllCall("WINTRUST.dll\CryptSIPGetCaps", "ptr", pSubjInfo, "ptr", pCaps, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<SIP_SUBJECTINFO>} pSubjectInfo 
     * @param {Pointer<Byte>} pSig 
     * @param {Integer} dwSig 
     * @param {Pointer<Byte>} pbDigest 
     * @param {Pointer<UInt32>} pcbDigest 
     * @returns {Integer} 
     */
    static CryptSIPGetSealedDigest(pSubjectInfo, pSig, dwSig, pbDigest, pcbDigest) {
        result := DllCall("WINTRUST.dll\CryptSIPGetSealedDigest", "ptr", pSubjectInfo, "char*", pSig, "uint", dwSig, "char*", pbDigest, "uint*", pcbDigest, "int")
        return result
    }

;@endregion Methods
}
