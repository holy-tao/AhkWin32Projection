#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * An IInkPresenterDesktop object represents an InkPresenter that can be configured and inserted into the DirectComposition visual tree of the Classic Windows app.
 * @see https://docs.microsoft.com/windows/win32/api//inkpresenterdesktop/nn-inkpresenterdesktop-iinkpresenterdesktop
 * @namespace Windows.Win32.UI.Input.Ink
 * @version v4.0.30319
 */
class IInkPresenterDesktop extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkPresenterDesktop
     * @type {Guid}
     */
    static IID => Guid("{73f3c0d9-2e8b-48f3-895e-20cbd27b723b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetRootVisual", "SetCommitRequestHandler", "GetSize", "SetSize", "OnHighContrastChanged"]

    /**
     * 
     * @param {IUnknown} rootVisual 
     * @param {IUnknown} device 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inkpresenterdesktop/nf-inkpresenterdesktop-iinkpresenterdesktop-setrootvisual
     */
    SetRootVisual(rootVisual, device) {
        result := ComCall(3, this, "ptr", rootVisual, "ptr", device, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkCommitRequestHandler} handler 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inkpresenterdesktop/nf-inkpresenterdesktop-iinkpresenterdesktop-setcommitrequesthandler
     */
    SetCommitRequestHandler(handler) {
        result := ComCall(4, this, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} width 
     * @param {Pointer<Float>} height 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inkpresenterdesktop/nf-inkpresenterdesktop-iinkpresenterdesktop-getsize
     */
    GetSize(width, height) {
        result := ComCall(5, this, "float*", width, "float*", height, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} width 
     * @param {Float} height 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inkpresenterdesktop/nf-inkpresenterdesktop-iinkpresenterdesktop-setsize
     */
    SetSize(width, height) {
        result := ComCall(6, this, "float", width, "float", height, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inkpresenterdesktop/nf-inkpresenterdesktop-iinkpresenterdesktop-onhighcontrastchanged
     */
    OnHighContrastChanged() {
        result := ComCall(7, this, "HRESULT")
        return result
    }
}
