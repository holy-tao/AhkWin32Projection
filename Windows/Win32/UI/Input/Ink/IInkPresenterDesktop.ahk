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
     * 
     * @param {Pointer<IUnknown>} rootVisual 
     * @param {Pointer<IUnknown>} device 
     * @returns {HRESULT} 
     */
    SetRootVisual(rootVisual, device) {
        result := ComCall(3, this, "ptr", rootVisual, "ptr", device, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkCommitRequestHandler>} handler 
     * @returns {HRESULT} 
     */
    SetCommitRequestHandler(handler) {
        result := ComCall(4, this, "ptr", handler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} width 
     * @param {Pointer<Single>} height 
     * @returns {HRESULT} 
     */
    GetSize(width, height) {
        result := ComCall(5, this, "float*", width, "float*", height, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} width 
     * @param {Float} height 
     * @returns {HRESULT} 
     */
    SetSize(width, height) {
        result := ComCall(6, this, "float", width, "float", height, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnHighContrastChanged() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
