#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DWRITE_BITMAP_DATA_BGRA32.ahk
#Include .\IDWriteBitmapRenderTarget1.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteBitmapRenderTarget2 extends IDWriteBitmapRenderTarget1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteBitmapRenderTarget2
     * @type {Guid}
     */
    static IID => Guid("{c553a742-fc01-44da-a66e-b8b9ed6c3995}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBitmapData"]

    /**
     * 
     * @returns {DWRITE_BITMAP_DATA_BGRA32} 
     */
    GetBitmapData() {
        bitmapData := DWRITE_BITMAP_DATA_BGRA32()
        result := ComCall(13, this, "ptr", bitmapData, "HRESULT")
        return bitmapData
    }
}
