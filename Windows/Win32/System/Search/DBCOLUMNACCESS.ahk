#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Storage\IndexServer\DBID.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBCOLUMNACCESS extends Win32Struct
{
    static sizeof => 64

    static packingSize => 2

    /**
     * @type {Pointer<Void>}
     */
    pData {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {DBID}
     */
    columnid{
        get {
            if(!this.HasProp("__columnid"))
                this.__columnid := DBID(this.ptr + 8)
            return this.__columnid
        }
    }

    /**
     * @type {Pointer}
     */
    cbDataLen {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    dwStatus {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Pointer}
     */
    cbMaxLen {
        get => NumGet(this, 44, "ptr")
        set => NumPut("ptr", value, this, 44)
    }

    /**
     * @type {Pointer}
     */
    dwReserved {
        get => NumGet(this, 52, "ptr")
        set => NumPut("ptr", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    wType {
        get => NumGet(this, 60, "ushort")
        set => NumPut("ushort", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    bPrecision {
        get => NumGet(this, 62, "char")
        set => NumPut("char", value, this, 62)
    }

    /**
     * @type {Integer}
     */
    bScale {
        get => NumGet(this, 63, "char")
        set => NumPut("char", value, this, 63)
    }
}
