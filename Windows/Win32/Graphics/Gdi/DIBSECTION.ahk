#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BITMAP.ahk
#Include .\BITMAPINFOHEADER.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * The DIBSECTION structure contains information about a DIB created by calling the CreateDIBSection function.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-dibsection
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class DIBSECTION extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmap">BITMAP</a> data structure that contains information about the DIB: its type, its dimensions, its color capacities, and a pointer to its bit values.
     * @type {BITMAP}
     */
    dsBm{
        get {
            if(!this.HasProp("__dsBm"))
                this.__dsBm := BITMAP(this.ptr + 0)
            return this.__dsBm
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure that contains information about the color format of the DIB.
     * @type {BITMAPINFOHEADER}
     */
    dsBmih{
        get {
            if(!this.HasProp("__dsBmih"))
                this.__dsBmih := BITMAPINFOHEADER(this.ptr + 32)
            return this.__dsBmih
        }
    }

    /**
     * Specifies three color masks for the DIB. This field is only valid when the <b>BitCount</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure has a value greater than 8. Each color mask indicates the bits that are used to encode one of the three color channels (red, green, and blue).
     * @type {Array<UInt32>}
     */
    dsBitfields{
        get {
            if(!this.HasProp("__dsBitfieldsProxyArray"))
                this.__dsBitfieldsProxyArray := Win32FixedArray(this.ptr + 72, 4, Primitive, "uint")
            return this.__dsBitfieldsProxyArray
        }
    }

    /**
     * Contains a handle to the file mapping object that the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createdibsection">CreateDIBSection</a> function used to create the DIB. 
     * 			 If <b>CreateDIBSection</b> was called with a <b>NULL</b> value for its <i>hSection</i> parameter, 
     * 			 causing the system to allocate memory for the bitmap, the <i>dshSection</i> member will be <b>NULL</b>.
     * @type {HANDLE}
     */
    dshSection{
        get {
            if(!this.HasProp("__dshSection"))
                this.__dshSection := HANDLE(this.ptr + 88)
            return this.__dshSection
        }
    }

    /**
     * The offset to the bitmap's bit values within the file mapping object referenced by <i>dshSection</i>. 
     * 			 If <i>dshSection</i> is <b>NULL</b>, the <i>dsOffset</i> value has no meaning.
     * @type {Integer}
     */
    dsOffset {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }
}
