#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Brush.ahk

/**
 * Paints an area with a solid color.
 * @remarks
 * 
 * <h3><a id="Creating_ID2D1SolidColorBrush_Objects"></a><a id="creating_id2d1solidcolorbrush_objects"></a><a id="CREATING_ID2D1SOLIDCOLORBRUSH_OBJECTS"></a>Creating ID2D1SolidColorBrush Objects</h3>
 * 
 * To create a solid color brush, use the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-createsolidcolorbrush(constd2d1_color_f__id2d1solidcolorbrush)">ID2D1RenderTarget::CreateSolidColorBrush</a> method of the render target on which the brush will be used. The brush can only be used with the render target that created it or with the compatible targets for that render target.
 * 
 * 
 * A solid color brush is a device-dependent resource. (For more information about resources, see <a href="https://docs.microsoft.com/windows/win32/Direct2D/resources-and-resource-domains">Resources Overview</a>.)
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/nn-d2d1-id2d1solidcolorbrush
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1SolidColorBrush extends ID2D1Brush{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1SolidColorBrush
     * @type {Guid}
     */
    static IID => Guid("{2cd906a9-12e2-11dc-9fed-001143a055f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetColor", "GetColor"]

    /**
     * 
     * @param {Pointer<D2D1_COLOR_F>} color 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1solidcolorbrush-setcolor
     */
    SetColor(color) {
        ComCall(8, this, "ptr", color)
    }

    /**
     * Retrieves the color of the solid color brush.
     * @returns {D2D1_COLOR_F} Type: <b><a href="/windows/win32/Direct2D/d2d1-color-f">D2D1_COLOR_F</a></b>
     * 
     * The color of this solid color brush.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1solidcolorbrush-getcolor
     */
    GetColor() {
        result := ComCall(9, this, "ptr")
        return result
    }
}
