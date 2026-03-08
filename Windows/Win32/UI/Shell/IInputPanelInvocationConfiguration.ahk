#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables Windows Store apps to opt out of the automatic invocation behavior.
 * @remarks
 * Clients can request that the touch keyboard and handwriting input panel check to see that a user tapped in the edit control with focus before invoking.
 * @see https://learn.microsoft.com/windows/win32/api/inputpanelconfiguration/nn-inputpanelconfiguration-iinputpanelinvocationconfiguration
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
     * Requires an explicit user tap in an edit field before the touch keyboard invokes.
     * @remarks
     * When the <b>RequireTouchInEditControl</b> method is called, all future focus changes require an explicit user tap in an edit field before the touch keyboard invokes. You can call the <b>RequireTouchInEditControl</b> method multiple times, but there's no way to undo the setting. 
     * 
     * This setting applies for any focus event that takes place to a window that is running in the process that called it. The <b>RequireTouchInEditControl</b> method doesn't affect owned windows in another process that have an ownership chain to the current process that called <b>RequireTouchInEditControl</b>. 
     * 
     * The <b>RequireTouchInEditControl</b> method always returns <b>S_OK</b>. If this API is used, then the <b>IsUIBusy</b> property has no effect. The two interaction models are essentially mutually exclusive.
     * 
     * The following code shows how to call the <b>RequireTouchInEditControl</b> method.
     * 
     * 
     * ```cpp
     * @returns {HRESULT} The <b>RequireTouchInEditControl</b> method always returns <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/inputpanelconfiguration/nf-inputpanelconfiguration-iinputpanelinvocationconfiguration-requiretouchineditcontrol
     */
    RequireTouchInEditControl() {
        result := ComCall(3, this, "HRESULT")
        return result
    }
}
