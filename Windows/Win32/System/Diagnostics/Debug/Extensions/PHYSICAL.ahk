#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk

/**
 * Contains a handle and text description corresponding to a physical monitor.
 * @remarks
 * A physical monitor description is always an array of 128 characters.
 * @see https://learn.microsoft.com/windows/win32/api//content/physicalmonitorenumerationapi/ns-physicalmonitorenumerationapi-physical_monitor
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class PHYSICAL extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Address {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    BufLen {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<Byte>}
     */
    Buf{
        get {
            if(!this.HasProp("__BufProxyArray"))
                this.__BufProxyArray := Win32FixedArray(this.ptr + 12, 1, Primitive, "char")
            return this.__BufProxyArray
        }
    }
}
