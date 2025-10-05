#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class POWER_SESSION_ALLOW_EXTERNAL_DMA_DEVICES extends Win32Struct
{
    static sizeof => 1

    static packingSize => 1

    /**
     * @type {Integer}
     */
    IsAllowed {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }
}
