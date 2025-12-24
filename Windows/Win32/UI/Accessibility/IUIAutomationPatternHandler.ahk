#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Returns a client API wrapper object and to unmarshal property and method requests to an actual provider instance.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-iuiautomationpatternhandler
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationPatternHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationPatternHandler
     * @type {Guid}
     */
    static IID => Guid("{d97022f3-a947-465e-8b2a-ac4315fa54e8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateClientWrapper", "Dispatch"]

    /**
     * Creates an object that enables a client application to interact with a custom control pattern.
     * @param {IUIAutomationPatternInstance} pPatternInstance Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-iuiautomationpatterninstance">IUIAutomationPatternInstance</a>*</b>
     * 
     * A pointer to the instance of the control pattern that will be used by the wrapper.
     * @returns {IUnknown} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>**</b>
     * 
     * Receives a pointer to the wrapper object.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-iuiautomationpatternhandler-createclientwrapper
     */
    CreateClientWrapper(pPatternInstance) {
        result := ComCall(3, this, "ptr", pPatternInstance, "ptr*", &pClientWrapper := 0, "HRESULT")
        return IUnknown(pClientWrapper)
    }

    /**
     * Dispatches a method or property getter to a custom control pattern provider.
     * @param {IUnknown} pTarget Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the object that implements the control pattern provider.
     * @param {Integer} index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The index of the method or property getter.
     * @param {Pointer<UIAutomationParameter>} pParams Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ns-uiautomationcore-uiautomationparameter">UIAutomationParameter</a>*</b>
     * 
     * A pointer to an array of structures that contain information about the parameters to be passed.
     * @param {Integer} cParams Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The count of parameters in <i>pParams</i>.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-iuiautomationpatternhandler-dispatch
     */
    Dispatch(pTarget, index, pParams, cParams) {
        result := ComCall(4, this, "ptr", pTarget, "uint", index, "ptr", pParams, "uint", cParams, "HRESULT")
        return result
    }
}
