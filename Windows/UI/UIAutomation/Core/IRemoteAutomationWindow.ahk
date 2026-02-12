#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.UIAutomation.Core
 * @version WindowsRuntime 1.4
 */
class IRemoteAutomationWindow extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteAutomationWindow
     * @type {Guid}
     */
    static IID => Guid("{7c607689-496d-512a-9bd5-c050cfaf1428}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AutomationProvider", "UnregisterAsync"]

    /**
     * @type {IInspectable} 
     */
    AutomationProvider {
        get => this.get_AutomationProvider()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_AutomationProvider() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    UnregisterAsync() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
