#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes timing and composition statistics for a compositor frame.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/dcomptypes/ns-dcomptypes-composition_frame_stats
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class COMPOSITION_FRAME_STATS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: **[UINT64](/windows/win32/WinProg/windows-data-types)**
     * 
     * The time the frame started.
     * @type {Integer}
     */
    startTime {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **[UINT64](/windows/win32/WinProg/windows-data-types)**
     * 
     * The frame's target time.
     * @type {Integer}
     */
    targetTime {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: **[UINT64](/windows/win32/WinProg/windows-data-types)**
     * 
     * The amount of time the frame took.
     * @type {Integer}
     */
    framePeriod {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
