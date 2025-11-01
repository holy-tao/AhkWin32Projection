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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNumberConnections", "GetConnection"]

    /**
     * 
     * @param {Pointer<Integer>} puiNumberConnections 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectoutputconnector-getnumberconnections
     */
    GetNumberConnections(puiNumberConnections) {
        puiNumberConnectionsMarshal := puiNumberConnections is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, puiNumberConnectionsMarshal, puiNumberConnections, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uiIndex 
     * @param {Pointer<IMILBitmapEffectInputConnector>} ppConnection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectoutputconnector-getconnection
     */
    GetConnection(uiIndex, ppConnection) {
        result := ComCall(10, this, "uint", uiIndex, "ptr*", ppConnection, "HRESULT")
        return result
    }
}
