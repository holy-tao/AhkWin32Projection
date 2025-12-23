#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains algorithm information.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_algorithm_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_XML_ALGORITHM_INFO extends Win32Struct
{
    static sizeof => 72

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
     * A pointer to a null-terminated Unicode string that contains the URI associated with the attribute of the <b>SignatureMethod</b> or <b>DigestMethod</b> element of the XML signature.
     * @type {PWSTR}
     */
    wszAlgorithmURI {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Optional. A pointer to a null-terminated Unicode string that contains the display name of the algorithm.
     * @type {PWSTR}
     */
    wszName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * 
     * @type {Integer}
     */
    dwGroupId {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * A pointer to a null-terminated Unicode string that contains an algorithm identifier string that is passed to  Cryptography API: Next Generation (CNG) functions. CNG functions use algorithm identifier strings, such as L"SHA1", instead of the <b>ALG_ID</b> data type constants, such as CALG_SHA1.
     * 
     * 
     * <div class="alert"><b>Note</b>  BCrypt* and NCrypt* functions are defined in Bcrypt.h and Ncrypt.h.</div>
     * <div> </div>
     * @type {PWSTR}
     */
    wszCNGAlgid {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A pointer to a null-terminated Unicode string that contains an extra algorithm string, other than the string in the <b>pwszCNGAlgid</b> member, that is passed to CNG functions.
     * 
     * 
     * <div class="alert"><b>Note</b>  BCrypt* and NCrypt* functions are defined in Bcrypt.h and Ncrypt.h.</div>
     * <div> </div>
     * @type {PWSTR}
     */
    wszCNGExtraAlgid {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A <b>DWORD</b> value that contains flag values to be  passed to the <a href="https://docs.microsoft.com/windows/desktop/api/ncrypt/nf-ncrypt-ncryptsignhash">NCryptSignHash</a> function.
     * @type {Integer}
     */
    dwSignFlags {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * A <b>DWORD</b> value that is passed to the <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptverifysignature">BCryptVerifySignature</a> function.
     * @type {Integer}
     */
    dwVerifyFlags {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * A pointer to a structure that contains padding information to be passed to the <a href="https://docs.microsoft.com/windows/desktop/api/ncrypt/nf-ncrypt-ncryptsignhash">NCryptSignHash</a> or <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptverifysignature">BCryptVerifySignature</a> function. The actual type of structure this member points to depends on the value of the <b>dwGroupId</b> member.
     * @type {Pointer<Void>}
     */
    pvPaddingInfo {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Optional. A pointer to a structure that contains extra information that can be passed to the CNG functions.
     * 
     * 
     * <div class="alert"><b>Note</b>  BCrypt* and NCrypt* functions are defined in Bcrypt.h and Ncrypt.h.</div>
     * <div> </div>
     * @type {Pointer<Void>}
     */
    pvExtraInfo {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 72
    }
}
