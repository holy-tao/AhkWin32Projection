#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that define an interior input connector.
 * @see https://docs.microsoft.com/windows/win32/api//mileffects/nn-mileffects-imilbitmapeffectinteriorinputconnector
 * @namespace Windows.Win32.UI.Wpf
 * @version v4.0.30319
 */
class IMILBitmapEffectInteriorInputConnector extends IUnknown{
    /**
     * The interface identifier for IMILBitmapEffectInteriorInputConnector
     * @type {Guid}
     */
    static IID => Guid("{20287e9e-86a2-4e15-953d-eb1438a5b842}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IMILBitmapEffectInputConnector>} pInputConnector 
     * @returns {HRESULT} 
     */
    GetInputConnector(pInputConnector) {
        result := ComCall(3, this, "ptr", pInputConnector, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
