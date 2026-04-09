#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSEVENTDATA.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class LOOPEDSTREAMING_POSITION_EVENT_DATA extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {KSEVENTDATA}
     */
    KsEventData {
        get {
            if(!this.HasProp("__KsEventData"))
                this.__KsEventData := KSEVENTDATA(0, this)
            return this.__KsEventData
        }
    }

    /**
     * @type {Integer}
     */
    Position {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
