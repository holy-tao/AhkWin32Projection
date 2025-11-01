#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables Windows Store apps to opt out of the automatic invocation behavior.
 * @remarks
 * 
  * Clients can request that the touch keyboard and handwriting input panel check to see that a user tapped in the edit control with focus before invoking.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//inputpanelconfiguration/nn-inputpanelconfiguration-iinputpanelinvocationconfiguration
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IInputPanelInvocationConfiguration extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInputPanelInvocationConfiguration
     * @type {Guid}
     */
    static IID => Guid("{a213f136-3b45-4362-a332-efb6547cd432}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequireTouchInEditControl"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inputpanelconfiguration/nf-inputpanelconfiguration-iinputpanelinvocationconfiguration-requiretouchineditcontrol
     */
    RequireTouchInEditControl() {
        result := ComCall(3, this, "HRESULT")
        return result
    }
}
