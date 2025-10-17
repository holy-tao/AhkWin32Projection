#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NTSCSI_UNICODE_STRING.ahk

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 */
class DUMP_DRIVER_EX extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {Pointer<Void>}
     */
    DumpDriverList {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {String}
     */
    DriverName {
        get => StrGet(this.ptr + 8, 14, "UTF-16")
        set => StrPut(value, this.ptr + 8, 14, "UTF-16")
    }

    /**
     * @type {String}
     */
    BaseName {
        get => StrGet(this.ptr + 38, 14, "UTF-16")
        set => StrPut(value, this.ptr + 38, 14, "UTF-16")
    }

    /**
     * @type {NTSCSI_UNICODE_STRING}
     */
    DriverFullPath{
        get {
            if(!this.HasProp("__DriverFullPath"))
                this.__DriverFullPath := NTSCSI_UNICODE_STRING(72, this)
            return this.__DriverFullPath
        }
    }
}
