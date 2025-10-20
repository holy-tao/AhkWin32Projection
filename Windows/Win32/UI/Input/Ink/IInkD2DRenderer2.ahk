#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ink
 * @version v4.0.30319
 */
class IInkD2DRenderer2 extends IUnknown{
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
     * 
     * @param {Pointer<IUnknown>} pD2D1DeviceContext 
     * @param {Pointer<IUnknown>} pInkStrokeIterable 
     * @param {Integer} highContrastAdjustment 
     * @returns {HRESULT} 
     */
    Draw(pD2D1DeviceContext, pInkStrokeIterable, highContrastAdjustment) {
        result := ComCall(3, this, "ptr", pD2D1DeviceContext, "ptr", pInkStrokeIterable, "int", highContrastAdjustment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
