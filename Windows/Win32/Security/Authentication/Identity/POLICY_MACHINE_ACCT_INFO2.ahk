#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\PSID.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class POLICY_MACHINE_ACCT_INFO2 extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Rid {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PSID}
     */
    Sid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Guid}
     */
    ObjectGuid {
        get {
            if(!this.HasProp("__ObjectGuid"))
                this.__ObjectGuid := Guid(16, this)
            return this.__ObjectGuid
        }
    }
}
