#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_MANUFACTURING_TEST extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dot11ManufacturingTestType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    uBufferLength {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<Byte>}
     */
    ucBuffer{
        get {
            if(!this.HasProp("__ucBufferProxyArray"))
                this.__ucBufferProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__ucBufferProxyArray
        }
    }
}
