#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\KERB_PROTOCOL_MESSAGE_TYPE.ahk
#Include ..\..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class KERB_CHANGEMACHINEPASSWORD_REQUEST extends Win32Struct {
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
     * @type {BOOLEAN}
     */
    ForcePasswordChange {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }
}
