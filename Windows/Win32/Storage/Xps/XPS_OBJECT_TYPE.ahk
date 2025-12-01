#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the type of an object that is derived from IXpsOMShareable.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_object_type
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class XPS_OBJECT_TYPE extends Win32Enum{

    /**
     * The object is an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomcanvas">IXpsOMCanvas</a> interface.
     * @type {Integer (Int32)}
     */
    static XPS_OBJECT_TYPE_CANVAS => 1

    /**
     * The object is an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomglyphs">IXpsOMGlyphs</a> interface.
     * @type {Integer (Int32)}
     */
    static XPS_OBJECT_TYPE_GLYPHS => 2

    /**
     * The object is an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsompath">IXpsOMPath</a> interface.
     * @type {Integer (Int32)}
     */
    static XPS_OBJECT_TYPE_PATH => 3

    /**
     * The object is an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsommatrixtransform">IXpsOMMatrixTransform</a> interface.
     * @type {Integer (Int32)}
     */
    static XPS_OBJECT_TYPE_MATRIX_TRANSFORM => 4

    /**
     * The object is an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomgeometry">IXpsOMGeometry</a> interface.
     * @type {Integer (Int32)}
     */
    static XPS_OBJECT_TYPE_GEOMETRY => 5

    /**
     * The object is an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomsolidcolorbrush">IXpsOMSolidColorBrush</a> interface.
     * @type {Integer (Int32)}
     */
    static XPS_OBJECT_TYPE_SOLID_COLOR_BRUSH => 6

    /**
     * The object is an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomimagebrush">IXpsOMImageBrush</a> interface.
     * @type {Integer (Int32)}
     */
    static XPS_OBJECT_TYPE_IMAGE_BRUSH => 7

    /**
     * The object is an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomlineargradientbrush">IXpsOMLinearGradientBrush</a> interface.
     * @type {Integer (Int32)}
     */
    static XPS_OBJECT_TYPE_LINEAR_GRADIENT_BRUSH => 8

    /**
     * The object is an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomradialgradientbrush">IXpsOMRadialGradientBrush</a> interface.
     * @type {Integer (Int32)}
     */
    static XPS_OBJECT_TYPE_RADIAL_GRADIENT_BRUSH => 9

    /**
     * The object is an <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomvisualbrush">IXpsOMVisualBrush</a> interface.
     * @type {Integer (Int32)}
     */
    static XPS_OBJECT_TYPE_VISUAL_BRUSH => 10
}
