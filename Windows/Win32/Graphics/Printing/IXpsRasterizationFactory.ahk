#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Storage\Xps\IXpsOMPage.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\IXpsRasterizer.ahk
#Include ..\..\Foundation\HRESULT.ahk
#Include .\XPSRAS_RENDERING_MODE.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
class IXpsRasterizationFactory extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsRasterizationFactory
     * @type {Guid}
     */
    static IID => Guid("{e094808a-24c6-482b-a3a7-c21ac9b55f17}")

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
     * @param {Float} DPI 
     * @param {XPSRAS_RENDERING_MODE} nonTextRenderingMode 
     * @param {XPSRAS_RENDERING_MODE} textRenderingMode 
     * @returns {IXpsRasterizer} 
     */
    CreateRasterizer(xpsPage, DPI, nonTextRenderingMode, textRenderingMode) {
        result := ComCall(3, this, "ptr", xpsPage, "float", DPI, "int", nonTextRenderingMode, "int", textRenderingMode, "ptr*", &ppIXPSRasterizer := 0, "HRESULT")
        return IXpsRasterizer(ppIXPSRasterizer)
    }
}
