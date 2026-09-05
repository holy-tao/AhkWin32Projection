#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the opacity of the object and the drawing aspects supported by the object.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/ne-ocidl-viewstatus
 * @namespace Windows.Win32.System.Ole
 */
class VIEWSTATUS extends Win32Enum {

    /**
     * The object is completely opaque. So, for any aspect, it promises to draw the entire rectangle passed to the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iviewobject-draw">IViewObject::Draw</a> method. If this value is not set, the object contains transparent parts. If it also support DVASPECT_TRANSPARENT, then this aspect may be used to draw the transparent parts only.
     * 
     * This bit applies only to CONTENT related aspects and not to DVASPECT_ICON or DVASPECT_DOCPRINT.
     * Native name: VIEWSTATUS_OPAQUE
     * @type {Integer (Int32)}
     */
    static OPAQUE => 1

    /**
     * The object has a solid background (consisting in a solid color, not a brush pattern). This bit is meaningful only if VIEWSTATUS_OPAQUE is set.
     * 
     * This bit applies only to CONTENT related aspects and not to DVASPECT_ICON or DVASPECT_DOCPRINT.
     * Native name: VIEWSTATUS_SOLIDBKGND
     * @type {Integer (Int32)}
     */
    static SOLIDBKGND => 2

    /**
     * The object supports DVASPECT_OPAQUE. All <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-iviewobjectex">IViewObjectEx</a> methods taking a drawing aspect as a parameter can be called with this aspect.
     * Native name: VIEWSTATUS_DVASPECTOPAQUE
     * @type {Integer (Int32)}
     */
    static DVASPECTOPAQUE => 4

    /**
     * The object supports DVASPECT_TRANSPARENT. All <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-iviewobjectex">IViewObjectEx</a> methods taking a drawing aspect as a parameter can be called with this aspect.
     * Native name: VIEWSTATUS_DVASPECTTRANSPARENT
     * @type {Integer (Int32)}
     */
    static DVASPECTTRANSPARENT => 8

    /**
     * The object supports a 2-dimensional surface.
     * Native name: VIEWSTATUS_SURFACE
     * @type {Integer (Int32)}
     */
    static SURFACE => 16

    /**
     * The object supports a 3-dimensional surface.
     * Native name: VIEWSTATUS_3DSURFACE
     * @type {Integer (Int32)}
     */
    static 3DSURFACE => 32
}
