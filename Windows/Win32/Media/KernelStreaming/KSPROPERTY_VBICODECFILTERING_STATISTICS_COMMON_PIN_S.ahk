#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSIDENTIFIER.ahk
#Include .\VBICODECFILTERING_STATISTICS_COMMON_PIN.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_VBICODECFILTERING_STATISTICS_COMMON_PIN_S extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {KSIDENTIFIER}
     */
    Property{
        get {
            if(!this.HasProp("__Property"))
                this.__Property := KSIDENTIFIER(0, this)
            return this.__Property
        }
    }

    /**
     * @type {VBICODECFILTERING_STATISTICS_COMMON_PIN}
     */
    Statistics{
        get {
            if(!this.HasProp("__Statistics"))
                this.__Statistics := VBICODECFILTERING_STATISTICS_COMMON_PIN(16, this)
            return this.__Statistics
        }
    }
}
