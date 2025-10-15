#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\PSID.ahk

/**
 * The LSA_ENUMERATION_INFORMATION structure is used with the LsaEnumerateAccountsWithUserRight function to return a pointer to a SID.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/ns-ntsecapi-lsa_enumeration_information
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class LSA_ENUMERATION_INFORMATION extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Pointer to a SID.
     * @type {PSID}
     */
    Sid{
        get {
            if(!this.HasProp("__Sid"))
                this.__Sid := PSID(this.ptr + 0)
            return this.__Sid
        }
    }
}
