#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IXpsRasterizationFactory extends IUnknown{

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
     * @param {Integer} nonTextRenderingMode 
     * @param {Integer} textRenderingMode 
     * @param {Pointer<IXpsRasterizer>} ppIXPSRasterizer 
     * @returns {HRESULT} 
     */
    CreateRasterizer(xpsPage, DPI, nonTextRenderingMode, textRenderingMode, ppIXPSRasterizer) {
        result := ComCall(3, this, "ptr", xpsPage, "float", DPI, "int", nonTextRenderingMode, "int", textRenderingMode, "ptr*", ppIXPSRasterizer, "HRESULT")
        return result
    }
}
