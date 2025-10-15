#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\PSID.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class POLICY_MACHINE_ACCT_INFO2 extends Win32Struct
{
    static sizeof => 24

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
    Sid{
        get {
            if(!this.HasProp("__Sid"))
                this.__Sid := PSID(this.ptr + 8)
            return this.__Sid
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    ObjectGuid {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
