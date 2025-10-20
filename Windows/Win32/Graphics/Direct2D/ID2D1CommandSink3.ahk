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
     * 
     * @param {Pointer<ID2D1SpriteBatch>} spriteBatch 
     * @param {Integer} startIndex 
     * @param {Integer} spriteCount 
     * @param {Pointer<ID2D1Bitmap>} bitmap 
     * @param {Integer} interpolationMode 
     * @param {Integer} spriteOptions 
     * @returns {HRESULT} 
     */
    DrawSpriteBatch(spriteBatch, startIndex, spriteCount, bitmap, interpolationMode, spriteOptions) {
        result := ComCall(32, this, "ptr", spriteBatch, "uint", startIndex, "uint", spriteCount, "ptr", bitmap, "int", interpolationMode, "int", spriteOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
