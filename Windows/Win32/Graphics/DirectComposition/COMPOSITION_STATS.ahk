#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes timing and composition information.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/dcomptypes/ns-dcomptypes-composition_stats
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class COMPOSITION_STATS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: **[UINT](/windows/win32/WinProg/windows-data-types)**
     * 
     * The running total count of times that a frame was presented to the target.
     * @type {Integer}
     */
    presentCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **[UINT](/windows/win32/WinProg/windows-data-types)**
     * 
     * The running total count of v-blanks at which the last frame was presented to the target.
     * @type {Integer}
     */
    refreshCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: **[UINT](/windows/win32/WinProg/windows-data-types)**
     * @type {Integer}
     */
    virtualRefreshCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: **[UINT64](/windows/win32/WinProg/windows-data-types)**
     * @type {Integer}
     */
    time {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
