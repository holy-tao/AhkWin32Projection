#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset Unicode
 */
class SOURCE_MEDIA_W extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    Reserved{
        get {
            if(!this.HasProp("__Reserved"))
                this.__Reserved := PWSTR(this.ptr + 0)
            return this.__Reserved
        }
    }

    /**
     * @type {PWSTR}
     */
    Tagfile{
        get {
            if(!this.HasProp("__Tagfile"))
                this.__Tagfile := PWSTR(this.ptr + 8)
            return this.__Tagfile
        }
    }

    /**
     * @type {PWSTR}
     */
    Description{
        get {
            if(!this.HasProp("__Description"))
                this.__Description := PWSTR(this.ptr + 16)
            return this.__Description
        }
    }

    /**
     * @type {PWSTR}
     */
    SourcePath{
        get {
            if(!this.HasProp("__SourcePath"))
                this.__SourcePath := PWSTR(this.ptr + 24)
            return this.__SourcePath
        }
    }

    /**
     * @type {PWSTR}
     */
    SourceFile{
        get {
            if(!this.HasProp("__SourceFile"))
                this.__SourceFile := PWSTR(this.ptr + 32)
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
