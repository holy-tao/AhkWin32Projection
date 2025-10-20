#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMILBitmapEffectConnector.ahk

/**
 * Exposes methods that define an output connector.
 * @see https://docs.microsoft.com/windows/win32/api//mileffects/nn-mileffects-imilbitmapeffectoutputconnector
 * @namespace Windows.Win32.UI.Wpf
 * @version v4.0.30319
 */
class IMILBitmapEffectOutputConnector extends IMILBitmapEffectConnector{
    /**
     * The interface identifier for IMILBitmapEffectOutputConnector
     * @type {Guid}
     */
    static IID => Guid("{92957aad-841b-4866-82ec-8752468b07fd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * 
     * @param {Pointer<UInt32>} puiNumberConnections 
     * @returns {HRESULT} 
     */
    GetNumberConnections(puiNumberConnections) {
        result := ComCall(9, this, "uint*", puiNumberConnections, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uiIndex 
     * @param {Pointer<IMILBitmapEffectInputConnector>} ppConnection 
     * @returns {HRESULT} 
     */
    GetConnection(uiIndex, ppConnection) {
        result := ComCall(10, this, "uint", uiIndex, "ptr", ppConnection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
