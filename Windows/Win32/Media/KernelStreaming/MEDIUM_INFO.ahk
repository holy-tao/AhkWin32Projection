#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class MEDIUM_INFO extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    MediaPresent{
        get {
            if(!this.HasProp("__MediaPresent"))
                this.__MediaPresent := BOOL(this.ptr + 0)
            return this.__MediaPresent
        }
    }

    /**
     * @type {Integer}
     */
    MediaType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {BOOL}
     */
    RecordInhibit{
        get {
            if(!this.HasProp("__RecordInhibit"))
                this.__RecordInhibit := BOOL(this.ptr + 8)
            return this.__RecordInhibit
        }
    }
}
