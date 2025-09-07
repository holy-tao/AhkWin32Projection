#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class MSV1_0_NTLM3_RESPONSE extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Array<Byte>}
     */
    Response{
        get {
            if(!this.HasProp("__ResponseProxyArray"))
                this.__ResponseProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__ResponseProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    RespType {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    HiRespType {
        get => NumGet(this, 17, "char")
        set => NumPut("char", value, this, 17)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * @type {Integer}
     */
    MsgWord {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    TimeStamp {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Array<Byte>}
     */
    ChallengeFromClient{
        get {
            if(!this.HasProp("__ChallengeFromClientProxyArray"))
                this.__ChallengeFromClientProxyArray := Win32FixedArray(this.ptr + 32, 1, Primitive, "char")
            return this.__ChallengeFromClientProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    AvPairsOff {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Array<Byte>}
     */
    Buffer{
        get {
            if(!this.HasProp("__BufferProxyArray"))
                this.__BufferProxyArray := Win32FixedArray(this.ptr + 44, 1, Primitive, "char")
            return this.__BufferProxyArray
        }
    }
}
