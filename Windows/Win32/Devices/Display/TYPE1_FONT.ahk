#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * The TYPE1_FONT structure contains the information necessary for a PostScript driver to access a Type1 font through GDI.
 * @remarks
 * A PostScript driver can obtain a list of installed Type1 fonts by calling <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-enggettype1fontlist">EngGetType1FontList</a>.
 * 
 * Each PostScript Type1 font comes with two separate files: a .<i>pfm</i> file and a .<i>pfb</i> file. The .<i>pfm</i> file contains font metrics information; the .<i>pfb</i> file contains the PostScript Type1 binary font data.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-type1_font
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class TYPE1_FONT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Handle to the PostScript Type1 .<a href="https://docs.microsoft.com/windows-hardware/drivers/">pfm</a> file.
     * @type {HANDLE}
     */
    hPFM{
        get {
            if(!this.HasProp("__hPFM"))
                this.__hPFM := HANDLE(0, this)
            return this.__hPFM
        }
    }

    /**
     * Handle to the PostScript Type1 .<i>pfb</i> file.
     * @type {HANDLE}
     */
    hPFB{
        get {
            if(!this.HasProp("__hPFB"))
                this.__hPFB := HANDLE(8, this)
            return this.__hPFB
        }
    }

    /**
     * Is an identifier that is generated and used by GDI. The driver stores <b>ulIdentifier</b> in the <b>dpCharSets</b> field of the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-ifimetrics">IFIMETRICS</a> structure.
     * @type {Integer}
     */
    ulIdentifier {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
