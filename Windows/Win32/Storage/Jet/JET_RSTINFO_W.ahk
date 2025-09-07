#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\JET_LGPOS.ahk
#Include .\JET_LOGTIME.ahk

/**
 * @namespace Windows.Win32.Storage.Jet
 * @version v4.0.30319
 * @charset Unicode
 */
class JET_RSTINFO_W extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<JET_RSTMAP_W>}
     */
    rgrstmap {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    crstmap {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {JET_LGPOS}
     */
    lgposStop{
        get {
            if(!this.HasProp("__lgposStop"))
                this.__lgposStop := JET_LGPOS(this.ptr + 24)
            return this.__lgposStop
        }
    }

    /**
     * @type {JET_LOGTIME}
     */
    logtimeStop{
        get {
            if(!this.HasProp("__logtimeStop"))
                this.__logtimeStop := JET_LOGTIME(this.ptr + 32)
            return this.__logtimeStop
        }
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnStatus {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
