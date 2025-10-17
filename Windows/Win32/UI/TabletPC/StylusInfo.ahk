#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides information about the stylus.
 * @see https://docs.microsoft.com/windows/win32/api//rtscom/ns-rtscom-stylusinfo
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class StylusInfo extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Uniquely identifies the tablet.
     * @type {Integer}
     */
    tcid {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Uniquely identifies the stylus.
     * @type {Integer}
     */
    cid {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * <b>TRUE</b> if the stylus is upside down, otherwise <b>FALSE</b>.
     * @type {BOOL}
     */
    bIsInvertedCursor {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
