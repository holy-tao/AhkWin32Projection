#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class PORT_DATA_1 extends Win32Struct
{
    static sizeof => 964

    static packingSize => 4

    /**
     * @type {String}
     */
    sztPortName {
        get => StrGet(this.ptr + 0, 63, "UTF-16")
        set => StrPut(value, this.ptr + 0, 63, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    dwProtocol {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 140, "uint")
        set => NumPut("uint", value, this, 140)
    }

    /**
     * @type {String}
     */
    sztHostAddress {
        get => StrGet(this.ptr + 144, 48, "UTF-16")
        set => StrPut(value, this.ptr + 144, 48, "UTF-16")
    }

    /**
     * @type {String}
     */
    sztSNMPCommunity {
        get => StrGet(this.ptr + 242, 32, "UTF-16")
        set => StrPut(value, this.ptr + 242, 32, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwDoubleSpool {
        get => NumGet(this, 308, "uint")
        set => NumPut("uint", value, this, 308)
    }

    /**
     * @type {String}
     */
    sztQueue {
        get => StrGet(this.ptr + 312, 32, "UTF-16")
        set => StrPut(value, this.ptr + 312, 32, "UTF-16")
    }

    /**
     * @type {String}
     */
    sztIPAddress {
        get => StrGet(this.ptr + 378, 15, "UTF-16")
        set => StrPut(value, this.ptr + 378, 15, "UTF-16")
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 410, 1, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dwPortNumber {
        get => NumGet(this, 952, "uint")
        set => NumPut("uint", value, this, 952)
    }

    /**
     * @type {Integer}
     */
    dwSNMPEnabled {
        get => NumGet(this, 956, "uint")
        set => NumPut("uint", value, this, 956)
    }

    /**
     * @type {Integer}
     */
    dwSNMPDevIndex {
        get => NumGet(this, 960, "uint")
        set => NumPut("uint", value, this, 960)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 964
    }
}
