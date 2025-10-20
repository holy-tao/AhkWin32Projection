#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that define an output connector.
 * @remarks
 * 
  * This interface must be implemented if an effect also implements <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectoutputconnector">IMILBitmapEffectOutputConnector</a>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mileffects/nn-mileffects-imilbitmapeffectoutputconnectorimpl
 * @namespace Windows.Win32.UI.Wpf
 * @version v4.0.30319
 */
class IMILBitmapEffectOutputConnectorImpl extends IUnknown{
    /**
     * The interface identifier for IMILBitmapEffectOutputConnectorImpl
     * @type {Guid}
     */
    static IID => Guid("{21fae777-8b39-4bfa-9f2d-f3941ed36913}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IMILBitmapEffectInputConnector>} pConnection 
     * @returns {HRESULT} 
     */
    AddBackLink(pConnection) {
        result := ComCall(3, this, "ptr", pConnection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMILBitmapEffectInputConnector>} pConnection 
     * @returns {HRESULT} 
     */
    RemoveBackLink(pConnection) {
        result := ComCall(4, this, "ptr", pConnection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
