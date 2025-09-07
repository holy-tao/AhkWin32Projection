#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSAUDIO_MICROPHONE_COORDINATES.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSAUDIO_MIC_ARRAY_GEOMETRY extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    usVersion {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    usMicArrayType {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    wVerticalAngleBegin {
        get => NumGet(this, 4, "short")
        set => NumPut("short", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    wVerticalAngleEnd {
        get => NumGet(this, 6, "short")
        set => NumPut("short", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    wHorizontalAngleBegin {
        get => NumGet(this, 8, "short")
        set => NumPut("short", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    wHorizontalAngleEnd {
        get => NumGet(this, 10, "short")
        set => NumPut("short", value, this, 10)
    }

    /**
     * @type {Integer}
     */
    usFrequencyBandLo {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    usFrequencyBandHi {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }

    /**
     * @type {Integer}
     */
    usNumberOfMicrophones {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * @type {Array<KSAUDIO_MICROPHONE_COORDINATES>}
     */
    KsMicCoord{
        get {
            if(!this.HasProp("__KsMicCoordProxyArray"))
                this.__KsMicCoordProxyArray := Win32FixedArray(this.ptr + 24, 8, KSAUDIO_MICROPHONE_COORDINATES, "")
            return this.__KsMicCoordProxyArray
        }
    }
}
