#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\AUDIO_CURVE_TYPE.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSAUDIOENGINE_VOLUMELEVEL extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    TargetVolume {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {AUDIO_CURVE_TYPE}
     */
    CurveType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    CurveDuration {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
