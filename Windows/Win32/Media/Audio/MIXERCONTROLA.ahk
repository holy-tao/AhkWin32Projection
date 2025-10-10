#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 * @charset ANSI
 */
class MIXERCONTROLA extends Win32Struct
{
    static sizeof => 152

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwControlID {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwControlType {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    fdwControl {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    cMultipleItems {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {String}
     */
    szShortName {
        get => StrGet(this.ptr + 20, 15, "UTF-8")
        set => StrPut(value, this.ptr + 20, 15, "UTF-8")
    }

    /**
     * @type {String}
     */
    szName {
        get => StrGet(this.ptr + 36, 63, "UTF-8")
        set => StrPut(value, this.ptr + 36, 63, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    lMinimum {
        get => NumGet(this, 104, "int")
        set => NumPut("int", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    lMaximum {
        get => NumGet(this, 108, "int")
        set => NumPut("int", value, this, 108)
    }

    /**
     * @type {Integer}
     */
    dwMinimum {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    dwMaximum {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * @type {Array<UInt32>}
     */
    dwReserved{
        get {
            if(!this.HasProp("__dwReservedProxyArray"))
                this.__dwReservedProxyArray := Win32FixedArray(this.ptr + 104, 6, Primitive, "uint")
            return this.__dwReservedProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    cSteps {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    cbCustomData {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }
}
