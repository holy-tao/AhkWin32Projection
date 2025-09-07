#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\KSIDENTIFIER.ahk
#Include .\KSEVENTDATA.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSRELATIVEEVENT extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {HANDLE}
     */
    ObjectHandle{
        get {
            if(!this.HasProp("__ObjectHandle"))
                this.__ObjectHandle := HANDLE(this.ptr + 8)
            return this.__ObjectHandle
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    ObjectPointer {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Void>}
     */
    Reserved {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {KSIDENTIFIER}
     */
    Event{
        get {
            if(!this.HasProp("__Event"))
                this.__Event := KSIDENTIFIER(this.ptr + 24)
            return this.__Event
        }
    }

    /**
     * @type {KSEVENTDATA}
     */
    EventData{
        get {
            if(!this.HasProp("__EventData"))
                this.__EventData := KSEVENTDATA(this.ptr + 32)
            return this.__EventData
        }
    }
}
