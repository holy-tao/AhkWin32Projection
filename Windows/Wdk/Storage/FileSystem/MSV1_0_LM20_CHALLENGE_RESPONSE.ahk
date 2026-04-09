#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Security\Authentication\Identity\MSV1_0_PROTOCOL_MESSAGE_TYPE.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class MSV1_0_LM20_CHALLENGE_RESPONSE extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {MSV1_0_PROTOCOL_MESSAGE_TYPE}
     */
    MessageType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Array<Integer>}
     */
    ChallengeToClient {
        get {
            if(!this.HasProp("__ChallengeToClientProxyArray"))
                this.__ChallengeToClientProxyArray := Win32FixedArray(this.ptr + 4, 8, Primitive, "char")
            return this.__ChallengeToClientProxyArray
        }
    }
}
