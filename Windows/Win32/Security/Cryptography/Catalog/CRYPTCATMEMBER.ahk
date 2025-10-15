#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include ..\..\..\Foundation\HANDLE.ahk
#Include ..\CRYPT_INTEGER_BLOB.ahk

/**
 * The CRYPTCATMEMBER structure provides information about a catalog member. This structure is used by the CryptCATGetMemberInfo and CryptCATEnumerateAttr functions.
 * @see https://docs.microsoft.com/windows/win32/api//mscat/ns-mscat-cryptcatmember
 * @namespace Windows.Win32.Security.Cryptography.Catalog
 * @version v4.0.30319
 */
class CRYPTCATMEMBER extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a null-terminated string that contains the reference tag value.
     * @type {PWSTR}
     */
    pwszReferenceTag{
        get {
            if(!this.HasProp("__pwszReferenceTag"))
                this.__pwszReferenceTag := PWSTR(this.ptr + 8)
            return this.__pwszReferenceTag
        }
    }

    /**
     * A pointer to a null-terminated string that contains the file name.
     * @type {PWSTR}
     */
    pwszFileName{
        get {
            if(!this.HasProp("__pwszFileName"))
                this.__pwszFileName := PWSTR(this.ptr + 16)
            return this.__pwszFileName
        }
    }

    /**
     * <b>GUID</b> that identifies the subject type.
     * @type {Pointer<Guid>}
     */
    gSubjectType {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Value that specifies the member flags.
     * @type {Integer}
     */
    fdwMemberFlags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * A pointer to a <b>SIP_INDIRECT_DATA</b> structure.
     * @type {Pointer<SIP_INDIRECT_DATA>}
     */
    pIndirectData {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Value that specifies the certificate version.
     * @type {Integer}
     */
    dwCertVersion {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Reserved; do not use.
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Reserved; do not use.
     * @type {HANDLE}
     */
    hReserved{
        get {
            if(!this.HasProp("__hReserved"))
                this.__hReserved := HANDLE(this.ptr + 56)
            return this.__hReserved
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_ATTR_BLOB</a> structure that contains encoded indirect data.
     * @type {CRYPT_INTEGER_BLOB}
     */
    sEncodedIndirectData{
        get {
            if(!this.HasProp("__sEncodedIndirectData"))
                this.__sEncodedIndirectData := CRYPT_INTEGER_BLOB(this.ptr + 64)
            return this.__sEncodedIndirectData
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_ATTR_BLOB</a> structure that contains encoded member information.
     * @type {CRYPT_INTEGER_BLOB}
     */
    sEncodedMemberInfo{
        get {
            if(!this.HasProp("__sEncodedMemberInfo"))
                this.__sEncodedMemberInfo := CRYPT_INTEGER_BLOB(this.ptr + 80)
            return this.__sEncodedMemberInfo
        }
    }
}
