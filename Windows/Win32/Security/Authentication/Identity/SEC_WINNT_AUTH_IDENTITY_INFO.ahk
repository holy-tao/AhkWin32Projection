#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\SEC_WINNT_AUTH_IDENTITY_EXW.ahk
#Include .\SEC_WINNT_AUTH_IDENTITY_EXA.ahk
#Include ..\..\..\System\Rpc\SEC_WINNT_AUTH_IDENTITY_A.ahk
#Include ..\..\..\System\Rpc\SEC_WINNT_AUTH_IDENTITY_W.ahk
#Include .\SEC_WINNT_AUTH_IDENTITY_EX2.ahk

/**
 * Contains the identity information for authentication.
 * @remarks
 * How to parse a **SEC_WINNT_AUTH_IDENTITY_INFO** structure:
  * 
  * 1. First, check the first **DWORD** of **SEC_WINNT_AUTH_IDENTITY_INFO**. If the first **DWORD** is **0x200**, it is either an **AuthIdExw** or **AuthIdExA**. Otherwise, if the first **DWORD** is **0x201**, the structure is an **AuthIdEx2** structure. Otherwise, the structure is either an **AuthId_a** or an **AuthId_w**.
  * 
  * 1. Secondly, check the flags for **SEC_WINNT_AUTH_IDENTITY_ANSI** or **SEC_WINNT_AUTH_IDENTITY_UNICODE**. The presence of the former means the structure is an ANSI structure. Otherwise, the structure is the wide version. Note that **AuthIdEx2** does not have an ANSI version, so this check does not apply to it.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_winnt_auth_identity_info
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SEC_WINNT_AUTH_IDENTITY_INFO extends Win32Struct
{
    static sizeof => 288

    static packingSize => 8

    /**
     * The **AuthIdExw** authentication identity.
     * @type {SEC_WINNT_AUTH_IDENTITY_EXW}
     */
    AuthIdExw{
        get {
            if(!this.HasProp("__AuthIdExw"))
                this.__AuthIdExw := SEC_WINNT_AUTH_IDENTITY_EXW(this.ptr + 0)
            return this.__AuthIdExw
        }
    }

    /**
     * The **AuthIdExa** authentication identity.
     * @type {SEC_WINNT_AUTH_IDENTITY_EXA}
     */
    AuthIdExa{
        get {
            if(!this.HasProp("__AuthIdExa"))
                this.__AuthIdExa := SEC_WINNT_AUTH_IDENTITY_EXA(this.ptr + 0)
            return this.__AuthIdExa
        }
    }

    /**
     * The **AuthId_a** authentication identity.
     * @type {SEC_WINNT_AUTH_IDENTITY_A}
     */
    AuthId_a{
        get {
            if(!this.HasProp("__AuthId_a"))
                this.__AuthId_a := SEC_WINNT_AUTH_IDENTITY_A(this.ptr + 0)
            return this.__AuthId_a
        }
    }

    /**
     * The **AuthId_w** authentication identity.
     * @type {SEC_WINNT_AUTH_IDENTITY_W}
     */
    AuthId_w{
        get {
            if(!this.HasProp("__AuthId_w"))
                this.__AuthId_w := SEC_WINNT_AUTH_IDENTITY_W(this.ptr + 0)
            return this.__AuthId_w
        }
    }

    /**
     * The **AuthIdEx2** authentication identity.
     * @type {SEC_WINNT_AUTH_IDENTITY_EX2}
     */
    AuthIdEx2{
        get {
            if(!this.HasProp("__AuthIdEx2"))
                this.__AuthIdEx2 := SEC_WINNT_AUTH_IDENTITY_EX2(this.ptr + 0)
            return this.__AuthIdEx2
        }
    }
}
