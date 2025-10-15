#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Graphics\Gdi\HMETAFILE.ahk

/**
 * Defines the metafile picture format used for exchanging metafile data through the clipboard.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-metafilepict
 * @namespace Windows.Win32.System.DataExchange
 * @version v4.0.30319
 */
class METAFILEPICT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b>LONG</b>
     * 
     * The mapping mode in which the picture is drawn.
     * @type {Integer}
     */
    mm {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>LONG</b>
     * 
     * The size of the metafile picture for all modes except the <b>MM_ISOTROPIC</b> and <b>MM_ANISOTROPIC</b> modes. (For more information about these modes, see the <b>yExt</b> member.) The x-extent specifies the width of the rectangle within which the picture is drawn. The coordinates are in units that correspond to the mapping mode.
     * @type {Integer}
     */
    xExt {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b>LONG</b>
     * 
     * The size of the metafile picture for all modes except the <b>MM_ISOTROPIC</b> and <b>MM_ANISOTROPIC</b> modes. The y-extent specifies the height of the rectangle within which the picture is drawn. The coordinates are in units that correspond to the mapping mode. For <b>MM_ISOTROPIC</b> and <b>MM_ANISOTROPIC</b> modes, which can be scaled, the <b>xExt</b> and <b>yExt</b> members contain an optional suggested size in <b>MM_HIMETRIC</b> units. For <b>MM_ANISOTROPIC</b> pictures, <b>xExt</b> and <b>yExt</b> can be zero when no suggested size is supplied. For <b>MM_ISOTROPIC</b> pictures, an aspect ratio must be supplied even when no suggested size is given. (If a suggested size is given, the aspect ratio is implied by the size.) To give an aspect ratio without implying a suggested size, set <b>xExt</b> and <b>yExt</b> to negative values whose ratio is the appropriate aspect ratio. The magnitude of the negative <b>xExt</b> and <b>yExt</b> values is ignored; only the ratio is used.
     * @type {Integer}
     */
    yExt {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b>HMETAFILE</b>
     * 
     * A handle to a memory metafile.
     * @type {HMETAFILE}
     */
    hMF{
        get {
            if(!this.HasProp("__hMF"))
                this.__hMF := HMETAFILE(this.ptr + 16)
            return this.__hMF
        }
    }
}
