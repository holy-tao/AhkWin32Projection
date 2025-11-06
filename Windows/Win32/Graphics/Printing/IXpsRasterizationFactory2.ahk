#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsRasterizer.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IXpsRasterizationFactory2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsRasterizationFactory2
     * @type {Guid}
     */
    static IID => Guid("{9c16ce3e-10f5-41fd-9ddc-6826669c2ff6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateRasterizer"]

    /**
     * 
     * @param {IXpsOMPage} xpsPage 
     * @param {Float} DPIX 
     * @param {Float} DPIY 
     * @param {Integer} nonTextRenderingMode 
     * @param {Integer} textRenderingMode 
     * @param {Integer} pixelFormat 
     * @param {Integer} backgroundColor 
     * @returns {IXpsRasterizer} 
     */
    CreateRasterizer(xpsPage, DPIX, DPIY, nonTextRenderingMode, textRenderingMode, pixelFormat, backgroundColor) {
        result := ComCall(3, this, "ptr", xpsPage, "float", DPIX, "float", DPIY, "int", nonTextRenderingMode, "int", textRenderingMode, "int", pixelFormat, "int", backgroundColor, "ptr*", &ppIXpsRasterizer := 0, "HRESULT")
        return IXpsRasterizer(ppIXpsRasterizer)
    }
}
