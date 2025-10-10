#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The EMR structure provides the base structure for all enhanced metafile records. An enhanced metafile record contains the parameters for a specific GDI function used to create part of a picture in an enhanced format metafile.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-emr
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMR extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The record type. The parameter can be one of the following (with a link to the associated record structure).
     * 
     * <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrabortpath">EMR_ABORTPATH</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emralphablend">EMR_ALPHABLEND</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emranglearc">EMR_ANGLEARC</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrarc">EMR_ARC</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrarc">EMR_ARCTO</a>
     * <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrabortpath">EMR_BEGINPATH</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrbitblt">EMR_BITBLT</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrarc">EMR_CHORD</a>
     * <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrabortpath">EMR_CLOSEFIGURE</a>
     * <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrcolorcorrectpalette">EMR_COLORCORRECTPALETTE</a>
     * <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrcolormatchtotarget">EMR_COLORMATCHTOTARGETW</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrcreatebrushindirect">EMR_CREATEBRUSHINDIRECT</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrcreatecolorspace">EMR_CREATECOLORSPACE</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrcreatecolorspacew">EMR_CREATECOLORSPACEW</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrcreatedibpatternbrushpt">EMR_CREATEDIBPATTERNBRUSHPT</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrcreatemonobrush">EMR_CREATEMONOBRUSH</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrcreatepalette">EMR_CREATEPALETTE</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrcreatepen">EMR_CREATEPEN</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrsetcolorspace">EMR_DELETECOLORSPACE</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrselectobject">EMR_DELETEOBJECT</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrellipse">EMR_ELLIPSE</a>
     * <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrabortpath">EMR_ENDPATH</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emreof">EMR_EOF</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrexcludecliprect">EMR_EXCLUDECLIPRECT</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrextcreatefontindirectw">EMR_EXTCREATEFONTINDIRECTW</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrextcreatepen">EMR_EXTCREATEPEN</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrextfloodfill">EMR_EXTFLOODFILL</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrextselectcliprgn">EMR_EXTSELECTCLIPRGN</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrexttextouta">EMR_EXTTEXTOUTA</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrexttextouta">EMR_EXTTEXTOUTW</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrfillpath">EMR_FILLPATH</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrfillrgn">EMR_FILLRGN</a>
     * <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrabortpath">EMR_FLATTENPATH</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrframergn">EMR_FRAMERGN</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrgdicomment">EMR_GDICOMMENT</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrglsboundedrecord">EMR_GLSBOUNDEDRECORD</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrglsrecord">EMR_GLSRECORD</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrgradientfill">EMR_GRADIENTFILL</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrexcludecliprect">EMR_INTERSECTCLIPRECT</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrinvertrgn">EMR_INVERTRGN</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrlineto">EMR_LINETO</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrmaskblt">EMR_MASKBLT</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrmodifyworldtransform">EMR_MODIFYWORLDTRANSFORM</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrlineto">EMR_MOVETOEX</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emroffsetcliprgn">EMR_OFFSETCLIPRGN</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrinvertrgn">EMR_PAINTRGN</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrarc">EMR_PIE</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrpixelformat">EMR_PIXELFORMAT</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrplgblt">EMR_PLGBLT</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrpolyline">EMR_POLYBEZIER</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrpolyline16">EMR_POLYBEZIER16</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrpolyline">EMR_POLYBEZIERTO</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrpolyline16">EMR_POLYBEZIERTO16</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrpolydraw">EMR_POLYDRAW</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrpolydraw16">EMR_POLYDRAW16</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrpolyline">EMR_POLYGON</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrpolyline16">EMR_POLYGON16</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrpolyline">EMR_POLYLINE</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrpolyline16">EMR_POLYLINE16</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrpolyline">EMR_POLYLINETO</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrpolyline16">EMR_POLYLINETO16</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrpolypolyline">EMR_POLYPOLYGON</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrpolypolyline16">EMR_POLYPOLYGON16</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrpolypolyline">EMR_POLYPOLYLINE</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrpolypolyline16">EMR_POLYPOLYLINE16</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrpolytextouta">EMR_POLYTEXTOUTA</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrpolytextouta">EMR_POLYTEXTOUTW</a>
     * <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrabortpath">EMR_REALIZEPALETTE</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrellipse">EMR_RECTANGLE</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrresizepalette">EMR_RESIZEPALETTE</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrrestoredc">EMR_RESTOREDC</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrroundrect">EMR_ROUNDRECT</a>
     * <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrabortpath">EMR_SAVEDC</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrscaleviewportextex">EMR_SCALEVIEWPORTEXTEX</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrscaleviewportextex">EMR_SCALEWINDOWEXTEX</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrselectclippath">EMR_SELECTCLIPPATH</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrselectobject">EMR_SELECTOBJECT</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrselectpalette">EMR_SELECTPALETTE</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrsetarcdirection">EMR_SETARCDIRECTION</a>
     * <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrsetbkcolor">EMR_SETBKCOLOR</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrselectclippath">EMR_SETBKMODE</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrsetviewportextex">EMR_SETBRUSHORGEX</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrsetcoloradjustment">EMR_SETCOLORADJUSTMENT</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrsetcolorspace">EMR_SETCOLORSPACE</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrsetdibitstodevice">EMR_SETDIBITSTODEVICE</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrselectclippath">EMR_SETICMMODE</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrseticmprofile">EMR_SETICMPROFILEA</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrseticmprofile">EMR_SETICMPROFILEW</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrselectclippath">EMR_SETLAYOUT</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrselectclippath">EMR_SETMAPMODE</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrsetmapperflags">EMR_SETMAPPERFLAGS</a>
     * <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrabortpath">EMR_SETMETARGN</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrsetmiterlimit">EMR_SETMITERLIMIT</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrsetpaletteentries">EMR_SETPALETTEENTRIES</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrsetpixelv">EMR_SETPIXELV</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrselectclippath">EMR_SETPOLYFILLMODE</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrselectclippath">EMR_SETROP2</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrselectclippath">EMR_SETSTRETCHBLTMODE</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrselectclippath">EMR_SETTEXTALIGN</a>
     * <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrsetbkcolor">EMR_SETTEXTCOLOR</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrsetviewportextex">EMR_SETVIEWPORTEXTEX</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrsetviewportorgex">EMR_SETVIEWPORTORGEX</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrsetviewportextex">EMR_SETWINDOWEXTEX</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrsetviewportextex">EMR_SETWINDOWORGEX</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrsetworldtransform">EMR_SETWORLDTRANSFORM</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrstretchblt">EMR_STRETCHBLT</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrstretchdibits">EMR_STRETCHDIBITS</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrfillpath">EMR_STROKEANDFILLPATH</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrfillpath">EMR_STROKEPATH</a>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrtransparentblt">EMR_TRANSPARENTBLT</a>
     * <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrabortpath">EMR_WIDENPATH</a>
     * @type {Integer}
     */
    iType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of the record, in bytes. This member must be a multiple of four.
     * @type {Integer}
     */
    nSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
