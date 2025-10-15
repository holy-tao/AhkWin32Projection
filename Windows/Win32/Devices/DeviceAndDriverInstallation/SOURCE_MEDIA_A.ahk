#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset ANSI
 */
class SOURCE_MEDIA_A extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {PSTR}
     */
    Reserved{
        get {
            if(!this.HasProp("__Reserved"))
                this.__Reserved := PSTR(this.ptr + 0)
            return this.__Reserved
        }
    }

    /**
     * @type {PSTR}
     */
    Tagfile{
        get {
            if(!this.HasProp("__Tagfile"))
                this.__Tagfile := PSTR(this.ptr + 8)
            return this.__Tagfile
        }
    }

    /**
     * @type {PSTR}
     */
    Description{
        get {
            if(!this.HasProp("__Description"))
                this.__Description := PSTR(this.ptr + 16)
            return this.__Description
        }
    }

    /**
     * @type {PSTR}
     */
    SourcePath{
        get {
            if(!this.HasProp("__SourcePath"))
                this.__SourcePath := PSTR(this.ptr + 24)
            return this.__SourcePath
        }
    }

    /**
     * @type {PSTR}
     */
    SourceFile{
        get {
            if(!this.HasProp("__SourceFile"))
                this.__SourceFile := PSTR(this.ptr + 32)
            return this.__SourceFile
        }
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
