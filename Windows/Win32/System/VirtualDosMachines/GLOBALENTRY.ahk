#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 * @version v4.0.30319
 */
class GLOBALENTRY extends Win32Struct
{
    static sizeof => 52

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
     * @type {Pointer<HANDLE>}
     */
    hBlock {
        get => NumGet(this, 12, "ptr")
        set => NumPut("ptr", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    wcLock {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    wcPageLock {
        get => NumGet(this, 22, "ushort")
        set => NumPut("ushort", value, this, 22)
    }

    /**
     * @type {Integer}
     */
    wFlags {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    wHeapPresent {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * @type {Pointer<HANDLE>}
     */
    hOwner {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    wType {
        get => NumGet(this, 40, "ushort")
        set => NumPut("ushort", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    wData {
        get => NumGet(this, 42, "ushort")
        set => NumPut("ushort", value, this, 42)
    }

    /**
     * @type {Integer}
     */
    dwNext {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    dwNextAlt {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }
}
