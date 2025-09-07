#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Storage\IndexServer\DBID.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBCOLUMNINFO extends Win32Struct
{
    static sizeof => 64

    static packingSize => 2

    /**
     * @type {PWSTR}
     */
    pwszName{
        get {
            if(!this.HasProp("__pwszName"))
                this.__pwszName := PWSTR(this.ptr + 0)
            return this.__pwszName
        }
    }

    /**
     * @type {Pointer<ITypeInfo>}
     */
    pTypeInfo {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    iOrdinal {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Pointer}
     */
    ulColumnSize {
        get => NumGet(this, 28, "ptr")
        set => NumPut("ptr", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    wType {
        get => NumGet(this, 36, "ushort")
        set => NumPut("ushort", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    bPrecision {
        get => NumGet(this, 38, "char")
        set => NumPut("char", value, this, 38)
    }

    /**
     * @type {Integer}
     */
    bScale {
        get => NumGet(this, 39, "char")
        set => NumPut("char", value, this, 39)
    }

    /**
     * @type {DBID}
     */
    columnid{
        get {
            if(!this.HasProp("__columnid"))
                this.__columnid := DBID(this.ptr + 40)
            return this.__columnid
        }
    }
}
