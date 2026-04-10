#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\TA_TIMINGFUNCTION_TYPE.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class TA_TIMINGFUNCTION extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {TA_TIMINGFUNCTION_TYPE}
     */
    eTimingFunctionType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
