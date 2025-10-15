#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

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
                this.__PeerMacAddrProxyArray := Win32FixedArray(this.ptr + 0, 6, Primitive, "char")
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
     * @type {BOOLEAN}
     */
    bDelete{
        get {
            if(!this.HasProp("__bDelete"))
                this.__bDelete := BOOLEAN(this.ptr + 16)
            return this.__bDelete
        }
    }

    /**
     * @type {BOOLEAN}
     */
    bStatic{
        get {
            if(!this.HasProp("__bStatic"))
                this.__bStatic := BOOLEAN(this.ptr + 17)
            return this.__bStatic
        }
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
