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
     * Sets the connection to the app's DirectComposition visual tree.
     * @param {IUnknown} rootVisual The app's  <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-portal">DirectComposition</a> visual tree.
     * @param {IUnknown} device NULL for default ink rendering, or an <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiondevice3">IDCompositionDevice3</a> object used to commit all pending DirectComposition commands for custom drying of ink input to the app's  <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-portal">DirectComposition</a> visual tree.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//inkpresenterdesktop/nf-inkpresenterdesktop-iinkpresenterdesktop-setrootvisual
     */
    SetRootVisual(rootVisual, device) {
        result := ComCall(3, this, "ptr", rootVisual, "ptr", device, "HRESULT")
        return result
    }

    /**
     * Sets an IInkCommitRequestHandler object that enables the app (instead of an IInkPresenterDesktop object) to commit all pending Microsoft DirectComposition commands to the app's DirectComposition visual tree.
     * @param {IInkCommitRequestHandler} handler The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/inkpresenterdesktop/nn-inkpresenterdesktop-iinkcommitrequesthandler">IInkCommitRequestHandler</a> that processes the ink input.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//inkpresenterdesktop/nf-inkpresenterdesktop-iinkpresenterdesktop-setcommitrequesthandler
     */
    SetCommitRequestHandler(handler) {
        result := ComCall(4, this, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * Gets the size of the InkPresenter object.
     * @param {Pointer<Float>} width The width of the object, in DIPs.
     * @param {Pointer<Float>} height The height of the object, in DIPs.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//inkpresenterdesktop/nf-inkpresenterdesktop-iinkpresenterdesktop-getsize
     */
    GetSize(width, height) {
        widthMarshal := width is VarRef ? "float*" : "ptr"
        heightMarshal := height is VarRef ? "float*" : "ptr"

        result := ComCall(5, this, widthMarshal, width, heightMarshal, height, "HRESULT")
        return result
    }

    /**
     * Sets the size of the InkPresenter object.
     * @param {Float} width The width of the object, in DIPs.
     * @param {Float} height The height of the object, in DIPs.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//inkpresenterdesktop/nf-inkpresenterdesktop-iinkpresenterdesktop-setsize
     */
    SetSize(width, height) {
        result := ComCall(6, this, "float", width, "float", height, "HRESULT")
        return result
    }

    /**
     * Specifies a high contrast change handler. This handler is notified of changes to the high contrast system settings.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//inkpresenterdesktop/nf-inkpresenterdesktop-iinkpresenterdesktop-onhighcontrastchanged
     */
    OnHighContrastChanged() {
        result := ComCall(7, this, "HRESULT")
        return result
    }
}
