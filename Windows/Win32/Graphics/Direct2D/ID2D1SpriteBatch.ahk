#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "Common\D2D_RECT_U.ahk" { D2D_RECT_U }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "Common\D2D_RECT_F.ahk" { D2D_RECT_F }
#Import "Common\D2D1_COLOR_F.ahk" { D2D1_COLOR_F }
#Import "Common\D2D_MATRIX_3X2_F.ahk" { D2D_MATRIX_3X2_F }
#Import ".\ID2D1Resource.ahk" { ID2D1Resource }

/**
 * Represents a single group of sprites with their associated drawing properties.
 * @remarks
 * Create a new sprite batch using <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nf-d2d1_3-id2d1devicecontext3-createspritebatch">ID2D1DeviceContext3::CreateSpriteBatch</a>. 
 *           Use [ID2D1DeviceContext3::DrawSpriteBatch](./nf-d2d1_3-id2d1devicecontext3-createspritebatch.md) to draw them.
 *         
 * 
 * Sprites are a way for apps to draw a large number of images very efficiently. 
 *         They are commonly used to render characters and backgrounds in 2D games, or to render particle systems such as smoke and flames. 
 *         If your app has performance demands and needs to draw hundreds or thousands of images every frame, then consider taking advantage of sprite batches and the fine-grained control they offer, 
 *         instead of the general-purpose DrawImage method.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nn-d2d1_3-id2d1spritebatch
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1SpriteBatch extends ID2D1Resource {
    /**
     * The interface identifier for ID2D1SpriteBatch
     * @type {Guid}
     */
    static IID := Guid("{4dc583bf-3a10-438a-8722-e9765224f1f1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1SpriteBatch interfaces
    */
    struct Vtbl extends ID2D1Resource.Vtbl {
        AddSprites     : IntPtr
        SetSprites     : IntPtr
        GetSprites     : IntPtr
        GetSpriteCount : IntPtr
        Clear          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1SpriteBatch.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Adds the given sprites to the end of this sprite batch.
     * @remarks
     * In Direct2D, a sprite is defined by four properties: a destination rectangle, a source rectangle, a color, and a transform. 
     *         Destination rectangles are mandatory, but the remaining properties are optional.
     * 
     * <div class="alert"><b>Note</b>  Always omit or pass a null value for properties you do not wish to use. This allows Direct2D to avoid storing values for those properties and to skip their handling entirely, 
     *         which improves drawing speed. For example, suppose you have a batch of 500 sprites, and you do not wish to transform any of their destination rectangles. 
     *         Rather than passing an array of identity matrices, simply omit the transforms parameter. This allows Direct2D to avoid storing any transforms and will yield the fastest drawing performance. 
     *         On the other hand, if any sprite in the batch has any value set for a property, then internally 
     *         Direct2D must allocate space for that property array and assign every sprite a value for that property (even if it’s just the default value).</div>
     * <div> </div>
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1spritebatch-addsprites
     */
    AddSprites(spriteCount, destinationRectangles, sourceRectangles, colors, transforms, destinationRectanglesStride, sourceRectanglesStride, colorsStride, transformsStride) {
        result := ComCall(4, this, "uint", spriteCount, D2D_RECT_F.Ptr, destinationRectangles, D2D_RECT_U.Ptr, sourceRectangles, D2D1_COLOR_F.Ptr, colors, D2D_MATRIX_3X2_F.Ptr, transforms, "uint", destinationRectanglesStride, "uint", sourceRectanglesStride, "uint", colorsStride, "uint", transformsStride, "HRESULT")
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns S_OK on success. Returns E_INVALIDARG if an invalid value was passed to the method. In this case, no sprites are modified by this call to SetSprites.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1spritebatch-setsprites
     */
    SetSprites(startIndex, spriteCount, destinationRectangles, sourceRectangles, colors, transforms, destinationRectanglesStride, sourceRectanglesStride, colorsStride, transformsStride) {
        result := ComCall(5, this, "uint", startIndex, "uint", spriteCount, D2D_RECT_F.Ptr, destinationRectangles, D2D_RECT_U.Ptr, sourceRectangles, D2D1_COLOR_F.Ptr, colors, D2D_MATRIX_3X2_F.Ptr, transforms, "uint", destinationRectanglesStride, "uint", sourceRectanglesStride, "uint", colorsStride, "uint", transformsStride, "HRESULT")
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1spritebatch-getsprites
     */
    GetSprites(startIndex, spriteCount, destinationRectangles, sourceRectangles, colors, transforms) {
        result := ComCall(6, this, "uint", startIndex, "uint", spriteCount, D2D_RECT_F.Ptr, destinationRectangles, D2D_RECT_U.Ptr, sourceRectangles, D2D1_COLOR_F.Ptr, colors, D2D_MATRIX_3X2_F.Ptr, transforms, "HRESULT")
        return result
    }

    /**
     * Retrieves the number of sprites in this sprite batch.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * Returns the number of sprites in this sprite batch
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1spritebatch-getspritecount
     */
    GetSpriteCount() {
        result := ComCall(7, this, UInt32)
        return result
    }

    /**
     * Removes all sprites from this sprite batch.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1spritebatch-clear
     */
    Clear() {
        ComCall(8, this)
    }

    Query(iid) {
        if (ID2D1SpriteBatch.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddSprites := CallbackCreate(GetMethod(implObj, "AddSprites"), flags, 10)
        this.vtbl.SetSprites := CallbackCreate(GetMethod(implObj, "SetSprites"), flags, 11)
        this.vtbl.GetSprites := CallbackCreate(GetMethod(implObj, "GetSprites"), flags, 7)
        this.vtbl.GetSpriteCount := CallbackCreate(GetMethod(implObj, "GetSpriteCount"), flags, 1)
        this.vtbl.Clear := CallbackCreate(GetMethod(implObj, "Clear"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddSprites)
        CallbackFree(this.vtbl.SetSprites)
        CallbackFree(this.vtbl.GetSprites)
        CallbackFree(this.vtbl.GetSpriteCount)
        CallbackFree(this.vtbl.Clear)
    }
}
