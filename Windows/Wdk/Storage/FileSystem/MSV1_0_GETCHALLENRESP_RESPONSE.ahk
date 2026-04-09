#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Security\Authentication\Identity\MSV1_0_PROTOCOL_MESSAGE_TYPE.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class MSV1_0_GETCHALLENRESP_RESPONSE extends Win32Struct {
    static sizeof => 64

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
    CaseSensitiveChallengeResponse {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    CaseInsensitiveChallengeResponse {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer}
     */
    UserName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer}
     */
    LogonDomainName {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Array<Integer>}
     */
    UserSessionKey {
        get {
            if(!this.HasProp("__UserSessionKeyProxyArray"))
                this.__UserSessionKeyProxyArray := Win32FixedArray(this.ptr + 40, 16, Primitive, "char")
            return this.__UserSessionKeyProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    LanmanSessionKey {
        get {
            if(!this.HasProp("__LanmanSessionKeyProxyArray"))
                this.__LanmanSessionKeyProxyArray := Win32FixedArray(this.ptr + 56, 8, Primitive, "char")
            return this.__LanmanSessionKeyProxyArray
        }
    }
}
