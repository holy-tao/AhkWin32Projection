#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMILBitmapEffectInputConnector.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that define an interior input connector.
 * @see https://docs.microsoft.com/windows/win32/api//mileffects/nn-mileffects-imilbitmapeffectinteriorinputconnector
 * @namespace Windows.Win32.UI.Wpf
 * @version v4.0.30319
 */
class IMILBitmapEffectInteriorInputConnector extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInputConnector"]

    /**
     * 
     * @returns {IMILBitmapEffectInputConnector} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectinteriorinputconnector-getinputconnector
     */
    GetInputConnector() {
        result := ComCall(3, this, "ptr*", &pInputConnector := 0, "HRESULT")
        return IMILBitmapEffectInputConnector(pInputConnector)
    }
}
