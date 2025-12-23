#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk

/**
 * The EMRSCALEVIEWPORTEXTEX and EMRSCALEWINDOWEXTEX structures contain members for the ScaleViewportExtEx and ScaleWindowExtEx enhanced metafile records.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrscaleviewportextex
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRSCALEVIEWPORTEXTEX extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * Base structure for all record types.
     * @type {EMR}
     */
    emr{
        get {
            if(!this.HasProp("__emr"))
                this.__emr := EMR(0, this)
            return this.__emr
        }
    }

    /**
     * Horizontal multiplicand.
     * @type {Integer}
     */
    xNum {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Horizontal divisor.
     * @type {Integer}
     */
    xDenom {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Vertical multiplicand.
     * @type {Integer}
     */
    yNum {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Vertical divisor.
     * @type {Integer}
     */
    yDenom {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
