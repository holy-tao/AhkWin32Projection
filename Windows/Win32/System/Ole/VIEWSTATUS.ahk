#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the opacity of the object and the drawing aspects supported by the object.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/ne-ocidl-viewstatus
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class VIEWSTATUS{

    /**
     * The object is completely opaque. So, for any aspect, it promises to draw the entire rectangle passed to the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iviewobject-draw">IViewObject::Draw</a> method. If this value is not set, the object contains transparent parts. If it also support DVASPECT_TRANSPARENT, then this aspect may be used to draw the transparent parts only.
 * 
 * This bit applies only to CONTENT related aspects and not to DVASPECT_ICON or DVASPECT_DOCPRINT.
     * @type {Integer (Int32)}
     */
    static VIEWSTATUS_OPAQUE => 1

    /**
     * The object has a solid background (consisting in a solid color, not a brush pattern). This bit is meaningful only if VIEWSTATUS_OPAQUE is set.
 * 
 * This bit applies only to CONTENT related aspects and not to DVASPECT_ICON or DVASPECT_DOCPRINT.
     * @type {Integer (Int32)}
     */
    static VIEWSTATUS_SOLIDBKGND => 2

    /**
     * The object supports DVASPECT_OPAQUE. All <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-iviewobjectex">IViewObjectEx</a> methods taking a drawing aspect as a parameter can be called with this aspect.
     * @type {Integer (Int32)}
     */
    static VIEWSTATUS_DVASPECTOPAQUE => 4

    /**
     * The object supports DVASPECT_TRANSPARENT. All <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-iviewobjectex">IViewObjectEx</a> methods taking a drawing aspect as a parameter can be called with this aspect.
     * @type {Integer (Int32)}
     */
    static VIEWSTATUS_DVASPECTTRANSPARENT => 8

    /**
     * The object supports a 2-dimensional surface.
     * @type {Integer (Int32)}
     */
    static VIEWSTATUS_SURFACE => 16

    /**
     * The object supports a 3-dimensional surface.
     * @type {Integer (Int32)}
     */
    static VIEWSTATUS_3DSURFACE => 32
}
