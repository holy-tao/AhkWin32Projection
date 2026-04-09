#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Security\Authentication\Identity\MSV1_0_PROTOCOL_MESSAGE_TYPE.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class MSV1_0_GETCHALLENRESP_REQUEST_V1 extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {MSV1_0_PROTOCOL_MESSAGE_TYPE}
     */
    MessageType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ParameterControl {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer}
     */
    LogonId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    Password {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Array<Integer>}
     */
    ChallengeToClient {
        get {
            if(!this.HasProp("__ChallengeToClientProxyArray"))
                this.__ChallengeToClientProxyArray := Win32FixedArray(this.ptr + 24, 8, Primitive, "char")
            return this.__ChallengeToClientProxyArray
        }
    }
}
