#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<IXpsOMMatrixTransform>} transform 
     * @returns {HRESULT} 
     */
    GetTransform(transform) {
        result := ComCall(7, this, "ptr", transform, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMMatrixTransform>} transform 
     * @returns {HRESULT} 
     */
    GetTransformLocal(transform) {
        result := ComCall(8, this, "ptr", transform, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMMatrixTransform>} transform 
     * @returns {HRESULT} 
     */
    SetTransformLocal(transform) {
        result := ComCall(9, this, "ptr", transform, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} key 
     * @returns {HRESULT} 
     */
    GetTransformLookup(key) {
        result := ComCall(10, this, "ptr", key, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} key 
     * @returns {HRESULT} 
     */
    SetTransformLookup(key) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(11, this, "ptr", key, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<XPS_RECT>} viewbox 
     * @returns {HRESULT} 
     */
    GetViewbox(viewbox) {
        result := ComCall(12, this, "ptr", viewbox, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<XPS_RECT>} viewbox 
     * @returns {HRESULT} 
     */
    SetViewbox(viewbox) {
        result := ComCall(13, this, "ptr", viewbox, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<XPS_RECT>} viewport 
     * @returns {HRESULT} 
     */
    GetViewport(viewport) {
        result := ComCall(14, this, "ptr", viewport, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<XPS_RECT>} viewport 
     * @returns {HRESULT} 
     */
    SetViewport(viewport) {
        result := ComCall(15, this, "ptr", viewport, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} tileMode 
     * @returns {HRESULT} 
     */
    GetTileMode(tileMode) {
        result := ComCall(16, this, "int*", tileMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} tileMode 
     * @returns {HRESULT} 
     */
    SetTileMode(tileMode) {
        result := ComCall(17, this, "int", tileMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
