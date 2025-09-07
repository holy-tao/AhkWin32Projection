#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Is used with the BCryptEnumAlgorithms function to contain a cryptographic algorithm identifier.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-bcrypt_algorithm_identifier
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class BCRYPT_ALGORITHM_IDENTIFIER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer to a null-terminated Unicode string that contains the string identifier of the algorithm. The <a href="https://docs.microsoft.com/windows/desktop/SecCNG/cng-algorithm-identifiers">CNG Algorithm Identifiers</a> topic contains the predefined algorithm identifiers.
     * @type {PWSTR}
     */
    pszName{
        get {
            if(!this.HasProp("__pszName"))
                this.__pszName := PWSTR(this.ptr + 0)
            return this.__pszName
        }
    }

    /**
     * Specifies the class of the algorithm. This can be one of the <a href="https://docs.microsoft.com/windows/desktop/SecCNG/cng-interface-identifiers">CNG Interface Identifiers</a>.
     * @type {Integer}
     */
    dwClass {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A set of flags that specify other information about the algorithm. There are currently no flags defined for this member.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
