#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 * @version v4.0.30319
 */
class NFCRM_SET_RADIO_STATE extends Win32Struct
{
    static sizeof => 2

    static packingSize => 1

    /**
     * @type {BOOLEAN}
     */
    SystemStateUpdate{
        get {
            if(!this.HasProp("__SystemStateUpdate"))
                this.__SystemStateUpdate := BOOLEAN(this.ptr + 0)
            return this.__SystemStateUpdate
        }
    }

    /**
     * @type {BOOLEAN}
     */
    MediaRadioOn{
        get {
            if(!this.HasProp("__MediaRadioOn"))
                this.__MediaRadioOn := BOOLEAN(this.ptr + 1)
            return this.__MediaRadioOn
        }
    }
}
