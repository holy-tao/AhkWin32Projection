#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IXpsRasterizer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsRasterizer
     * @type {Guid}
     */
    static IID => Guid("{7567cfc8-c156-47a8-9dac-11a2ae5bdd6b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RasterizeRect", "SetMinimalLineWidth"]

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {IXpsRasterizerNotificationCallback} notificationCallback 
     * @param {Pointer<IWICBitmap>} bitmap 
     * @returns {HRESULT} 
     */
    RasterizeRect(x, y, width, height, notificationCallback, bitmap) {
        result := ComCall(3, this, "int", x, "int", y, "int", width, "int", height, "ptr", notificationCallback, "ptr*", bitmap, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} width 
     * @returns {HRESULT} 
     */
    SetMinimalLineWidth(width) {
        result := ComCall(4, this, "int", width, "HRESULT")
        return result
    }
}
