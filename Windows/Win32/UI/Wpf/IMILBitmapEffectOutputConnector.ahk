#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMILBitmapEffectInputConnector.ahk
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
     * Retrieves the number of connections the output connector has.
     * @returns {Integer} Type: <b>ULONG*</b>
     * 
     * The number of connects the output connector has.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectoutputconnector-getnumberconnections
     */
    GetNumberConnections() {
        result := ComCall(9, this, "uint*", &puiNumberConnections := 0, "HRESULT")
        return puiNumberConnections
    }

    /**
     * Gets the IMILBitmapEffectInputConnector associated with the output connector.
     * @param {Integer} uiIndex Type: <b>ULONG</b>
     * 
     * The index of the desired input connector.
     * @returns {IMILBitmapEffectInputConnector} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectinputconnector">IMILBitmapEffectInputConnector</a>**</b>
     * 
     * A pointer that receives a pointer to the associated input connector.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectoutputconnector-getconnection
     */
    GetConnection(uiIndex) {
        result := ComCall(10, this, "uint", uiIndex, "ptr*", &ppConnection := 0, "HRESULT")
        return IMILBitmapEffectInputConnector(ppConnection)
    }
}
