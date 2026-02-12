#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ToastNotificationHistory.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class IToastNotificationManagerStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IToastNotificationManagerStatics2
     * @type {Guid}
     */
    static IID => Guid("{7ab93c52-0e48-4750-ba9d-1a4113981847}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_History"]

    /**
     * @type {ToastNotificationHistory} 
     */
    History {
        get => this.get_History()
    }

    /**
     * 
     * @returns {ToastNotificationHistory} 
     */
    get_History() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ToastNotificationHistory(value)
    }
}
