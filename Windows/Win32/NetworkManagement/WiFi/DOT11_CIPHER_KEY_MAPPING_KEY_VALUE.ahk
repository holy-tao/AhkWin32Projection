#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_CIPHER_KEY_MAPPING_KEY_VALUE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {Array<Byte>}
     */
    PeerMacAddr{
        get {
            if(!this.HasProp("__PeerMacAddrProxyArray"))
                this.__PeerMacAddrProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__PeerMacAddrProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    AlgorithmId {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Direction {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    bDelete {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    bStatic {
        get => NumGet(this, 17, "char")
        set => NumPut("char", value, this, 17)
    }

    /**
     * @type {Integer}
     */
    usKeyLength {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * @type {Array<Byte>}
     */
    ucKey{
        get {
            if(!this.HasProp("__ucKeyProxyArray"))
                this.__ucKeyProxyArray := Win32FixedArray(this.ptr + 20, 1, Primitive, "char")
            return this.__ucKeyProxyArray
        }
    }
}
