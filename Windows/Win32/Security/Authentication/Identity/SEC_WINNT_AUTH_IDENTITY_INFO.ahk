#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\System\Rpc\SEC_WINNT_AUTH_IDENTITY_W.ahk" { SEC_WINNT_AUTH_IDENTITY_W }
#Import "..\..\..\System\Rpc\SEC_WINNT_AUTH_IDENTITY_A.ahk" { SEC_WINNT_AUTH_IDENTITY_A }
#Import ".\SEC_WINNT_AUTH_IDENTITY_EXA.ahk" { SEC_WINNT_AUTH_IDENTITY_EXA }
#Import ".\SEC_WINNT_AUTH_IDENTITY_EXW.ahk" { SEC_WINNT_AUTH_IDENTITY_EXW }
#Import "..\..\..\System\Rpc\SEC_WINNT_AUTH_IDENTITY.ahk" { SEC_WINNT_AUTH_IDENTITY }
#Import ".\SEC_WINNT_AUTH_IDENTITY_EX2.ahk" { SEC_WINNT_AUTH_IDENTITY_EX2 }

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
 */
export default struct SEC_WINNT_AUTH_IDENTITY_INFO {
    #StructPack 8

    /**
     * The **AuthIdExw** authentication identity.
     */
    AuthIdExw : SEC_WINNT_AUTH_IDENTITY_EXW

    static __New() {
        DefineProp(this.Prototype, 'AuthIdExa', { type: SEC_WINNT_AUTH_IDENTITY_EXA, offset: 0 })
        DefineProp(this.Prototype, 'AuthId_a', { type: SEC_WINNT_AUTH_IDENTITY_A, offset: 0 })
        DefineProp(this.Prototype, 'AuthId_w', { type: SEC_WINNT_AUTH_IDENTITY_W, offset: 0 })
        DefineProp(this.Prototype, 'AuthIdEx2', { type: SEC_WINNT_AUTH_IDENTITY_EX2, offset: 0 })
        this.DeleteProp("__New")
    }
}
