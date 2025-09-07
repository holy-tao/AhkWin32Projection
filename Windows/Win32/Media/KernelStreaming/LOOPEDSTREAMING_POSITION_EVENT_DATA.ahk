#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSEVENTDATA.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class LOOPEDSTREAMING_POSITION_EVENT_DATA extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {KSEVENTDATA}
     */
    KsEventData{
        get {
            if(!this.HasProp("__KsEventData"))
                this.__KsEventData := KSEVENTDATA(this.ptr + 0)
            return this.__KsEventData
        }
    }

    /**
     * @type {Integer}
     */
    Position {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
