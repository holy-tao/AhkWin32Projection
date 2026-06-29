#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import "..\Sip\SIP_INDIRECT_DATA.ahk" { SIP_INDIRECT_DATA }
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * The CRYPTCATMEMBER structure provides information about a catalog member. This structure is used by the CryptCATGetMemberInfo and CryptCATEnumerateAttr functions.
 * @see https://learn.microsoft.com/windows/win32/api/mscat/ns-mscat-cryptcatmember
 * @namespace Windows.Win32.Security.Cryptography.Catalog
 */
export default struct CRYPTCATMEMBER {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbStruct : UInt32

    /**
     * A pointer to a null-terminated string that contains the reference tag value.
     */
    pwszReferenceTag : PWSTR

    /**
     * A pointer to a null-terminated string that contains the file name.
     */
    pwszFileName : PWSTR

    /**
     * <b>GUID</b> that identifies the subject type.
     */
    gSubjectType : Guid

    /**
     * Value that specifies the member flags.
     */
    fdwMemberFlags : UInt32

    /**
     * A pointer to a <b>SIP_INDIRECT_DATA</b> structure.
     */
    pIndirectData : SIP_INDIRECT_DATA.Ptr

    /**
     * Value that specifies the certificate version.
     */
    dwCertVersion : UInt32

    /**
     * Reserved; do not use.
     */
    dwReserved : UInt32

    /**
     * Reserved; do not use.
     */
    hReserved : HANDLE

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_ATTR_BLOB</a> structure that contains encoded indirect data.
     */
    sEncodedIndirectData : CRYPT_INTEGER_BLOB

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_ATTR_BLOB</a> structure that contains encoded member information.
     */
    sEncodedMemberInfo : CRYPT_INTEGER_BLOB

}
