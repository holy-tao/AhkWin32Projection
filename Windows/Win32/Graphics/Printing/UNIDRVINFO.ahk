#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\INVOC.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class UNIDRVINFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    flGenFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    wType {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    fCaps {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * @type {Integer}
     */
    wXRes {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    wYRes {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }

    /**
     * @type {Integer}
     */
    sYAdjust {
        get => NumGet(this, 16, "short")
        set => NumPut("short", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    sYMoved {
        get => NumGet(this, 18, "short")
        set => NumPut("short", value, this, 18)
    }

    /**
     * @type {Integer}
     */
    wPrivateData {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    sShift {
        get => NumGet(this, 22, "short")
        set => NumPut("short", value, this, 22)
    }

    /**
     * @type {INVOC}
     */
    SelectFont{
        get {
            if(!this.HasProp("__SelectFont"))
                this.__SelectFont := INVOC(24, this)
            return this.__SelectFont
        }
    }

    /**
     * @type {INVOC}
     */
    UnSelectFont{
        get {
            if(!this.HasProp("__UnSelectFont"))
                this.__UnSelectFont := INVOC(32, this)
            return this.__UnSelectFont
        }
    }

    /**
     * @type {Array<UInt16>}
     */
    wReserved{
        get {
            if(!this.HasProp("__wReservedProxyArray"))
                this.__wReservedProxyArray := Win32FixedArray(this.ptr + 40, 4, Primitive, "ushort")
            return this.__wReservedProxyArray
        }
    }
}
