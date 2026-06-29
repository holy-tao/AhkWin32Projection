#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Gdi\HMETAFILE.ahk" { HMETAFILE }

/**
 * Defines the metafile picture format used for exchanging metafile data through the clipboard.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-metafilepict
 * @namespace Windows.Win32.System.DataExchange
 */
export default struct METAFILEPICT {
    #StructPack 8

    /**
     * Type: <b>LONG</b>
     * 
     * The mapping mode in which the picture is drawn.
     */
    mm : Int32

    /**
     * Type: <b>LONG</b>
     * 
     * The size of the metafile picture for all modes except the <b>MM_ISOTROPIC</b> and <b>MM_ANISOTROPIC</b> modes. (For more information about these modes, see the <b>yExt</b> member.) The x-extent specifies the width of the rectangle within which the picture is drawn. The coordinates are in units that correspond to the mapping mode.
     */
    xExt : Int32

    /**
     * Type: <b>LONG</b>
     * 
     * The size of the metafile picture for all modes except the <b>MM_ISOTROPIC</b> and <b>MM_ANISOTROPIC</b> modes. The y-extent specifies the height of the rectangle within which the picture is drawn. The coordinates are in units that correspond to the mapping mode. For <b>MM_ISOTROPIC</b> and <b>MM_ANISOTROPIC</b> modes, which can be scaled, the <b>xExt</b> and <b>yExt</b> members contain an optional suggested size in <b>MM_HIMETRIC</b> units. For <b>MM_ANISOTROPIC</b> pictures, <b>xExt</b> and <b>yExt</b> can be zero when no suggested size is supplied. For <b>MM_ISOTROPIC</b> pictures, an aspect ratio must be supplied even when no suggested size is given. (If a suggested size is given, the aspect ratio is implied by the size.) To give an aspect ratio without implying a suggested size, set <b>xExt</b> and <b>yExt</b> to negative values whose ratio is the appropriate aspect ratio. The magnitude of the negative <b>xExt</b> and <b>yExt</b> values is ignored; only the ratio is used.
     */
    yExt : Int32

    /**
     * Type: <b>HMETAFILE</b>
     * 
     * A handle to a memory metafile.
     */
    hMF : HMETAFILE

}
