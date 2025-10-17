#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\SEC_WINNT_AUTH_IDENTITY_EXW.ahk
#Include .\SEC_WINNT_AUTH_IDENTITY_EXA.ahk
#Include ..\..\..\System\Rpc\SEC_WINNT_AUTH_IDENTITY_A.ahk
#Include ..\..\..\System\Rpc\SEC_WINNT_AUTH_IDENTITY_W.ahk
#Include .\SEC_WINNT_AUTH_IDENTITY_EX2.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SEC_WINNT_AUTH_IDENTITY_INFO extends Win32Struct
{
    static sizeof => 288

    static packingSize => 8

    /**
     * @type {SEC_WINNT_AUTH_IDENTITY_EXW}
     */
    AuthIdExw{
        get {
            if(!this.HasProp("__AuthIdExw"))
                this.__AuthIdExw := SEC_WINNT_AUTH_IDENTITY_EXW(0, this)
            return this.__AuthIdExw
        }
    }

    /**
     * @type {SEC_WINNT_AUTH_IDENTITY_EXA}
     */
    AuthIdExa{
        get {
            if(!this.HasProp("__AuthIdExa"))
                this.__AuthIdExa := SEC_WINNT_AUTH_IDENTITY_EXA(0, this)
            return this.__AuthIdExa
        }
    }

    /**
     * @type {SEC_WINNT_AUTH_IDENTITY_A}
     */
    AuthId_a{
        get {
            if(!this.HasProp("__AuthId_a"))
                this.__AuthId_a := SEC_WINNT_AUTH_IDENTITY_A(0, this)
            return this.__AuthId_a
        }
    }

    /**
     * @type {SEC_WINNT_AUTH_IDENTITY_W}
     */
    AuthId_w{
        get {
            if(!this.HasProp("__AuthId_w"))
                this.__AuthId_w := SEC_WINNT_AUTH_IDENTITY_W(0, this)
            return this.__AuthId_w
        }
    }

    /**
     * @type {SEC_WINNT_AUTH_IDENTITY_EX2}
     */
    AuthIdEx2{
        get {
            if(!this.HasProp("__AuthIdEx2"))
                this.__AuthIdEx2 := SEC_WINNT_AUTH_IDENTITY_EX2(0, this)
            return this.__AuthIdEx2
        }
    }
}
