#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\MS_ADDINFO_FLAT.ahk" { MS_ADDINFO_FLAT }
#Import "..\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\MS_ADDINFO_BLOB.ahk" { MS_ADDINFO_BLOB }
#Import ".\MS_ADDINFO_DETACHEDSIG.ahk" { MS_ADDINFO_DETACHEDSIG }
#Import "..\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import "..\Catalog\MS_ADDINFO_CATALOGMEMBER.ahk" { MS_ADDINFO_CATALOGMEMBER }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Specifies subject information data to the subject interface package (SIP) APIs.
 * @remarks
 * Upon first use of the <b>SIP_SUBJECTINFO</b> structure, initialize the entire structure to binary zero. Do not initialize the structure between SIP function calls.
 * 
 * Subjects include, but are not limited to, portable executable images (.exe), cabinet (.cab) images, flat files, and catalog files. Each subject type uses a different subset of its data for hash calculation and requires a different procedure for storage and retrieval. Therefore each subject type has a unique subject interface package specification.
 * @see https://learn.microsoft.com/windows/win32/api/mssip/ns-mssip-sip_subjectinfo
 * @namespace Windows.Win32.Security.Cryptography.Sip
 */
export default struct SIP_SUBJECTINFO {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * A pointer to a <b>GUID</b> structure that identifies the subject type.
     */
    pgSubjectType : Guid.Ptr

    /**
     * A file handle that represents the subject. If the storage type of the subject is a file, set <i>hFile</i> to <b>INVALID_HANDLE_VALUE</b> and set the <i>pwsFileName</i> parameter to the name of the file.
     */
    hFile : HANDLE

    /**
     * A pointer to a null-terminated Unicode string that contains the file name of the subject.
     */
    pwsFileName : PWSTR

    /**
     * A pointer to a null-terminated Unicode string that contains the display name of 
     *                                                 the subject.
     */
    pwsDisplayName : PWSTR

    /**
     * This member is reserved for future use.
     */
    dwReserved1 : UInt32

    /**
     * This member is reserved. Do not modify  this member. It is used by the SIP to pass the internal version number
     *                                                 between get and verify functions.
     */
    dwIntVersion : UInt32

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/hcryptprov">HCRYPTPROV</a> handle to the cryptography provider.
     */
    hProv : IntPtr

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that contains the identifier for the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hash</a> algorithm used to hash the file.
     */
    DigestAlgorithm : CRYPT_ALGORITHM_IDENTIFIER

    /**
     * A value that modifies the behavior of the functions that use this structure. For more information about possible values for this member, see the <i>dwFlags</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/signersignex">SignerSignEx</a>.
     */
    dwFlags : UInt32

    /**
     * A value that specifies the encoding type used for the file. Currently, only <b>X509_ASN_ENCODING</b> and <b>PKCS_7_ASN_ENCODING</b> are being used; however, additional encoding types may be added in the future. For either current encoding type, use: <b>X509_ASN_ENCODING</b> | <b>PKCS_7_ASN_ENCODING</b>.
     */
    dwEncodingType : UInt32

    /**
     * This member is reserved  for future use.
     */
    dwReserved2 : UInt32

    /**
     * This member is not used.
     */
    fdwCAPISettings : UInt32

    /**
     * This member is not used.
     */
    fdwSecuritySettings : UInt32

    /**
     * The message index of the last call to <b>CryptSIPGetSignedDataMsg</b>. operation.
     */
    dwIndex : UInt32

    /**
     * Specifies the type of additional information provided.
     * 
     * <table>
     * <tr>
     * <th>Defined constant/value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MSSIP_ADDINFO_NONE"></a><a id="mssip_addinfo_none"></a><dl>
     * <dt><b>MSSIP_ADDINFO_NONE</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is no additional information about the subject.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MSSIP_ADDINFO_FLAT"></a><a id="mssip_addinfo_flat"></a><dl>
     * <dt><b>MSSIP_ADDINFO_FLAT</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The additional information is a flat file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MSSIP_ADDINFO_CATMEMBER"></a><a id="mssip_addinfo_catmember"></a><dl>
     * <dt><b>MSSIP_ADDINFO_CATMEMBER</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The additional information is a catalog member.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MSSIP_ADDINFO_BLOB"></a><a id="mssip_addinfo_blob"></a><dl>
     * <dt><b>MSSIP_ADDINFO_BLOB</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The additional information is a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MSSIP_ADDINFO_NONMSSIP"></a><a id="mssip_addinfo_nonmssip"></a><dl>
     * <dt><b>MSSIP_ADDINFO_NONMSSIP</b></dt>
     * <dt>500</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The additional information is in a user defined format.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwUnionChoice : UInt32

    psFlat : MS_ADDINFO_FLAT.Ptr

    /**
     * A pointer to SIP-specific data.
     */
    pClientData : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'psCatMember', { type: MS_ADDINFO_CATALOGMEMBER.Ptr, offset: 112 })
        DefineProp(this.Prototype, 'psBlob', { type: MS_ADDINFO_BLOB.Ptr, offset: 112 })
        DefineProp(this.Prototype, 'psDetachedSig', { type: MS_ADDINFO_DETACHEDSIG.Ptr, offset: 112 })
        this.DeleteProp("__New")
    }
}
