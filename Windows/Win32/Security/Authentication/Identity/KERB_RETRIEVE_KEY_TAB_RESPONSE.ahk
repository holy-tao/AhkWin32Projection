#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\KERB_PROTOCOL_MESSAGE_TYPE.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class KERB_RETRIEVE_KEY_TAB_RESPONSE extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

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
    KeyTabLength {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<Integer>}
     */
    KeyTab {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
