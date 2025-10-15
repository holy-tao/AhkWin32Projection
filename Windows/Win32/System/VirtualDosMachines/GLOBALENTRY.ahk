#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 * @version v4.0.30319
 */
class GLOBALENTRY extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

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
    dwAddress {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwBlockSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {HANDLE}
     */
    hBlock{
        get {
            if(!this.HasProp("__hBlock"))
                this.__hBlock := HANDLE(this.ptr + 16)
            return this.__hBlock
        }
    }

    /**
     * @type {Integer}
     */
    wcLock {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    wcPageLock {
        get => NumGet(this, 26, "ushort")
        set => NumPut("ushort", value, this, 26)
    }

    /**
     * @type {Integer}
     */
    wFlags {
        get => NumGet(this, 28, "ushort")
        set => NumPut("ushort", value, this, 28)
    }

    /**
     * @type {BOOL}
     */
    wHeapPresent{
        get {
            if(!this.HasProp("__wHeapPresent"))
                this.__wHeapPresent := BOOL(this.ptr + 32)
            return this.__wHeapPresent
        }
    }

    /**
     * @type {HANDLE}
     */
    hOwner{
        get {
            if(!this.HasProp("__hOwner"))
                this.__hOwner := HANDLE(this.ptr + 40)
            return this.__hOwner
        }
    }

    /**
     * @type {Integer}
     */
    wType {
        get => NumGet(this, 48, "ushort")
        set => NumPut("ushort", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    wData {
        get => NumGet(this, 50, "ushort")
        set => NumPut("ushort", value, this, 50)
    }

    /**
     * @type {Integer}
     */
    dwNext {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    dwNextAlt {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }
}
