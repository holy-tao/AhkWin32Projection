#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The MSV1_0_SUPPLEMENTAL_CREDENTIAL structure is used to pass credentials into MSV1_0 from Kerberos or custom authentication package.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/ns-ntsecapi-msv1_0_supplemental_credential
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class MSV1_0_SUPPLEMENTAL_CREDENTIAL extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

    /**
     * Specifies the version number of the credential structure and related credential content.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Contains the  LM password. The size of this array is defined by the constant <b>MSV1_0_OWF_PASSWORD_LENGTH</b>. When you have finished using the password, remove the sensitive information from memory by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a>. For more information on protecting the password, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/handling-passwords">Handling Passwords</a>.
     * @type {Array<Byte>}
     */
    LmPassword{
        get {
            if(!this.HasProp("__LmPasswordProxyArray"))
                this.__LmPasswordProxyArray := Win32FixedArray(this.ptr + 8, 16, Primitive, "char")
            return this.__LmPasswordProxyArray
        }
    }

    /**
     * A string that contains the Windows password. The size of this array is defined by the constant <b>MSV1_0_OWF_PASSWORD_LENGTH</b>. When you have finished using the password, remove the sensitive information from memory by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a>.
     * @type {Array<Byte>}
     */
    NtPassword{
        get {
            if(!this.HasProp("__NtPasswordProxyArray"))
                this.__NtPasswordProxyArray := Win32FixedArray(this.ptr + 24, 16, Primitive, "char")
            return this.__NtPasswordProxyArray
        }
    }
}
