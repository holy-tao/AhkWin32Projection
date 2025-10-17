#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 * @charset Unicode
 */
class NTMS_I1_OPREQUESTINFORMATIONW extends Win32Struct
{
    static sizeof => 696

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Request {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {SYSTEMTIME}
     */
    Submitted{
        get {
            if(!this.HasProp("__Submitted"))
                this.__Submitted := SYSTEMTIME(8, this)
            return this.__Submitted
        }
    }

    /**
     * @type {Integer}
     */
    State {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {String}
     */
    szMessage {
        get => StrGet(this.ptr + 28, 126, "UTF-16")
        set => StrPut(value, this.ptr + 28, 126, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    Arg1Type {
        get => NumGet(this, 284, "uint")
        set => NumPut("uint", value, this, 284)
    }

    /**
     * @type {Pointer<Guid>}
     */
    Arg1 {
        get => NumGet(this, 288, "ptr")
        set => NumPut("ptr", value, this, 288)
    }

    /**
     * @type {Integer}
     */
    Arg2Type {
        get => NumGet(this, 296, "uint")
        set => NumPut("uint", value, this, 296)
    }

    /**
     * @type {Pointer<Guid>}
     */
    Arg2 {
        get => NumGet(this, 304, "ptr")
        set => NumPut("ptr", value, this, 304)
    }

    /**
     * @type {String}
     */
    szApplication {
        get => StrGet(this.ptr + 312, 63, "UTF-16")
        set => StrPut(value, this.ptr + 312, 63, "UTF-16")
    }

    /**
     * @type {String}
     */
    szUser {
        get => StrGet(this.ptr + 440, 63, "UTF-16")
        set => StrPut(value, this.ptr + 440, 63, "UTF-16")
    }

    /**
     * @type {String}
     */
    szComputer {
        get => StrGet(this.ptr + 568, 63, "UTF-16")
        set => StrPut(value, this.ptr + 568, 63, "UTF-16")
    }
}
