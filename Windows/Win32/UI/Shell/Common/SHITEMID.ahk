#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Defines an item identifier.
 * @see https://learn.microsoft.com/windows/win32/api/shtypes/ns-shtypes-shitemid
 * @namespace Windows.Win32.UI.Shell.Common
 * @version v4.0.30319
 */
class SHITEMID extends Win32Struct
{
    static sizeof => 3

    static packingSize => 1

    /**
     * Type: <b>USHORT</b>
     * 
     * The size of identifier, in bytes, including <b>cb</b> itself.
     * @type {Integer}
     */
    cb {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Type: <b>BYTE[1]</b>
     * 
     * A variable-length item identifier.
     * @type {Array<Byte>}
     */
    abID{
        get {
            if(!this.HasProp("__abIDProxyArray"))
                this.__abIDProxyArray := Win32FixedArray(this.ptr + 2, 1, Primitive, "char")
            return this.__abIDProxyArray
        }
    }
}
