#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ToastNotification.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class IToastNotificationFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IToastNotificationFactory
     * @type {Guid}
     */
    static IID => Guid("{04124b20-82c6-4229-b109-fd9ed4662b53}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateToastNotification"]

    /**
     * 
     * @param {XmlDocument} content 
     * @returns {ToastNotification} 
     */
    CreateToastNotification(content) {
        result := ComCall(6, this, "ptr", content, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ToastNotification(value)
    }
}
