#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class HTTP_FILTER_AUTH_COMPLETE_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    GetHeader {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    SetHeader {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    AddHeader {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer}
     */
    GetUserToken {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    HttpStatus {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {BOOL}
     */
    fResetAuth {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
