#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1DeviceContext2.ahk

/**
 * This interface performs all the same functions as the ID2D1DeviceContext2 interface, plus it enables functionality for creating and drawing sprite batches.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nn-d2d1_3-id2d1devicecontext3
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1DeviceContext3 extends ID2D1DeviceContext2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1DeviceContext3
     * @type {Guid}
     */
    static IID => Guid("{235a7496-8351-414c-bcd4-6672ab2d8e00}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 106

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSpriteBatch", "DrawSpriteBatch"]

    /**
     * 
     * @param {Pointer<ID2D1SpriteBatch>} spriteBatch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1devicecontext3-createspritebatch
     */
    CreateSpriteBatch(spriteBatch) {
        result := ComCall(106, this, "ptr*", spriteBatch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID2D1SpriteBatch} spriteBatch 
     * @param {Integer} startIndex 
     * @param {Integer} spriteCount 
     * @param {ID2D1Bitmap} bitmap 
     * @param {Integer} interpolationMode 
     * @param {Integer} spriteOptions 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1devicecontext3-drawspritebatch(id2d1spritebatch_id2d1bitmap_d2d1_bitmap_interpolation_mode_d2d1_sprite_options)
     */
    DrawSpriteBatch(spriteBatch, startIndex, spriteCount, bitmap, interpolationMode, spriteOptions) {
        ComCall(107, this, "ptr", spriteBatch, "uint", startIndex, "uint", spriteCount, "ptr", bitmap, "int", interpolationMode, "int", spriteOptions)
    }
}
