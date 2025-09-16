#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\CRYPT_INTEGER_BLOB.ahk
#Include ..\CRYPT_ALGORITHM_IDENTIFIER.ahk

/**
 * Specifies subject information data to the subject interface package (SIP) APIs.
 * @remarks
 * Upon first use of the <b>SIP_SUBJECTINFO</b> structure, initialize the entire structure to binary zero. Do not initialize the structure between SIP function calls.
  * 
  * Subjects include, but are not limited to, portable executable images (.exe), cabinet (.cab) images, flat files, and catalog files. Each subject type uses a different subset of its data for hash calculation and requires a different procedure for storage and retrieval. Therefore each subject type has a unique subject interface package specification.
 * @see https://learn.microsoft.com/windows/win32/api/mssip/ns-mssip-sip_subjectinfo
 * @namespace Windows.Win32.Security.Cryptography.Sip
 * @version v4.0.30319
 */
class SIP_SUBJECTINFO extends Win32Struct
{
    static sizeof => 128

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
     * A pointer to a <b>GUID</b> structure that identifies the subject type.
     * @type {Pointer<Guid>}
     */
    pgSubjectType {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A file handle that represents the subject. If the storage type of the subject is a file, set <i>hFile</i> to <b>INVALID_HANDLE_VALUE</b> and set the <i>pwsFileName</i> parameter to the name of the file.
     * @type {Pointer<HANDLE>}
     */
    hFile {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to a null-terminated Unicode string that contains the file name of the subject.
     * @type {Pointer<PWSTR>}
     */
    pwsFileName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to a null-terminated Unicode string that contains the display name of 
     *                                                 the subject.
     * @type {Pointer<PWSTR>}
     */
    pwsDisplayName {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * This member is reserved for future use.
     * @type {Integer}
     */
    dwReserved1 {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * This member is reserved. Do not modify  this member. It is used by the SIP to pass the internal version number
     *                                                 between get and verify functions.
     * @type {Integer}
     */
    dwIntVersion {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/hcryptprov">HCRYPTPROV</a> handle to the cryptography provider.
     * @type {Pointer}
     */
    hProv {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that contains the identifier for the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hash</a> algorithm used to hash the file.
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    DigestAlgorithm{
        get {
            if(!this.HasProp("__DigestAlgorithm"))
                this.__DigestAlgorithm := CRYPT_ALGORITHM_IDENTIFIER(this.ptr + 56)
            return this.__DigestAlgorithm
        }
    }

    /**
     * A value that modifies the behavior of the functions that use this structure. For more information about possible values for this member, see the <i>dwFlags</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/signersignex">SignerSignEx</a>.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * A value that specifies the encoding type used for the file. Currently, only <b>X509_ASN_ENCODING</b> and <b>PKCS_7_ASN_ENCODING</b> are being used; however, additional encoding types may be added in the future. For either current encoding type, use: <b>X509_ASN_ENCODING</b> | <b>PKCS_7_ASN_ENCODING</b>.
     * @type {Integer}
     */
    dwEncodingType {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * This member is reserved  for future use.
     * @type {Integer}
     */
    dwReserved2 {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * This member is not used.
     * @type {Integer}
     */
    fdwCAPISettings {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * This member is not used.
     * @type {Integer}
     */
    fdwSecuritySettings {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * The message index of the last call to <b>CryptSIPGetSignedDataMsg</b>. operation.
     * @type {Integer}
     */
    dwIndex {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

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
     * @type {Integer}
     */
    dwUnionChoice {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * @type {Pointer<MS_ADDINFO_FLAT>}
     */
    psFlat {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Pointer<MS_ADDINFO_CATALOGMEMBER>}
     */
    psCatMember {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Pointer<MS_ADDINFO_BLOB>}
     */
    psBlob {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * A pointer to SIP-specific data.
     * @type {Pointer<Void>}
     */
    pClientData {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 128
    }
}
