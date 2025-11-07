#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMMatrixTransform.ahk
#Include .\XPS_RECT.ahk
#Include .\IXpsOMBrush.ahk

/**
 * A tile brush uses a visual image to paint a region by repeating the image.
 * @remarks
 * 
  * As shown in the illustration that follows, the tile brush takes a visual element, or a part of it,  transforms the visual element to create a tile, places the tile in the viewport of the output area, and fills the output area  as specified  by the tile mode.
  * 
  * <img alt="A figure that shows how a tile brush fills a geometry" src="./images/tile_cherry.png"/>
  * In the preceding illustration, the <i>viewport</i> is the area covered by the first tile in the output area. The viewport image is repeated throughout the output area as specified by the tile mode. The transform  property determines how the output area is transformed after the viewport has been tiled in the output area. The  part of the output area that is ultimately rendered as a visible image is determined by the path, stroke, or glyph that is using the tile brush.
  * 
  * A <i>viewbox</i> describes the portion of the source image that is used for the brush. The viewbox in the preceding illustration has the same size as the source image, so all of the source image is used for the brush. A viewbox can also be smaller than the original image.
  * 
  *  In the illustration that follows, the  brush is created by using  a viewbox that includes only a portion of the original image or visual.
  * 
  * <img alt="An illustration that shows a viewbox example" src="./images/CreateBrush.png"/>
  * The next illustration shows the tile modes that are used to repeat the tile image to fill the output area. If the tile mode value is <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_tile_mode">XPS_TILE_MODE_NONE</a>, the tile image is drawn only once.
  * 
  * <img alt="An illustration that shows different examples of different tile mode behaviors" src="./images/TileMode.png"/>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomtilebrush
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMTileBrush extends IXpsOMBrush{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMTileBrush
     * @type {Guid}
     */
    static IID => Guid("{0fc2328d-d722-4a54-b2ec-be90218a789e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTransform", "GetTransformLocal", "SetTransformLocal", "GetTransformLookup", "SetTransformLookup", "GetViewbox", "SetViewbox", "GetViewport", "SetViewport", "GetTileMode", "SetTileMode"]

    /**
     * 
     * @returns {IXpsOMMatrixTransform} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomtilebrush-gettransform
     */
    GetTransform() {
        result := ComCall(7, this, "ptr*", &transform := 0, "HRESULT")
        return IXpsOMMatrixTransform(transform)
    }

    /**
     * 
     * @returns {IXpsOMMatrixTransform} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomtilebrush-gettransformlocal
     */
    GetTransformLocal() {
        result := ComCall(8, this, "ptr*", &transform := 0, "HRESULT")
        return IXpsOMMatrixTransform(transform)
    }

    /**
     * 
     * @param {IXpsOMMatrixTransform} transform 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomtilebrush-settransformlocal
     */
    SetTransformLocal(transform) {
        result := ComCall(9, this, "ptr", transform, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomtilebrush-gettransformlookup
     */
    GetTransformLookup() {
        result := ComCall(10, this, "ptr*", &key := 0, "HRESULT")
        return key
    }

    /**
     * 
     * @param {PWSTR} key 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomtilebrush-settransformlookup
     */
    SetTransformLookup(key) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(11, this, "ptr", key, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {XPS_RECT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomtilebrush-getviewbox
     */
    GetViewbox() {
        viewbox := XPS_RECT()
        result := ComCall(12, this, "ptr", viewbox, "HRESULT")
        return viewbox
    }

    /**
     * 
     * @param {Pointer<XPS_RECT>} viewbox 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomtilebrush-setviewbox
     */
    SetViewbox(viewbox) {
        result := ComCall(13, this, "ptr", viewbox, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {XPS_RECT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomtilebrush-getviewport
     */
    GetViewport() {
        viewport := XPS_RECT()
        result := ComCall(14, this, "ptr", viewport, "HRESULT")
        return viewport
    }

    /**
     * 
     * @param {Pointer<XPS_RECT>} viewport 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomtilebrush-setviewport
     */
    SetViewport(viewport) {
        result := ComCall(15, this, "ptr", viewport, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomtilebrush-gettilemode
     */
    GetTileMode() {
        result := ComCall(16, this, "int*", &tileMode := 0, "HRESULT")
        return tileMode
    }

    /**
     * 
     * @param {Integer} tileMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomtilebrush-settilemode
     */
    SetTileMode(tileMode) {
        result := ComCall(17, this, "int", tileMode, "HRESULT")
        return result
    }
}
