#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CRYPT_XML_GROUP_ID.ahk" { CRYPT_XML_GROUP_ID }

/**
 * Contains algorithm information.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_algorithm_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_XML_ALGORITHM_INFO {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * A pointer to a null-terminated Unicode string that contains the URI associated with the attribute of the <b>SignatureMethod</b> or <b>DigestMethod</b> element of the XML signature.
     */
    wszAlgorithmURI : PWSTR

    /**
     * Optional. A pointer to a null-terminated Unicode string that contains the display name of the algorithm.
     */
    wszName : PWSTR

    dwGroupId : CRYPT_XML_GROUP_ID

    /**
     * A pointer to a null-terminated Unicode string that contains an algorithm identifier string that is passed to  Cryptography API: Next Generation (CNG) functions. CNG functions use algorithm identifier strings, such as L"SHA1", instead of the <b>ALG_ID</b> data type constants, such as CALG_SHA1.
     * 
     * 
     * <div class="alert"><b>Note</b>  BCrypt* and NCrypt* functions are defined in Bcrypt.h and Ncrypt.h.</div>
     * <div> </div>
     */
    wszCNGAlgid : PWSTR

    /**
     * A pointer to a null-terminated Unicode string that contains an extra algorithm string, other than the string in the <b>pwszCNGAlgid</b> member, that is passed to CNG functions.
     * 
     * 
     * <div class="alert"><b>Note</b>  BCrypt* and NCrypt* functions are defined in Bcrypt.h and Ncrypt.h.</div>
     * <div> </div>
     */
    wszCNGExtraAlgid : PWSTR

    /**
     * A <b>DWORD</b> value that contains flag values to be  passed to the <a href="https://docs.microsoft.com/windows/desktop/api/ncrypt/nf-ncrypt-ncryptsignhash">NCryptSignHash</a> function.
     */
    dwSignFlags : UInt32

    /**
     * A <b>DWORD</b> value that is passed to the <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptverifysignature">BCryptVerifySignature</a> function.
     */
    dwVerifyFlags : UInt32

    /**
     * A pointer to a structure that contains padding information to be passed to the <a href="https://docs.microsoft.com/windows/desktop/api/ncrypt/nf-ncrypt-ncryptsignhash">NCryptSignHash</a> or <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptverifysignature">BCryptVerifySignature</a> function. The actual type of structure this member points to depends on the value of the <b>dwGroupId</b> member.
     */
    pvPaddingInfo : IntPtr

    /**
     * Optional. A pointer to a structure that contains extra information that can be passed to the CNG functions.
     * 
     * 
     * <div class="alert"><b>Note</b>  BCrypt* and NCrypt* functions are defined in Bcrypt.h and Ncrypt.h.</div>
     * <div> </div>
     */
    pvExtraInfo : IntPtr

}
