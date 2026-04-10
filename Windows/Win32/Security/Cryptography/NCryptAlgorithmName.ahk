#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NCRYPT_ALGORITHM_NAME_CLASS.ahk
#Include .\NCRYPT_OPERATION.ahk

/**
 * Used to contain information about a CNG algorithm.
 * @see https://learn.microsoft.com/windows/win32/api/ncrypt/ns-ncrypt-ncryptalgorithmname
 * @namespace Windows.Win32.Security.Cryptography
 */
class NCryptAlgorithmName extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * A pointer to a null-terminated Unicode string that contains the name of the algorithm. This can be one of the standard <a href="https://docs.microsoft.com/windows/desktop/SecCNG/cng-algorithm-identifiers">CNG Algorithm Identifiers</a> or the identifier for another registered algorithm.
     * @type {PWSTR}
     */
    pszName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {NCRYPT_ALGORITHM_NAME_CLASS}
     */
    dwClass {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {NCRYPT_OPERATION}
     */
    dwAlgOperations {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * A set of flags that provide more information about the algorithm.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
