#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Resource.ahk

/**
 * Represents a single group of sprites with their associated drawing properties.
 * @remarks
 * 
 * Create a new sprite batch using <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nf-d2d1_3-id2d1devicecontext3-createspritebatch">ID2D1DeviceContext3::CreateSpriteBatch</a>. 
 *           Use [ID2D1DeviceContext3::DrawSpriteBatch](./nf-d2d1_3-id2d1devicecontext3-createspritebatch.md) to draw them.
 *         
 * 
 * Sprites are a way for apps to draw a large number of images very efficiently. 
 *         They are commonly used to render characters and backgrounds in 2D games, or to render particle systems such as smoke and flames. 
 *         If your app has performance demands and needs to draw hundreds or thousands of images every frame, then consider taking advantage of sprite batches and the fine-grained control they offer, 
 *         instead of the general-purpose DrawImage method.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nn-d2d1_3-id2d1spritebatch
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1SpriteBatch extends ID2D1Resource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1SpriteBatch
     * @type {Guid}
     */
    static IID => Guid("{4dc583bf-3a10-438a-8722-e9765224f1f1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddSprites", "SetSprites", "GetSprites", "GetSpriteCount", "Clear"]

    /**
     * Adds the given sprites to the end of this sprite batch.
     * @param {Integer} spriteCount Type: <b>UINT32</b>
     * 
     * The number of sprites to be added. This determines how many strides into each given array Direct2D will read.
     * @param {Pointer<D2D_RECT_F>} destinationRectangles Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>*</b>
     * 
     * A pointer to an array containing the destination rectangles specifying where to draw the sprites on the destination device context.
     * @param {Pointer<D2D_RECT_U>} sourceRectangles Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-u">D2D1_RECT_U</a>*</b>
     * 
     * A pointer to an array containing the source rectangles specifying the regions of the source bitmap to draw as sprites.
     *           Direct2D will use the entire source bitmap for sprites that are assigned a null value or the InfiniteRectU. 
     *           If this parameter is omitted entirely or set to a null value, then Direct2D will use the entire source bitmap for all the added sprites.
     * @param {Pointer<D2D1_COLOR_F>} colors Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-color-f">D2D1_COLOR_F</a>*</b>
     * 
     * A pointer to an array containing the colors to apply to each sprite. 
     *           The output color is the result of component-wise multiplication of the source bitmap color and the provided color. 
     *           The output color is not clamped.
     * 
     *           
     * 
     * Direct2D will not change the color of sprites that are assigned a null value. If this parameter is omitted entirely or set to a null value, 
     *           then Direct2D will not change the color of any of the added sprites.
     * @param {Pointer<D2D_MATRIX_3X2_F>} transforms Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-matrix-3x2-f">D2D1_MATRIX_3X2_F</a>*</b>
     * 
     * A pointer to an array containing the transforms to apply to each sprite’s destination rectangle.
     *             
     * 
     * Direct2D will not transform the destination rectangle of any sprites that are assigned a null value. 
     *             If this parameter is omitted entirely or set to a null value, 
     *             then Direct2D will not transform the destination rectangle of any of the added sprites.
     * @param {Integer} destinationRectanglesStride Type: <b>UINT32</b>
     * 
     * Specifies the distance, in bytes, between each rectangle in the destinationRectangles array. 
     *           If you provide a stride of 0, then the same destination rectangle will be used for each added sprite.
     * @param {Integer} sourceRectanglesStride Type: <b>UINT32</b>
     * 
     * Specifies the distance, in bytes, between each rectangle in the sourceRectangles array (if that array is given). 
     *           If you provide a stride of 0, then the same source rectangle will be used for each added sprite.
     * @param {Integer} colorsStride Type: <b>UINT32</b>
     * 
     * Specifies the distance, in bytes, between each color in the colors array (if that array is given). 
     *           If you provide a stride of 0, then the same color will be used for each added sprite.
     * @param {Integer} transformsStride Type: <b>UINT32</b>
     * 
     * Specifies the distance, in bytes, between each transform in the transforms array (if that array is given). 
     *           If you provide a stride of 0, then the same transform will be used for each added sprite.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1spritebatch-addsprites
     */
    AddSprites(spriteCount, destinationRectangles, sourceRectangles, colors, transforms, destinationRectanglesStride, sourceRectanglesStride, colorsStride, transformsStride) {
        result := ComCall(4, this, "uint", spriteCount, "ptr", destinationRectangles, "ptr", sourceRectangles, "ptr", colors, "ptr", transforms, "uint", destinationRectanglesStride, "uint", sourceRectanglesStride, "uint", colorsStride, "uint", transformsStride, "HRESULT")
        return result
    }

    /**
     * Updates the properties of the specified sprites in this sprite batch.
     * @param {Integer} startIndex Type: <b>UINT32</b>
     * 
     * The index of the first sprite in this sprite batch to update.
     * @param {Integer} spriteCount Type: <b>UINT32</b>
     * 
     * The number of sprites to update with new properties. This determines how many strides into each given array Direct2D will read.
     * @param {Pointer<D2D_RECT_F>} destinationRectangles Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>*</b>
     * 
     * A pointer to an array containing the destination rectangles specifying where to draw the sprites on the destination device context.
     * @param {Pointer<D2D_RECT_U>} sourceRectangles Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-u">D2D1_RECT_U</a>*</b>
     * 
     * A pointer to an array containing the source rectangles specifying the regions of the source bitmap to draw as sprites.
     * 
     *           
     * 
     * Direct2D will use the entire source bitmap for sprites that are assigned a null value or the InfiniteRectU. 
     *           If this parameter is omitted entirely or set to a null value, then Direct2D will use the entire source bitmap for all the updated sprites.
     * @param {Pointer<D2D1_COLOR_F>} colors Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-color-f">D2D1_COLOR_F</a>*</b>
     * 
     * A pointer to an array containing the colors to apply to each sprite. The output color is the result of component-wise multiplication of the source bitmap color and the provided color. 
     *           The output color is not clamped.
     * 
     *           
     * 
     * Direct2D will not change the color of sprites that are assigned a null value. If this parameter is omitted entirely or set to a null value, 
     *           then Direct2D will not change the color of any of the updated sprites.
     * @param {Pointer<D2D_MATRIX_3X2_F>} transforms Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-matrix-3x2-f">D2D1_MATRIX_3X2_F</a>*</b>
     * 
     * A pointer to an array containing the transforms to apply to each sprite’s destination rectangle.
     * 
     *           
     * 
     * Direct2D will not transform the destination rectangle of any sprites that are assigned a null value. 
     *           If this parameter is omitted entirely or set to a null value, then Direct2D will not transform the destination rectangle of any of the updated sprites.
     * @param {Integer} destinationRectanglesStride Type: <b>UINT32</b>
     * 
     * Specifies the distance, in bytes, between each rectangle in the destinationRectangles array. 
     *           If you provide a stride of 0, then the same destination rectangle will be used for each updated sprite.
     * @param {Integer} sourceRectanglesStride Type: <b>UINT32</b>
     * 
     * Specifies the distance, in bytes, between each rectangle in the sourceRectangles array (if that array is given). 
     *           If you provide a stride of 0, then the same source rectangle will be used for each updated sprite.
     * @param {Integer} colorsStride Type: <b>UINT32</b>
     * 
     * Specifies the distance, in bytes, between each color in the colors array (if that array is given). 
     *           If you provide a stride of 0, then the same color will be used for each updated sprite.
     * @param {Integer} transformsStride Type: <b>UINT32</b>
     * 
     * Specifies the distance, in bytes, between each transform in the transforms array (if that array is given). 
     *           If you provide a stride of 0, then the same transform will be used for each updated sprite.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns S_OK on success. Returns E_INVALIDARG if an invalid value was passed to the method. In this case, no sprites are modified by this call to SetSprites.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1spritebatch-setsprites
     */
    SetSprites(startIndex, spriteCount, destinationRectangles, sourceRectangles, colors, transforms, destinationRectanglesStride, sourceRectanglesStride, colorsStride, transformsStride) {
        result := ComCall(5, this, "uint", startIndex, "uint", spriteCount, "ptr", destinationRectangles, "ptr", sourceRectangles, "ptr", colors, "ptr", transforms, "uint", destinationRectanglesStride, "uint", sourceRectanglesStride, "uint", colorsStride, "uint", transformsStride, "HRESULT")
        return result
    }

    /**
     * Retrieves the specified subset of sprites from this sprite batch. For the best performance, use nullptr for properties that you do not need to retrieve.
     * @param {Integer} startIndex Type: <b>UINT32</b>
     * 
     * The index of the first sprite in this sprite batch to retrieve.
     * @param {Integer} spriteCount Type: <b>UINT32</b>
     * 
     * The number of sprites to retrieve.
     * @param {Pointer<D2D_RECT_F>} destinationRectangles Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>*</b>
     * 
     * When this method returns, contains a pointer to an array containing the destination rectangles for the retrieved sprites.
     * @param {Pointer<D2D_RECT_U>} sourceRectangles Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-u">D2D1_RECT_U</a>*</b>
     * 
     * When this method returns, contains a pointer to an array containing the source rectangles for the retrieved sprites.
     * 
     *           
     * 
     * The InfiniteRectU is returned for any sprites that were not assigned a source rectangle.
     * @param {Pointer<D2D1_COLOR_F>} colors Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-color-f">D2D1_COLOR_F</a>*</b>
     * 
     * When this method returns, contains a pointer to an array containing the colors to be applied to the retrieved sprites.
     * 
     *           
     * 
     * The color {1.0f, 1.0f, 1.0f, 1.0f} is returned for any sprites that were not assigned a color.
     * @param {Pointer<D2D_MATRIX_3X2_F>} transforms Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-matrix-3x2-f">D2D1_MATRIX_3X2_F</a>*</b>
     * 
     * When this method returns, contains a pointer to an array containing the transforms to be applied to the retrieved sprites.
     * 
     *             
     * 
     * The identity matrix is returned for any sprites that were not assigned a transform.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1spritebatch-getsprites
     */
    GetSprites(startIndex, spriteCount, destinationRectangles, sourceRectangles, colors, transforms) {
        result := ComCall(6, this, "uint", startIndex, "uint", spriteCount, "ptr", destinationRectangles, "ptr", sourceRectangles, "ptr", colors, "ptr", transforms, "HRESULT")
        return result
    }

    /**
     * Retrieves the number of sprites in this sprite batch.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * Returns the number of sprites in this sprite batch
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1spritebatch-getspritecount
     */
    GetSpriteCount() {
        result := ComCall(7, this, "uint")
        return result
    }

    /**
     * Removes all sprites from this sprite batch.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1spritebatch-clear
     */
    Clear() {
        ComCall(8, this)
    }
}
