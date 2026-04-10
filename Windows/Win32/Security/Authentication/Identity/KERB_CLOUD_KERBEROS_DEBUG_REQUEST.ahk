#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\KERB_PROTOCOL_MESSAGE_TYPE.ahk
#Include ..\..\..\Foundation\LUID.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class KERB_CLOUD_KERBEROS_DEBUG_REQUEST extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {KERB_PROTOCOL_MESSAGE_TYPE}
     */
    MessageType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {LUID}
     */
    LogonId {
        get {
            if(!this.HasProp("__LogonId"))
                this.__LogonId := LUID(4, this)
            return this.__LogonId
        }
    }
}
