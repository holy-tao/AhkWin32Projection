#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/inkrenderer/nn-inkrenderer-iinkd2drenderer2
 * @namespace Windows.Win32.UI.Input.Ink
 * @version v4.0.30319
 */
class IInkD2DRenderer2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkD2DRenderer2
     * @type {Guid}
     */
    static IID => Guid("{0a95dcd9-4578-4b71-b20b-bf664d4bfeee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Draw"]

    /**
     * 
     * @param {IUnknown} pD2D1DeviceContext 
     * @param {IUnknown} pInkStrokeIterable 
     * @param {Integer} highContrastAdjustment 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inkrenderer/nf-inkrenderer-iinkd2drenderer2-draw
     */
    Draw(pD2D1DeviceContext, pInkStrokeIterable, highContrastAdjustment) {
        result := ComCall(3, this, "ptr", pD2D1DeviceContext, "ptr", pInkStrokeIterable, "int", highContrastAdjustment, "HRESULT")
        return result
    }
}
