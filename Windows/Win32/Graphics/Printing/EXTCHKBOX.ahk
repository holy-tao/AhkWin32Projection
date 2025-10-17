#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class EXTCHKBOX extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Pointer<SByte>}
     */
    pTitle {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<SByte>}
     */
    pSeparator {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<SByte>}
     */
    pCheckedName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer}
     */
    IconID {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
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

    /**
     * @type {Array<UIntPtr>}
     */
    dwReserved{
        get {
            if(!this.HasProp("__dwReservedProxyArray"))
                this.__dwReservedProxyArray := Win32FixedArray(this.ptr + 48, 2, Primitive, "ptr")
            return this.__dwReservedProxyArray
        }
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 64
    }
}
