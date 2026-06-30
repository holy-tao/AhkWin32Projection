#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @charset Unicode
 */
class NTMS_I1_OPREQUESTINFORMATIONW extends Win32Struct {
    static sizeof => 704

    static packingSize => 4

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
    Submitted {
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
        get => StrGet(this.ptr + 24, 126, "UTF-16")
        set => StrPut(value, this.ptr + 24, 126, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    Arg1Type {
        get => NumGet(this, 280, "uint")
        set => NumPut("uint", value, this, 280)
    }

    /**
     * @type {Guid}
     */
    Arg1 {
        get {
            if(!this.HasProp("__Arg1"))
                this.__Arg1 := Guid(284, this)
            return this.__Arg1
        }
    }

    /**
     * @type {Integer}
     */
    Arg2Type {
        get => NumGet(this, 300, "uint")
        set => NumPut("uint", value, this, 300)
    }

    /**
     * @type {Guid}
     */
    Arg2 {
        get {
            if(!this.HasProp("__Arg2"))
                this.__Arg2 := Guid(304, this)
            return this.__Arg2
        }
    }

    /**
     * @type {String}
     */
    szApplication {
        get => StrGet(this.ptr + 320, 63, "UTF-16")
        set => StrPut(value, this.ptr + 320, 63, "UTF-16")
    }

    /**
     * @type {String}
     */
    szUser {
        get => StrGet(this.ptr + 448, 63, "UTF-16")
        set => StrPut(value, this.ptr + 448, 63, "UTF-16")
    }

    /**
     * @type {String}
     */
    szComputer {
        get => StrGet(this.ptr + 576, 63, "UTF-16")
        set => StrPut(value, this.ptr + 576, 63, "UTF-16")
    }
}
