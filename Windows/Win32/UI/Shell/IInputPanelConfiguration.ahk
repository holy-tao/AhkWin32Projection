#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides functionality for desktop apps to opt in to the focus tracking mechanism used in Windows Store apps.
 * @remarks
 * 
 * <div class="alert"><b>Warning</b>  <p class="note"><b>IInputPanelConfiguration</b> will not work in Windows 10. 
 * 
 * </div>
 * <div> </div>
 * Implement the <b>IInputPanelConfiguration</b> interface if your Desktop client processes need to leverage the invoking and dismissing semantics of the touch keyboard and handwriting input panel. 
 * 
 * The <b>IInputPanelConfiguration</b> interface enables your app to opt in to the focus tracking mechanism for Windows Store apps.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//inputpanelconfiguration/nn-inputpanelconfiguration-iinputpanelconfiguration
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IInputPanelConfiguration extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInputPanelConfiguration
     * @type {Guid}
     */
    static IID => Guid("{41c81592-514c-48bd-a22e-e6af638521a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnableFocusTracking"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inputpanelconfiguration/nf-inputpanelconfiguration-iinputpanelconfiguration-enablefocustracking
     */
    EnableFocusTracking() {
        result := ComCall(3, this, "HRESULT")
        return result
    }
}
