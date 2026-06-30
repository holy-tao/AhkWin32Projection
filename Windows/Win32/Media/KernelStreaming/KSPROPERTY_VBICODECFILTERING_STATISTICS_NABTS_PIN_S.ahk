#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VBICODECFILTERING_STATISTICS_NABTS_PIN.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VBICODECFILTERING_STATISTICS_COMMON_PIN.ahk
#Include .\KSIDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_VBICODECFILTERING_STATISTICS_NABTS_PIN_S extends Win32Struct {
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {KSIDENTIFIER}
     */
    Property {
        get {
            if(!this.HasProp("__Property"))
                this.__Property := KSIDENTIFIER(0, this)
            return this.__Property
        }
    }

    /**
     * @type {VBICODECFILTERING_STATISTICS_NABTS_PIN}
     */
    Statistics {
        get {
            if(!this.HasProp("__Statistics"))
                this.__Statistics := VBICODECFILTERING_STATISTICS_NABTS_PIN(24, this)
            return this.__Statistics
        }
    }
}
