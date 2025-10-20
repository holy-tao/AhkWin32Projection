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
     * 
     * @param {Integer} spriteCount 
     * @param {Pointer<D2D_RECT_F>} destinationRectangles 
     * @param {Pointer<D2D_RECT_U>} sourceRectangles 
     * @param {Pointer<D2D1_COLOR_F>} colors 
     * @param {Pointer<D2D_MATRIX_3X2_F>} transforms 
     * @param {Integer} destinationRectanglesStride 
     * @param {Integer} sourceRectanglesStride 
     * @param {Integer} colorsStride 
     * @param {Integer} transformsStride 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1spritebatch-addsprites
     */
    AddSprites(spriteCount, destinationRectangles, sourceRectangles, colors, transforms, destinationRectanglesStride, sourceRectanglesStride, colorsStride, transformsStride) {
        result := ComCall(4, this, "uint", spriteCount, "ptr", destinationRectangles, "ptr", sourceRectangles, "ptr", colors, "ptr", transforms, "uint", destinationRectanglesStride, "uint", sourceRectanglesStride, "uint", colorsStride, "uint", transformsStride, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} startIndex 
     * @param {Integer} spriteCount 
     * @param {Pointer<D2D_RECT_F>} destinationRectangles 
     * @param {Pointer<D2D_RECT_U>} sourceRectangles 
     * @param {Pointer<D2D1_COLOR_F>} colors 
     * @param {Pointer<D2D_MATRIX_3X2_F>} transforms 
     * @param {Integer} destinationRectanglesStride 
     * @param {Integer} sourceRectanglesStride 
     * @param {Integer} colorsStride 
     * @param {Integer} transformsStride 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1spritebatch-setsprites
     */
    SetSprites(startIndex, spriteCount, destinationRectangles, sourceRectangles, colors, transforms, destinationRectanglesStride, sourceRectanglesStride, colorsStride, transformsStride) {
        result := ComCall(5, this, "uint", startIndex, "uint", spriteCount, "ptr", destinationRectangles, "ptr", sourceRectangles, "ptr", colors, "ptr", transforms, "uint", destinationRectanglesStride, "uint", sourceRectanglesStride, "uint", colorsStride, "uint", transformsStride, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} startIndex 
     * @param {Integer} spriteCount 
     * @param {Pointer<D2D_RECT_F>} destinationRectangles 
     * @param {Pointer<D2D_RECT_U>} sourceRectangles 
     * @param {Pointer<D2D1_COLOR_F>} colors 
     * @param {Pointer<D2D_MATRIX_3X2_F>} transforms 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1spritebatch-getsprites
     */
    GetSprites(startIndex, spriteCount, destinationRectangles, sourceRectangles, colors, transforms) {
        result := ComCall(6, this, "uint", startIndex, "uint", spriteCount, "ptr", destinationRectangles, "ptr", sourceRectangles, "ptr", colors, "ptr", transforms, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1spritebatch-getspritecount
     */
    GetSpriteCount() {
        result := ComCall(7, this, "uint")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1spritebatch-clear
     */
    Clear() {
        ComCall(8, this)
    }
}
