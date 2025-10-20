#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that retrieves information about what input and output pins are exposed by the bitmap effect.
 * @remarks
 * 
  * If this interface is not implemented when creating a custom bitmap effect, a single input and output pin implementation with a 32bit RGBA format is assumes.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mileffects/nn-mileffects-imilbitmapeffectconnectionsinfo
 * @namespace Windows.Win32.UI.Wpf
 * @version v4.0.30319
 */
class IMILBitmapEffectConnectionsInfo extends IUnknown{
    /**
     * The interface identifier for IMILBitmapEffectConnectionsInfo
     * @type {Guid}
     */
    static IID => Guid("{476b538a-c765-4237-ba4a-d6a880ff0cfc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} puiNumInputs 
     * @returns {HRESULT} 
     */
    GetNumberInputs(puiNumInputs) {
        result := ComCall(3, this, "uint*", puiNumInputs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} puiNumOutputs 
     * @returns {HRESULT} 
     */
    GetNumberOutputs(puiNumOutputs) {
        result := ComCall(4, this, "uint*", puiNumOutputs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uiIndex 
     * @param {Pointer<IMILBitmapEffectConnectorInfo>} ppConnectorInfo 
     * @returns {HRESULT} 
     */
    GetInputConnectorInfo(uiIndex, ppConnectorInfo) {
        result := ComCall(5, this, "uint", uiIndex, "ptr", ppConnectorInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uiIndex 
     * @param {Pointer<IMILBitmapEffectConnectorInfo>} ppConnectorInfo 
     * @returns {HRESULT} 
     */
    GetOutputConnectorInfo(uiIndex, ppConnectorInfo) {
        result := ComCall(6, this, "uint", uiIndex, "ptr", ppConnectorInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
