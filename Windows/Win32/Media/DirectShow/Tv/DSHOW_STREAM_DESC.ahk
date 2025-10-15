#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class DSHOW_STREAM_DESC extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Integer}
     */
    VersionNo {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    StreamId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {BOOL}
     */
    Default{
        get {
            if(!this.HasProp("__Default"))
                this.__Default := BOOL(this.ptr + 8)
            return this.__Default
        }
    }

    /**
     * @type {BOOL}
     */
    Creation{
        get {
            if(!this.HasProp("__Creation"))
                this.__Creation := BOOL(this.ptr + 12)
            return this.__Creation
        }
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
