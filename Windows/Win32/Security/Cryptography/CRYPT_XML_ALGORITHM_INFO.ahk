#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

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
    wszAlgorithmURI{
        get {
            if(!this.HasProp("__wszAlgorithmURI"))
                this.__wszAlgorithmURI := PWSTR(this.ptr + 8)
            return this.__wszAlgorithmURI
        }
    }

    /**
     * Optional. A pointer to a null-terminated Unicode string that contains the display name of the algorithm.
     * @type {PWSTR}
     */
    wszName{
        get {
            if(!this.HasProp("__wszName"))
                this.__wszName := PWSTR(this.ptr + 16)
            return this.__wszName
        }
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
    wszCNGAlgid{
        get {
            if(!this.HasProp("__wszCNGAlgid"))
                this.__wszCNGAlgid := PWSTR(this.ptr + 32)
            return this.__wszCNGAlgid
        }
    }

    /**
     * A pointer to a null-terminated Unicode string that contains an extra algorithm string, other than the string in the <b>pwszCNGAlgid</b> member, that is passed to CNG functions.
     * 
     * 
     * <div class="alert"><b>Note</b>  BCrypt* and NCrypt* functions are defined in Bcrypt.h and Ncrypt.h.</div>
     * <div> </div>
     * @type {PWSTR}
     */
    wszCNGExtraAlgid{
        get {
            if(!this.HasProp("__wszCNGExtraAlgid"))
                this.__wszCNGExtraAlgid := PWSTR(this.ptr + 40)
            return this.__wszCNGExtraAlgid
        }
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

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 72
    }
}
