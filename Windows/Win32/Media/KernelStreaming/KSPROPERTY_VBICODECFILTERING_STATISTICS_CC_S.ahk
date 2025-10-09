#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSIDENTIFIER.ahk
#Include .\VBICODECFILTERING_STATISTICS_COMMON.ahk
#Include .\VBICODECFILTERING_STATISTICS_CC.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_VBICODECFILTERING_STATISTICS_CC_S extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {KSIDENTIFIER}
     */
    Property{
        get {
            if(!this.HasProp("__Property"))
                this.__Property := KSIDENTIFIER(this.ptr + 0)
            return this.__Property
        }
    }

    /**
     * @type {VBICODECFILTERING_STATISTICS_CC}
     */
    Statistics{
        get {
            if(!this.HasProp("__Statistics"))
                this.__Statistics := VBICODECFILTERING_STATISTICS_CC(this.ptr + 16)
            return this.__Statistics
        }
    }
}
