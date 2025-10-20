#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IXpsRasterizationFactory1 extends IUnknown{
    /**
     * The interface identifier for IXpsRasterizationFactory1
     * @type {Guid}
     */
    static IID => Guid("{2d6e5f77-6414-4a1e-a8e0-d4194ce6a26f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IXpsOMPage>} xpsPage 
     * @param {Float} DPI 
     * @param {Integer} nonTextRenderingMode 
     * @param {Integer} textRenderingMode 
     * @param {Integer} pixelFormat 
     * @param {Pointer<IXpsRasterizer>} ppIXPSRasterizer 
     * @returns {HRESULT} 
     */
    CreateRasterizer(xpsPage, DPI, nonTextRenderingMode, textRenderingMode, pixelFormat, ppIXPSRasterizer) {
        result := ComCall(3, this, "ptr", xpsPage, "float", DPI, "int", nonTextRenderingMode, "int", textRenderingMode, "int", pixelFormat, "ptr", ppIXPSRasterizer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
