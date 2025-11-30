#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Win32\Foundation\UNICODE_STRING.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 * @version v4.0.30319
 */
class FLT_FILE_NAME_INFORMATION extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NamesParsed {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {UNICODE_STRING}
     */
    Name{
        get {
            if(!this.HasProp("__Name"))
                this.__Name := UNICODE_STRING(8, this)
            return this.__Name
        }
    }

    /**
     * @type {UNICODE_STRING}
     */
    Volume{
        get {
            if(!this.HasProp("__Volume"))
                this.__Volume := UNICODE_STRING(24, this)
            return this.__Volume
        }
    }

    /**
     * @type {UNICODE_STRING}
     */
    Share{
        get {
            if(!this.HasProp("__Share"))
                this.__Share := UNICODE_STRING(40, this)
            return this.__Share
        }
    }

    /**
     * @type {UNICODE_STRING}
     */
    Extension{
        get {
            if(!this.HasProp("__Extension"))
                this.__Extension := UNICODE_STRING(56, this)
            return this.__Extension
        }
    }

    /**
     * @type {UNICODE_STRING}
     */
    Stream{
        get {
            if(!this.HasProp("__Stream"))
                this.__Stream := UNICODE_STRING(72, this)
            return this.__Stream
        }
    }

    /**
     * @type {UNICODE_STRING}
     */
    FinalComponent{
        get {
            if(!this.HasProp("__FinalComponent"))
                this.__FinalComponent := UNICODE_STRING(88, this)
            return this.__FinalComponent
        }
    }

    /**
     * @type {UNICODE_STRING}
     */
    ParentDir{
        get {
            if(!this.HasProp("__ParentDir"))
                this.__ParentDir := UNICODE_STRING(104, this)
            return this.__ParentDir
        }
    }
}
