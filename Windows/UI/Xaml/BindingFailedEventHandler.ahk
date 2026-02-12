#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents the method that will handle the [DebugSettings.BindingFailed](debugsettings_bindingfailed.md) event.
 * @remarks
 * [IsBindingTracingEnabled](debugsettings_isbindingtracingenabled.md) must be **true** and there must be a debugger attached to the app process in order for [BindingFailed](debugsettings_bindingfailed.md) to occur and for tracing to appear in debugger output. You don't need to handle the event in order to see tracing appear in a debugger. The debugger output contains message information that goes to the **Output** window of the debugger. Attaching a [BindingFailed](debugsettings_bindingfailed.md) handler yourself is an advanced scenario for when you want to see the raw message.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.bindingfailedeventhandler
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class BindingFailedEventHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for BindingFailedEventHandler
     * @type {Guid}
     */
    static IID => Guid("{136b1782-54ba-420d-a1aa-82828721cde6}")

    /**
     * The class identifier for BindingFailedEventHandler
     * @type {Guid}
     */
    static CLSID => Guid("{136b1782-54ba-420d-a1aa-82828721cde6}")

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
     * @param {BindingFailedEventArgs} e 
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
