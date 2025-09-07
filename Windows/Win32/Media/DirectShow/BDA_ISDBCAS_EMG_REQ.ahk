#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class BDA_ISDBCAS_EMG_REQ extends Win32Struct
{
    static sizeof => 15

    static packingSize => 1

    /**
     * @type {Integer}
     */
    bCLA {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    bINS {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    bP1 {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    bP2 {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Integer}
     */
    bLC {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {Array<Byte>}
     */
    bCardId{
        get {
            if(!this.HasProp("__bCardIdProxyArray"))
                this.__bCardIdProxyArray := Win32FixedArray(this.ptr + 5, 1, Primitive, "char")
            return this.__bCardIdProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    bProtocol {
        get => NumGet(this, 11, "char")
        set => NumPut("char", value, this, 11)
    }

    /**
     * @type {Integer}
     */
    bCABroadcasterGroupId {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    bMessageControl {
        get => NumGet(this, 13, "char")
        set => NumPut("char", value, this, 13)
    }

    /**
     * @type {Array<Byte>}
     */
    bMessageCode{
        get {
            if(!this.HasProp("__bMessageCodeProxyArray"))
                this.__bMessageCodeProxyArray := Win32FixedArray(this.ptr + 14, 1, Primitive, "char")
            return this.__bMessageCodeProxyArray
        }
    }
}
