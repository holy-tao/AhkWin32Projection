#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Security\Authentication\Identity\MSV1_0_PROTOCOL_MESSAGE_TYPE.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class MSV1_0_GETUSERINFO_REQUEST extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {MSV1_0_PROTOCOL_MESSAGE_TYPE}
     */
    MessageType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    LogonId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
