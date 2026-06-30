#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\TA_TRANSFORM_FLAG.ahk
#Include .\TA_TRANSFORM_TYPE.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class TA_TRANSFORM extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {TA_TRANSFORM_TYPE}
     */
    eTransformType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwTimingFunctionId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwStartTime {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwDurationTime {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {TA_TRANSFORM_FLAG}
     */
    eFlags {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
