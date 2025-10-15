#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk
#Include ..\..\Foundation\POINTL.ahk
#Include ..\..\Foundation\COLORREF.ahk

/**
 * The EMRSETPIXELV structure contains members for the SetPixelV enhanced metafile record. When an enhanced metafile is created, calls to SetPixel are also recorded in this record.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-emrsetpixelv
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRSETPIXELV extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The base structure for all record types.
     * @type {EMR}
     */
    emr{
        get {
            if(!this.HasProp("__emr"))
                this.__emr := EMR(this.ptr + 0)
            return this.__emr
        }
    }

    /**
     * Logical coordinates of pixel.
     * @type {POINTL}
     */
    ptlPixel{
        get {
            if(!this.HasProp("__ptlPixel"))
                this.__ptlPixel := POINTL(this.ptr + 8)
            return this.__ptlPixel
        }
    }

    /**
     * Color value. To make a <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> value, use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-rgb">RGB</a> macro.
     * @type {COLORREF}
     */
    crColor{
        get {
            if(!this.HasProp("__crColor"))
                this.__crColor := COLORREF(this.ptr + 16)
            return this.__crColor
        }
    }
}
