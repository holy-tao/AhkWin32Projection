#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 * @charset ANSI
 */
class NTMS_I1_OPREQUESTINFORMATIONA extends Win32Struct
{
    static sizeof => 376

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
                this.__Submitted := SYSTEMTIME(4, this)
            return this.__Submitted
        }
    }

    /**
     * @type {Integer}
     */
    State {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {String}
     */
    szMessage {
        get => StrGet(this.ptr + 24, 126, "UTF-8")
        set => StrPut(value, this.ptr + 24, 126, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    Arg1Type {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }

    /**
     * @type {Pointer<Guid>}
     */
    Arg1 {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

    /**
     * @type {Integer}
     */
    Arg2Type {
        get => NumGet(this, 168, "uint")
        set => NumPut("uint", value, this, 168)
    }

    /**
     * @type {Pointer<Guid>}
     */
    Arg2 {
        get => NumGet(this, 176, "ptr")
        set => NumPut("ptr", value, this, 176)
    }

    /**
     * @type {String}
     */
    szApplication {
        get => StrGet(this.ptr + 184, 63, "UTF-8")
        set => StrPut(value, this.ptr + 184, 63, "UTF-8")
    }

    /**
     * @type {String}
     */
    szUser {
        get => StrGet(this.ptr + 248, 63, "UTF-8")
        set => StrPut(value, this.ptr + 248, 63, "UTF-8")
    }

    /**
     * @type {String}
     */
    szComputer {
        get => StrGet(this.ptr + 312, 63, "UTF-8")
        set => StrPut(value, this.ptr + 312, 63, "UTF-8")
    }
}
