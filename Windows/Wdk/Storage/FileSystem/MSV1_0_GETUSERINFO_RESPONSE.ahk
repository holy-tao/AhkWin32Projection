#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Security\Authentication\Identity\MSV1_0_PROTOCOL_MESSAGE_TYPE.ahk
#Include ..\..\..\Win32\Security\Authentication\Identity\SECURITY_LOGON_TYPE.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class MSV1_0_GETUSERINFO_RESPONSE extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {MSV1_0_PROTOCOL_MESSAGE_TYPE}
     */
    MessageType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {PSID}
     */
    UserSid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    UserName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer}
     */
    LogonDomainName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer}
     */
    LogonServer {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {SECURITY_LOGON_TYPE}
     */
    LogonType {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }
}
