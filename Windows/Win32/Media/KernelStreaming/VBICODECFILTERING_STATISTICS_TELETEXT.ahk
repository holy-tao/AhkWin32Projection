#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VBICODECFILTERING_STATISTICS_COMMON.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class VBICODECFILTERING_STATISTICS_TELETEXT extends Win32Struct
{
    static sizeof => 56

    static packingSize => 4

    /**
     * @type {VBICODECFILTERING_STATISTICS_COMMON}
     */
    Common{
        get {
            if(!this.HasProp("__Common"))
                this.__Common := VBICODECFILTERING_STATISTICS_COMMON(0, this)
            return this.__Common
        }
    }
}
