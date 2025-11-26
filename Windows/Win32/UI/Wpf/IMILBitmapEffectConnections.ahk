#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMILBitmapEffectInputConnector.ahk
#Include .\IMILBitmapEffectOutputConnector.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods used to retrieve input and output connectors exposed by the bitmap effect.
 * @see https://docs.microsoft.com/windows/win32/api//mileffects/nn-mileffects-imilbitmapeffectconnections
 * @namespace Windows.Win32.UI.Wpf
 * @version v4.0.30319
 */
class IMILBitmapEffectConnections extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMILBitmapEffectConnections
     * @type {Guid}
     */
    static IID => Guid("{c2b5d861-9b1a-4374-89b0-dec4874d6a81}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInputConnector", "GetOutputConnector"]

    /**
     * Retrieves the input connector associated with the given pin index.
     * @param {Integer} uiIndex Type: <b>ULONG</b>
     * 
     * A zero based index value indicating which input pin to use to retrieve the input connector.
     * @returns {IMILBitmapEffectInputConnector} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectinputconnector">IMILBitmapEffectInputConnector</a>**</b>
     * 
     * When this method returns, contains the input connector for the given input pin.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectconnections-getinputconnector
     */
    GetInputConnector(uiIndex) {
        result := ComCall(3, this, "uint", uiIndex, "ptr*", &ppConnector := 0, "HRESULT")
        return IMILBitmapEffectInputConnector(ppConnector)
    }

    /**
     * Retrieves the output connector associated with the given pin index.
     * @param {Integer} uiIndex Type: <b>ULONG</b>
     * 
     * A zero based index value indicating which output pin to use to retrieve the output connector.
     * @returns {IMILBitmapEffectOutputConnector} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectoutputconnector">IMILBitmapEffectOutputConnector</a>**</b>
     * 
     * When this method returns, contains the output connector for the given output pin.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectconnections-getoutputconnector
     */
    GetOutputConnector(uiIndex) {
        result := ComCall(4, this, "uint", uiIndex, "ptr*", &ppConnector := 0, "HRESULT")
        return IMILBitmapEffectOutputConnector(ppConnector)
    }
}
