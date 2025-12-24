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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddBackLink", "RemoveBackLink"]

    /**
     * IMILBitmapEffectOutputConnectorImpl::AddBackLink method
     * @param {IMILBitmapEffectInputConnector} pConnection Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectinputconnector">IMILBitmapEffectInputConnector</a>*</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectoutputconnectorimpl-addbacklink
     */
    AddBackLink(pConnection) {
        result := ComCall(3, this, "ptr", pConnection, "HRESULT")
        return result
    }

    /**
     * IMILBitmapEffectOutputConnectorImpl::RemoveBackLink method
     * @param {IMILBitmapEffectInputConnector} pConnection Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectinputconnector">IMILBitmapEffectInputConnector</a>*</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectoutputconnectorimpl-removebacklink
     */
    RemoveBackLink(pConnection) {
        result := ComCall(4, this, "ptr", pConnection, "HRESULT")
        return result
    }
}
