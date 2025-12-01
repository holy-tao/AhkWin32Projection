#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk
#Include ..\..\Foundation\RECTL.ahk
#Include ..\..\Foundation\POINTL.ahk
#Include .\EMRTEXT.ahk

/**
 * The EMRPOLYTEXTOUTA and EMRPOLYTEXTOUTW structures contain members for the PolyTextOut enhanced metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrpolytextouta
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRPOLYTEXTOUTA extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

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
     * Bounding rectangle, in device units.
     * @type {RECTL}
     */
    rclBounds{
        get {
            if(!this.HasProp("__rclBounds"))
                this.__rclBounds := RECTL(8, this)
            return this.__rclBounds
        }
    }

    /**
     * Current graphics mode. This member can be either the GM_COMPATIBLE or GM_ADVANCED value.
     * @type {Integer}
     */
    iGraphicsMode {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * X-scaling factor from page units to .01mm units if the graphics mode is the GM_COMPATIBLE value.
     * @type {Float}
     */
    exScale {
        get => NumGet(this, 28, "float")
        set => NumPut("float", value, this, 28)
    }

    /**
     * Y-scaling factor from page units to .01mm units if the graphics mode is the GM_COMPATIBLE value.
     * @type {Float}
     */
    eyScale {
        get => NumGet(this, 32, "float")
        set => NumPut("float", value, this, 32)
    }

    /**
     * Number of strings.
     * @type {Integer}
     */
    cStrings {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * <b>EMRTEXT</b> structure, which is followed by the string and the intercharacter spacing array.
     * @type {Array<EMRTEXT>}
     */
    aemrtext{
        get {
            if(!this.HasProp("__aemrtextProxyArray"))
                this.__aemrtextProxyArray := Win32FixedArray(this.ptr + 40, 1, EMRTEXT, "")
            return this.__aemrtextProxyArray
        }
    }
}
