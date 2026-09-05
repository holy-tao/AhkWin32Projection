#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the type of an object that is derived from IXpsOMShareable.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_object_type
 * @namespace Windows.Win32.Storage.Xps
 */
class XPS_OBJECT_TYPE extends Win32Enum {

    /**
     * The object is an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomcanvas">IXpsOMCanvas</a> interface.
     * Native name: XPS_OBJECT_TYPE_CANVAS
     * @type {Integer (Int32)}
     */
    static CANVAS => 1

    /**
     * The object is an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomglyphs">IXpsOMGlyphs</a> interface.
     * Native name: XPS_OBJECT_TYPE_GLYPHS
     * @type {Integer (Int32)}
     */
    static GLYPHS => 2

    /**
     * The object is an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompath">IXpsOMPath</a> interface.
     * Native name: XPS_OBJECT_TYPE_PATH
     * @type {Integer (Int32)}
     */
    static PATH => 3

    /**
     * The object is an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsommatrixtransform">IXpsOMMatrixTransform</a> interface.
     * Native name: XPS_OBJECT_TYPE_MATRIX_TRANSFORM
     * @type {Integer (Int32)}
     */
    static MATRIX_TRANSFORM => 4

    /**
     * The object is an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomgeometry">IXpsOMGeometry</a> interface.
     * Native name: XPS_OBJECT_TYPE_GEOMETRY
     * @type {Integer (Int32)}
     */
    static GEOMETRY => 5

    /**
     * The object is an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomsolidcolorbrush">IXpsOMSolidColorBrush</a> interface.
     * Native name: XPS_OBJECT_TYPE_SOLID_COLOR_BRUSH
     * @type {Integer (Int32)}
     */
    static SOLID_COLOR_BRUSH => 6

    /**
     * The object is an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomimagebrush">IXpsOMImageBrush</a> interface.
     * Native name: XPS_OBJECT_TYPE_IMAGE_BRUSH
     * @type {Integer (Int32)}
     */
    static IMAGE_BRUSH => 7

    /**
     * The object is an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomlineargradientbrush">IXpsOMLinearGradientBrush</a> interface.
     * Native name: XPS_OBJECT_TYPE_LINEAR_GRADIENT_BRUSH
     * @type {Integer (Int32)}
     */
    static LINEAR_GRADIENT_BRUSH => 8

    /**
     * The object is an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomradialgradientbrush">IXpsOMRadialGradientBrush</a> interface.
     * Native name: XPS_OBJECT_TYPE_RADIAL_GRADIENT_BRUSH
     * @type {Integer (Int32)}
     */
    static RADIAL_GRADIENT_BRUSH => 9

    /**
     * The object is an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomvisualbrush">IXpsOMVisualBrush</a> interface.
     * Native name: XPS_OBJECT_TYPE_VISUAL_BRUSH
     * @type {Integer (Int32)}
     */
    static VISUAL_BRUSH => 10
}
