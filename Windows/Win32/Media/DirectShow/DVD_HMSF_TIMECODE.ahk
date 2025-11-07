#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DVD_HMSF_TIMECODE structure gives the hours, minutes, seconds, and frames in a DVD timecode.
 * @remarks
 * 
 * A <c>DVD_HMSF_TIMECODE</code> structure is used in various <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcontrol2">IDvdControl2</a> and <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdinfo2">IDvdInfo2</a> methods. A <code>DVD_HMSF_TIMECODE</code> structure can be cast to or from a <b>ULONG</b> value. This means that if you need to use the old BCD time format for backward compatibility, you can do so in place of a <code>DVD_HMSF_TIMECODE</c> structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ns-strmif-dvd_hmsf_timecode
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVD_HMSF_TIMECODE extends Win32Struct
{
    static sizeof => 4

    static packingSize => 1

    /**
     * Hours.
     * @type {Integer}
     */
    bHours {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Minutes.
     * @type {Integer}
     */
    bMinutes {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * Seconds.
     * @type {Integer}
     */
    bSeconds {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * Frames.
     * @type {Integer}
     */
    bFrames {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }
}
