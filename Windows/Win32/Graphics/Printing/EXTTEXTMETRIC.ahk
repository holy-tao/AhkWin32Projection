#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class EXTTEXTMETRIC extends Win32Struct
{
    static sizeof => 52

    static packingSize => 2

    /**
     * @type {Integer}
     */
    emSize {
        get => NumGet(this, 0, "short")
        set => NumPut("short", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    emPointSize {
        get => NumGet(this, 2, "short")
        set => NumPut("short", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    emOrientation {
        get => NumGet(this, 4, "short")
        set => NumPut("short", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    emMasterHeight {
        get => NumGet(this, 6, "short")
        set => NumPut("short", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    emMinScale {
        get => NumGet(this, 8, "short")
        set => NumPut("short", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    emMaxScale {
        get => NumGet(this, 10, "short")
        set => NumPut("short", value, this, 10)
    }

    /**
     * @type {Integer}
     */
    emMasterUnits {
        get => NumGet(this, 12, "short")
        set => NumPut("short", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    emCapHeight {
        get => NumGet(this, 14, "short")
        set => NumPut("short", value, this, 14)
    }

    /**
     * @type {Integer}
     */
    emXHeight {
        get => NumGet(this, 16, "short")
        set => NumPut("short", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    emLowerCaseAscent {
        get => NumGet(this, 18, "short")
        set => NumPut("short", value, this, 18)
    }

    /**
     * @type {Integer}
     */
    emLowerCaseDescent {
        get => NumGet(this, 20, "short")
        set => NumPut("short", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    emSlant {
        get => NumGet(this, 22, "short")
        set => NumPut("short", value, this, 22)
    }

    /**
     * @type {Integer}
     */
    emSuperScript {
        get => NumGet(this, 24, "short")
        set => NumPut("short", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    emSubScript {
        get => NumGet(this, 26, "short")
        set => NumPut("short", value, this, 26)
    }

    /**
     * @type {Integer}
     */
    emSuperScriptSize {
        get => NumGet(this, 28, "short")
        set => NumPut("short", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    emSubScriptSize {
        get => NumGet(this, 30, "short")
        set => NumPut("short", value, this, 30)
    }

    /**
     * @type {Integer}
     */
    emUnderlineOffset {
        get => NumGet(this, 32, "short")
        set => NumPut("short", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    emUnderlineWidth {
        get => NumGet(this, 34, "short")
        set => NumPut("short", value, this, 34)
    }

    /**
     * @type {Integer}
     */
    emDoubleUpperUnderlineOffset {
        get => NumGet(this, 36, "short")
        set => NumPut("short", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    emDoubleLowerUnderlineOffset {
        get => NumGet(this, 38, "short")
        set => NumPut("short", value, this, 38)
    }

    /**
     * @type {Integer}
     */
    emDoubleUpperUnderlineWidth {
        get => NumGet(this, 40, "short")
        set => NumPut("short", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    emDoubleLowerUnderlineWidth {
        get => NumGet(this, 42, "short")
        set => NumPut("short", value, this, 42)
    }

    /**
     * @type {Integer}
     */
    emStrikeOutOffset {
        get => NumGet(this, 44, "short")
        set => NumPut("short", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    emStrikeOutWidth {
        get => NumGet(this, 46, "short")
        set => NumPut("short", value, this, 46)
    }

    /**
     * @type {Integer}
     */
    emKernPairs {
        get => NumGet(this, 48, "ushort")
        set => NumPut("ushort", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    emKernTracks {
        get => NumGet(this, 50, "ushort")
        set => NumPut("ushort", value, this, 50)
    }
}
