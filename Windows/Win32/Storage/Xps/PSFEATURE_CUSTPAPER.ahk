#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PSFEATURE_CUSTPAPER structure contains information about a custom paper size for a PostScript driver. This structure is used with the GET_PS_FEATURESETTING printer escape function.
 * @remarks
 * For the semantics of the <b>lOrientation</b>, <b>lWidth</b>, <b>lHeight</b>, <b>lWidthOffset</b>, and <b>lHeightOffset</b> members, please refer to "Custom Page Size Parameters" in "PostScript Printer Description File Format Specification" v.4.3.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-psfeature_custpaper
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class PSFEATURE_CUSTPAPER extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * Indicates the custom paper orientation. This member can be 0 to 3 if custom page size is selected. Otherwise, it is 1 and all other structure members are zero
     * @type {Integer}
     */
    lOrientation {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Custom page width, in points.
     * @type {Integer}
     */
    lWidth {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Custom page height, in points.
     * @type {Integer}
     */
    lHeight {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Custom page width offset, in points.
     * @type {Integer}
     */
    lWidthOffset {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Custom page height offset, in points.
     * @type {Integer}
     */
    lHeightOffset {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
