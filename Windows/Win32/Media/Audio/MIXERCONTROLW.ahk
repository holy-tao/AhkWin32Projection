#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/mmeapi/ns-mmeapi-mixercontrolw
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 * @charset Unicode
 */
class MIXERCONTROLW extends Win32Struct
{
    static sizeof => 232

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
        get => StrGet(this.ptr + 20, 15, "UTF-16")
        set => StrPut(value, this.ptr + 20, 15, "UTF-16")
    }

    /**
     * @type {String}
     */
    szName {
        get => StrGet(this.ptr + 52, 63, "UTF-16")
        set => StrPut(value, this.ptr + 52, 63, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    lMinimum {
        get => NumGet(this, 184, "int")
        set => NumPut("int", value, this, 184)
    }

    /**
     * @type {Integer}
     */
    lMaximum {
        get => NumGet(this, 188, "int")
        set => NumPut("int", value, this, 188)
    }

    /**
     * @type {Integer}
     */
    dwMinimum {
        get => NumGet(this, 184, "uint")
        set => NumPut("uint", value, this, 184)
    }

    /**
     * @type {Integer}
     */
    dwMaximum {
        get => NumGet(this, 188, "uint")
        set => NumPut("uint", value, this, 188)
    }

    /**
     * @type {Array<UInt32>}
     */
    dwReserved{
        get {
            if(!this.HasProp("__dwReservedProxyArray"))
                this.__dwReservedProxyArray := Win32FixedArray(this.ptr + 184, 6, Primitive, "uint")
            return this.__dwReservedProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    cSteps {
        get => NumGet(this, 208, "uint")
        set => NumPut("uint", value, this, 208)
    }

    /**
     * @type {Integer}
     */
    cbCustomData {
        get => NumGet(this, 208, "uint")
        set => NumPut("uint", value, this, 208)
    }
}
