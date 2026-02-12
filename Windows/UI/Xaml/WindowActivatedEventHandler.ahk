#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents the method that will handle the [Activated](window_activated.md) event.
 * @remarks
 * This event occurs when a [Window](window.md) has been activated or deactivated by the system. An app can determine what the status of the [Window](window.md) activation is by checking the [WindowActivatedEventArgs.WindowActivationState](../windows.ui.core/windowactivatedeventargs_windowactivationstate.md) property. A [Window](window.md) could be visible on screen but not be active. Additionally, if any other parts of the system takes focus away from the window, this event will occur. This could happen as a result of user interaction or code, and the [WindowActivationState](../windows.ui.core/windowactivatedeventargs_windowactivationstate.md) will indicate which action has taken place.
 * 
 * App activation as opposed to [Window](window.md) activation has its own **Activated** event. For more info, see [OnActivated](application_onactivated_603737819.md) or [Handle app activation](/windows/uwp/launch-resume/activate-an-app).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.windowactivatedeventhandler
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class WindowActivatedEventHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for WindowActivatedEventHandler
     * @type {Guid}
     */
    static IID => Guid("{18026348-8619-4c7b-b534-ced45d9de219}")

    /**
     * The class identifier for WindowActivatedEventHandler
     * @type {Guid}
     */
    static CLSID => Guid("{18026348-8619-4c7b-b534-ced45d9de219}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {IInspectable} sender 
     * @param {WindowActivatedEventArgs} e 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(sender, e) {
        result := ComCall(3, this, "ptr", sender, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
