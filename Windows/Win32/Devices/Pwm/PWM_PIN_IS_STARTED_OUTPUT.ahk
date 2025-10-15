#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.Devices.Pwm
 * @version v4.0.30319
 */
class PWM_PIN_IS_STARTED_OUTPUT extends Win32Struct
{
    static sizeof => 1

    static packingSize => 1

    /**
     * @type {BOOLEAN}
     */
    IsStarted{
        get {
            if(!this.HasProp("__IsStarted"))
                this.__IsStarted := BOOLEAN(this.ptr + 0)
            return this.__IsStarted
        }
    }
}
