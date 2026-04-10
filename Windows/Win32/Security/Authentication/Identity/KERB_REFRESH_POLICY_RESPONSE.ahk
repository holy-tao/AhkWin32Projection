#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\KERB_PROTOCOL_MESSAGE_TYPE.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class KERB_REFRESH_POLICY_RESPONSE extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {KERB_PROTOCOL_MESSAGE_TYPE}
     */
    MessageType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
