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
     * Gets a pointer to the IXpsOMMatrixTransform interface that contains the resolved matrix transform for the brush.
     * @returns {IXpsOMMatrixTransform} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsommatrixtransform">IXpsOMMatrixTransform</a>  interface that contains the resolved matrix transform for the brush. If a matrix transform has not been set, a <b>NULL</b> pointer is returned.
     * 
     * The value that is returned in this parameter depends on which method has most recently been called to set the transform.
     * 
     * <table>
     * <tr>
     * <th>Most recent method called</th>
     * <th>Object that is returned  in <i>transform</i></th>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomtilebrush-settransformlocal">SetTransformLocal</a>
     * 
     * 
     * </td>
     * <td>
     * The transform that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomtilebrush-settransformlocal">SetTransformLocal</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomtilebrush-settransformlookup">SetTransformLookup</a>
     * 
     * 
     * </td>
     * <td>
     * The transform which is retrieved, using a lookup key that matches the key that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomtilebrush-settransformlookup">SetTransformLookup</a>, from the resource directory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Neither <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomtilebrush-settransformlocal">SetTransformLocal</a> nor <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomtilebrush-settransformlookup">SetTransformLookup</a> has been called yet.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomtilebrush-gettransform
     */
    GetTransform() {
        result := ComCall(7, this, "ptr*", &transform := 0, "HRESULT")
        return IXpsOMMatrixTransform(transform)
    }

    /**
     * Gets a pointer to the IXpsOMMatrixTransform interface that contains the local, unshared resolved matrix transform for the brush.
     * @returns {IXpsOMMatrixTransform} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsommatrixtransform">IXpsOMMatrixTransform</a> interface that contains the local, unshared resolved matrix transform for the brush. If  a local matrix transform has not been set or if a matrix transform lookup key has been set, a <b>NULL</b> pointer is returned.
     * 
     * <table>
     * <tr>
     * <th>Most recent method called</th>
     * <th>Object that is returned  in <i>transform</i></th>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomtilebrush-settransformlocal">SetTransformLocal</a>
     * 
     * 
     * </td>
     * <td>
     * The transform that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomtilebrush-settransformlocal">SetTransformLocal</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomtilebrush-settransformlookup">SetTransformLookup</a>
     * 
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Neither <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomtilebrush-settransformlocal">SetTransformLocal</a> nor <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomtilebrush-settransformlookup">SetTransformLookup</a> has been called yet.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomtilebrush-gettransformlocal
     */
    GetTransformLocal() {
        result := ComCall(8, this, "ptr*", &transform := 0, "HRESULT")
        return IXpsOMMatrixTransform(transform)
    }

    /**
     * Sets the IXpsOMMatrixTransform interface pointer to a local, unshared matrix transform.
     * @param {IXpsOMMatrixTransform} transform A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsommatrixtransform">IXpsOMMatrixTransform</a> interface to be set as the local, unshared matrix transform. If a local transform has been set, a <b>NULL</b> pointer will release it.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_NO_CUSTOM_OBJECTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>transform</i> does not point to a recognized interface implementation. Custom implementation of XPS Document API interfaces is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomtilebrush-settransformlocal
     */
    SetTransformLocal(transform) {
        result := ComCall(9, this, "ptr", transform, "HRESULT")
        return result
    }

    /**
     * Gets the lookup key that identifies the IXpsOMMatrixTransform interface in a resource dictionary that contains the resolved matrix transform for the brush.
     * @returns {PWSTR} The lookup key that identifies the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsommatrixtransform">IXpsOMMatrixTransform</a> interface in a resource dictionary that contains the resolved matrix transform for the brush. If a matrix transform lookup key has not been set or if a local matrix transform has  been set, a <b>NULL</b> pointer is returned.
     * 
     * <table>
     * <tr>
     * <th>Most recent method called</th>
     * <th>Object that is returned  in <i>key</i></th>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomtilebrush-settransformlocal">SetTransformLocal</a>
     * 
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomtilebrush-settransformlookup">SetTransformLookup</a>
     * 
     * 
     * </td>
     * <td>
     * The lookup key  set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomtilebrush-settransformlookup">SetTransformLookup</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Neither <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomtilebrush-settransformlocal">SetTransformLocal</a> nor <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomtilebrush-settransformlookup">SetTransformLookup</a> has been called yet.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomtilebrush-gettransformlookup
     */
    GetTransformLookup() {
        result := ComCall(10, this, "ptr*", &key := 0, "HRESULT")
        return key
    }

    /**
     * Sets the lookup key name of a shared matrix transform that will be used as the transform for this brush.
     * @param {PWSTR} key A string variable that contains the lookup key name of a shared matrix transform in the resource dictionary. If a lookup key has already been set, a <b>NULL</b> pointer will clear it.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_INVALID_RESOURCE_KEY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * According to the <a href="https://www.ecma-international.org/activities/XML%20Paper%20Specification/XPS%20Standard%20WD%201.6.pdf">XML Paper Specification</a>, the value of <i>lookup</i> is not a valid lookup key string.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_INVALID_LOOKUP_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The lookup key name in <i>key</i> references an object that is not a geometry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_LOOKUP_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No object could be found with a key name that matched the value passed in <i>key</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomtilebrush-settransformlookup
     */
    SetTransformLookup(key) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(11, this, "ptr", key, "HRESULT")
        return result
    }

    /**
     * Gets the portion of the source image to be used by the tile.
     * @returns {XPS_RECT} The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_rect">XPS_RECT</a> structure that describes the area of the source content to be used by the tile.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomtilebrush-getviewbox
     */
    GetViewbox() {
        viewbox := XPS_RECT()
        result := ComCall(12, this, "ptr", viewbox, "HRESULT")
        return viewbox
    }

    /**
     * Sets the portion of the source content to be used as the tile image.
     * @param {Pointer<XPS_RECT>} viewbox An <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_rect">XPS_RECT</a> structure that describes the portion of the source content   to be used as the tile image.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>viewbox</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The rectangle described in <i>viewbox</i> was not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomtilebrush-setviewbox
     */
    SetViewbox(viewbox) {
        result := ComCall(13, this, "ptr", viewbox, "HRESULT")
        return result
    }

    /**
     * Gets the portion of the destination geometry that is covered by a single tile.
     * @returns {XPS_RECT} The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_rect">XPS_RECT</a> structure that describes the portion of the destination geometry  that is covered by a single tile.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomtilebrush-getviewport
     */
    GetViewport() {
        viewport := XPS_RECT()
        result := ComCall(14, this, "ptr", viewport, "HRESULT")
        return viewport
    }

    /**
     * Sets the portion of the destination geometry that is covered by a single tile.
     * @param {Pointer<XPS_RECT>} viewport An <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_rect">XPS_RECT</a> structure that describes the portion of the destination geometry that is covered by a single  tile.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>viewport</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The rectangle described in <i>viewport</i> is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomtilebrush-setviewport
     */
    SetViewport(viewport) {
        result := ComCall(15, this, "ptr", viewport, "HRESULT")
        return result
    }

    /**
     * Gets the XPS_TILE_MODE value that describes the tile mode of the brush.
     * @returns {Integer} The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_tile_mode">XPS_TILE_MODE</a> value that describes the tile mode of the brush.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomtilebrush-gettilemode
     */
    GetTileMode() {
        result := ComCall(16, this, "int*", &tileMode := 0, "HRESULT")
        return tileMode
    }

    /**
     * Sets the XPS_TILE_MODE value that describes the tiling mode of the brush.
     * @param {Integer} tileMode The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_tile_mode">XPS_TILE_MODE</a> value to be set.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>tileMode</i> was not a valid <a href="/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_tile_mode">XPS_TILE_MODE</a> value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomtilebrush-settilemode
     */
    SetTileMode(tileMode) {
        result := ComCall(17, this, "int", tileMode, "HRESULT")
        return result
    }
}
