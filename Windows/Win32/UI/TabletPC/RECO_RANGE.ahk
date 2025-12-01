#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The structure is obsolete.
 * @see https://learn.microsoft.com/windows/win32/api/rectypes/ns-rectypes-reco_range
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class RECO_RANGE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Zero-based index in the string of the current alternate that marks the beginning of the recognition segment.
     * @type {Integer}
     */
    iwcBegin {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Count of characters in the range.
     * @type {Integer}
     */
    cCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
