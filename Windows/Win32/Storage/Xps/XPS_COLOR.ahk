#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The contents of the XPS_COLOR structure when the colorType is XPS_COLOR_TYPE_CONTEXT.
 * @remarks
 * For information about how to interpret or apply the values in this structure's members, see the <a href="https://www.ecma-international.org/activities/XML%20Paper%20Specification/XPS%20Standard%20WD%201.6.pdf">XML Paper Specification</a>.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_color
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class XPS_COLOR extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    colorType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    alpha {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    red {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * @type {Integer}
     */
    green {
        get => NumGet(this, 10, "char")
        set => NumPut("char", value, this, 10)
    }

    /**
     * @type {Integer}
     */
    blue {
        get => NumGet(this, 11, "char")
        set => NumPut("char", value, this, 11)
    }

    /**
     * @type {Float}
     */
    red1 {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * @type {Float}
     */
    green1 {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * @type {Float}
     */
    blue1 {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    channelCount {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {Array<Single>}
     */
    channels{
        get {
            if(!this.HasProp("__channelsProxyArray"))
                this.__channelsProxyArray := Win32FixedArray(this.ptr + 12, 4, Primitive, "float")
            return this.__channelsProxyArray
        }
    }
}
