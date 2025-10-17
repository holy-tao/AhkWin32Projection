#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINTL.ahk
#Include ..\..\Foundation\RECTL.ahk

/**
 * The EMRTEXT structure contains members for text output.
 * @remarks
 * 
  * The <b>EMRTEXT</b> structure is used as a member in the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrexttextouta">EMREXTTEXTOUT</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrpolytextouta">EMRPOLYTEXTOUT</a> structures.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-emrtext
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRTEXT extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The logical coordinates of the reference point used to position the string.
     * @type {POINTL}
     */
    ptlReference{
        get {
            if(!this.HasProp("__ptlReference"))
                this.__ptlReference := POINTL(0, this)
            return this.__ptlReference
        }
    }

    /**
     * The number of characters in the string.
     * @type {Integer}
     */
    nChars {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The offset to the string.
     * @type {Integer}
     */
    offString {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * A value that indicates how to use the application-defined rectangle. This member can be a combination of the ETO_CLIPPED and ETO_OPAQUE values.
     * @type {Integer}
     */
    fOptions {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * An optional clipping and/or opaquing rectangle, in logical units.
     * @type {RECTL}
     */
    rcl{
        get {
            if(!this.HasProp("__rcl"))
                this.__rcl := RECTL(24, this)
            return this.__rcl
        }
    }

    /**
     * The offset to the intercharacter spacing array.
     * @type {Integer}
     */
    offDx {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
