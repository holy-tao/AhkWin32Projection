#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class HTTP_TRACE_EVENT_ITEM extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pszName{
        get {
            if(!this.HasProp("__pszName"))
                this.__pszName := PWSTR(this.ptr + 0)
            return this.__pszName
        }
    }

    /**
     * @type {Integer}
     */
    dwDataType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbData {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    cbData {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {PWSTR}
     */
    pszDataDescription{
        get {
            if(!this.HasProp("__pszDataDescription"))
                this.__pszDataDescription := PWSTR(this.ptr + 32)
            return this.__pszDataDescription
        }
    }
}
