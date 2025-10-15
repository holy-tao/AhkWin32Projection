#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Used to contain the name of a CNG key storage provider.
 * @see https://docs.microsoft.com/windows/win32/api//ncrypt/ns-ncrypt-ncryptprovidername
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class NCryptProviderName extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer to a null-terminated Unicode string that contains the name of the provider.
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
     * A pointer to a null-terminated Unicode string that contains optional text for the provider.
     * @type {PWSTR}
     */
    pszComment{
        get {
            if(!this.HasProp("__pszComment"))
                this.__pszComment := PWSTR(this.ptr + 8)
            return this.__pszComment
        }
    }
}
