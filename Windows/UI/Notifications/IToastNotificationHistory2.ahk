#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\ToastNotification.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class IToastNotificationHistory2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IToastNotificationHistory2
     * @type {Guid}
     */
    static IID => Guid("{3bc3d253-2f31-4092-9129-8ad5abf067da}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetHistory", "GetHistoryWithId"]

    /**
     * 
     * @returns {IVectorView<ToastNotification>} 
     */
    GetHistory() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(ToastNotification, result_)
    }

    /**
     * 
     * @param {HSTRING} applicationId 
     * @returns {IVectorView<ToastNotification>} 
     */
    GetHistoryWithId(applicationId) {
        if(applicationId is String) {
            pin := HSTRING.Create(applicationId)
            applicationId := pin.Value
        }
        applicationId := applicationId is Win32Handle ? NumGet(applicationId, "ptr") : applicationId

        result := ComCall(7, this, "ptr", applicationId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(ToastNotification, result_)
    }
}
