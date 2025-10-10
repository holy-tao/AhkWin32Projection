#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used by delegate folders in place of a standard ITEMIDLIST structure.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/ns-shobjidl_core-delegateitemid
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class DELEGATEITEMID extends Win32Struct
{
    static sizeof => 8

    static packingSize => 2

    /**
     * Type: <b>WORD</b>
     * 
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Type: <b>WORD</b>
     * 
     * Private data owned by the delegating (outer) folder.
     * @type {Integer}
     */
    wOuter {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Type: <b>WORD</b>
     * 
     * The size, in bytes, of the delegate's data. The first <b>cbInner</b> bytes of the <b>rgb</b> array contain this data. The remaining data in <b>rgb</b> belongs to the outer folder.
     * @type {Integer}
     */
    cbInner {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Type: <b>BYTE[1]</b>
     * 
     * An array holding the inner folder's data, which is opaque to the outer folder, followed by outer folder's data.
     * @type {Array<Byte>}
     */
    rgb{
        get {
            if(!this.HasProp("__rgbProxyArray"))
                this.__rgbProxyArray := Win32FixedArray(this.ptr + 6, 1, Primitive, "char")
            return this.__rgbProxyArray
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 8
    }
}
