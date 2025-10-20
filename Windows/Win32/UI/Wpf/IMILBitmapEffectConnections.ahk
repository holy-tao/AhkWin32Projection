#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Integer} uiIndex 
     * @param {Pointer<IMILBitmapEffectInputConnector>} ppConnector 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectconnections-getinputconnector
     */
    GetInputConnector(uiIndex, ppConnector) {
        result := ComCall(3, this, "uint", uiIndex, "ptr*", ppConnector, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uiIndex 
     * @param {Pointer<IMILBitmapEffectOutputConnector>} ppConnector 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectconnections-getoutputconnector
     */
    GetOutputConnector(uiIndex, ppConnector) {
        result := ComCall(4, this, "uint", uiIndex, "ptr*", ppConnector, "HRESULT")
        return result
    }
}
