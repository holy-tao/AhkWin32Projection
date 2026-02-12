#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class IAutomationPeer7 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAutomationPeer7
     * @type {Guid}
     */
    static IID => Guid("{796b3287-e642-48ab-b223-5208b41da9d6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RaiseNotificationEvent"]

    /**
     * 
     * @param {Integer} notificationKind_ 
     * @param {Integer} notificationProcessing_ 
     * @param {HSTRING} displayString 
     * @param {HSTRING} activityId 
     * @returns {HRESULT} 
     */
    RaiseNotificationEvent(notificationKind_, notificationProcessing_, displayString, activityId) {
        if(displayString is String) {
            pin := HSTRING.Create(displayString)
            displayString := pin.Value
        }
        displayString := displayString is Win32Handle ? NumGet(displayString, "ptr") : displayString
        if(activityId is String) {
            pin := HSTRING.Create(activityId)
            activityId := pin.Value
        }
        activityId := activityId is Win32Handle ? NumGet(activityId, "ptr") : activityId

        result := ComCall(6, this, "int", notificationKind_, "int", notificationProcessing_, "ptr", displayString, "ptr", activityId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
