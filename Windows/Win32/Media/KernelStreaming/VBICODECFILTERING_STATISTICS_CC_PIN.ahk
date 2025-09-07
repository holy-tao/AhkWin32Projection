#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VBICODECFILTERING_STATISTICS_COMMON_PIN.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class VBICODECFILTERING_STATISTICS_CC_PIN extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {VBICODECFILTERING_STATISTICS_COMMON_PIN}
     */
    Common{
        get {
            if(!this.HasProp("__Common"))
                this.__Common := VBICODECFILTERING_STATISTICS_COMMON_PIN(this.ptr + 0)
            return this.__Common
        }
    }
}
