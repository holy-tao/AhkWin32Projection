#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMILBitmapEffectConnector.ahk

/**
 * Exposes methods that define an input connect.
 * @see https://docs.microsoft.com/windows/win32/api//mileffects/nn-mileffects-imilbitmapeffectinputconnector
 * @namespace Windows.Win32.UI.Wpf
 * @version v4.0.30319
 */
class IMILBitmapEffectInputConnector extends IMILBitmapEffectConnector{
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
     * 
     * @param {Pointer<IMILBitmapEffectOutputConnector>} pConnector 
     * @returns {HRESULT} 
     */
    ConnectTo(pConnector) {
        result := ComCall(9, this, "ptr", pConnector, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMILBitmapEffectOutputConnector>} ppConnector 
     * @returns {HRESULT} 
     */
    GetConnection(ppConnector) {
        result := ComCall(10, this, "ptr", ppConnector, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
