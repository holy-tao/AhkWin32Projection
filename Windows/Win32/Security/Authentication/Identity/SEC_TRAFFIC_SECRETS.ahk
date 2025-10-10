#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SEC_TRAFFIC_SECRETS extends Win32Struct
{
    static sizeof => 400

    static packingSize => 4

    /**
     * @type {String}
     */
    SymmetricAlgId {
        get => StrGet(this.ptr + 0, 63, "UTF-16")
        set => StrPut(value, this.ptr + 0, 63, "UTF-16")
    }

    /**
     * @type {String}
     */
    ChainingMode {
        get => StrGet(this.ptr + 128, 63, "UTF-16")
        set => StrPut(value, this.ptr + 128, 63, "UTF-16")
    }

    /**
     * @type {String}
     */
    HashAlgId {
        get => StrGet(this.ptr + 256, 63, "UTF-16")
        set => StrPut(value, this.ptr + 256, 63, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    KeySize {
        get => NumGet(this, 384, "ushort")
        set => NumPut("ushort", value, this, 384)
    }

    /**
     * @type {Integer}
     */
    IvSize {
        get => NumGet(this, 386, "ushort")
        set => NumPut("ushort", value, this, 386)
    }

    /**
     * @type {Integer}
     */
    MsgSequenceStart {
        get => NumGet(this, 388, "ushort")
        set => NumPut("ushort", value, this, 388)
    }

    /**
     * @type {Integer}
     */
    MsgSequenceEnd {
        get => NumGet(this, 390, "ushort")
        set => NumPut("ushort", value, this, 390)
    }

    /**
     * @type {Integer}
     */
    TrafficSecretType {
        get => NumGet(this, 392, "int")
        set => NumPut("int", value, this, 392)
    }

    /**
     * @type {Integer}
     */
    TrafficSecretSize {
        get => NumGet(this, 396, "ushort")
        set => NumPut("ushort", value, this, 396)
    }

    /**
     * @type {Array<Byte>}
     */
    TrafficSecret{
        get {
            if(!this.HasProp("__TrafficSecretProxyArray"))
                this.__TrafficSecretProxyArray := Win32FixedArray(this.ptr + 398, 1, Primitive, "char")
            return this.__TrafficSecretProxyArray
        }
    }
}
