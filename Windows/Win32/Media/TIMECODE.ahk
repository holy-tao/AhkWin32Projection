#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * The TIMECODE structure contains basic timecode frame count information. (TIMECODE)
 * @remarks
 * Fractional frame can be used to indicate temporal offset into frame when timecode was actually read from an external device; for example, wFrameFract=0x7ff means the timecode value was read from the device at the end of the first video field.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-timecode
 * @namespace Windows.Win32.Media
 * @version v4.0.30319
 */
class TIMECODE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    wFrameRate {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    wFrameFract {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    dwFrames {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    qw {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
