#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMILBitmapEffectOutputConnector.ahk
#Include .\IMILBitmapEffectConnector.ahk

/**
 * Exposes methods that define an input connect.
 * @see https://docs.microsoft.com/windows/win32/api//mileffects/nn-mileffects-imilbitmapeffectinputconnector
 * @namespace Windows.Win32.UI.Wpf
 * @version v4.0.30319
 */
class IMILBitmapEffectInputConnector extends IMILBitmapEffectConnector{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMILBitmapEffectInputConnector
     * @type {Guid}
     */
    static IID => Guid("{a9b4ecaa-7a3c-45e7-8573-f4b81b60dd6c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ConnectTo", "GetConnection"]

    /**
     * Connects the input connector to the given output connector.
     * @param {IMILBitmapEffectOutputConnector} pConnector Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectoutputconnector">IMILBitmapEffectOutputConnector</a>*</b>
     * 
     * A pointer to the connector to connect the input to.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectinputconnector-connectto
     */
    ConnectTo(pConnector) {
        result := ComCall(9, this, "ptr", pConnector, "HRESULT")
        return result
    }

    /**
     * Gets the IMILBitmapEffectOutputConnector the input connector is connected to.
     * @returns {IMILBitmapEffectOutputConnector} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectoutputconnector">IMILBitmapEffectOutputConnector</a>**</b>
     * 
     * A pointer that receives a pointer to the associated output connector.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectinputconnector-getconnection
     */
    GetConnection() {
        result := ComCall(10, this, "ptr*", &ppConnector := 0, "HRESULT")
        return IMILBitmapEffectOutputConnector(ppConnector)
    }
}
