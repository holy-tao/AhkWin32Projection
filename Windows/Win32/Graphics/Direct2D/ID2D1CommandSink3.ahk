#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1CommandSink2.ahk

/**
 * This interface performs all the same functions as the existing ID2D1CommandSink2 interface. It also enables access to sprite batch rendering.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nn-d2d1_3-id2d1commandsink3
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1CommandSink3 extends ID2D1CommandSink2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1CommandSink3
     * @type {Guid}
     */
    static IID => Guid("{18079135-4cf3-4868-bc8e-06067e6d242d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 32

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DrawSpriteBatch"]

    /**
     * Renders part or all of the given sprite batch to the device context using the specified drawing options.
     * @param {ID2D1SpriteBatch} spriteBatch Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1spritebatch">ID2D1SpriteBatch</a>*</b>
     * 
     * The sprite batch to draw.
     * @param {Integer} startIndex Type: <b>UINT32</b>
     * 
     * The index of the first sprite in the sprite batch to draw.
     * @param {Integer} spriteCount Type: <b>UINT32</b>
     * 
     * The number of sprites to draw.
     * @param {ID2D1Bitmap} bitmap Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1bitmap">ID2D1Bitmap</a>*</b>
     * 
     * The bitmap from which the sprites are to be sourced. Each sprite’s source rectangle refers to a portion of this bitmap.
     * @param {Integer} interpolationMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_bitmap_interpolation_mode">D2D1_BITMAP_INTERPOLATION_MODE</a></b>
     * 
     * The interpolation mode to use when drawing this sprite batch. This determines how Direct2D interpolates pixels within the drawn sprites if scaling is performed.
     * @param {Integer} spriteOptions Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/ne-d2d1_3-d2d1_sprite_options">D2D1_SPRITE_OPTIONS</a></b>
     * 
     * The additional drawing options, if any, to be used for this sprite batch.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nf-d2d1_3-id2d1commandsink3-drawspritebatch
     */
    DrawSpriteBatch(spriteBatch, startIndex, spriteCount, bitmap, interpolationMode, spriteOptions) {
        result := ComCall(32, this, "ptr", spriteBatch, "uint", startIndex, "uint", spriteCount, "ptr", bitmap, "int", interpolationMode, "int", spriteOptions, "HRESULT")
        return result
    }
}
