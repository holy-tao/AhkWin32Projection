#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include .\TIMECODE.ahk

/**
 * The TIMECODE_SAMPLE structure contains complete timecode information.
 * @remarks
 * The upper 16 bits in <b>dwFlags</b> are reserved; set to zero.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-timecode_sample
 * @namespace Windows.Win32.Media
 * @version v4.0.30319
 */
class TIMECODE_SAMPLE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Reference time, in 100-nanosecond units.
     * @type {Integer}
     */
    qwTick {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/getting-timecode-from-the-device">TIMECODE</a> structure.
     * @type {TIMECODE}
     */
    timecode{
        get {
            if(!this.HasProp("__timecode"))
                this.__timecode := TIMECODE(8, this)
            return this.__timecode
        }
    }

    /**
     * Packed SMPTE userbits.
     * @type {Integer}
     */
    dwUser {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * 
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
