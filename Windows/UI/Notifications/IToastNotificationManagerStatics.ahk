#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ToastNotifier.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Data\Xml\Dom\XmlDocument.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Creates and initializes a toast notifier for the secondary tile.
  * 
  * > [!IMPORTANT]
  * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this APIs will fail at runtime.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.phone.startscreen.itoastnotificationmanagerstatics3.createtoastnotifierforsecondarytile
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class IToastNotificationManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IToastNotificationManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{50ac103f-d235-4598-bbef-98fe4d1a3ad4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateToastNotifier", "CreateToastNotifierWithId", "GetTemplateContent"]

    /**
     * 
     * @returns {ToastNotifier} 
     */
    CreateToastNotifier() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ToastNotifier(result_)
    }

    /**
     * 
     * @param {HSTRING} applicationId 
     * @returns {ToastNotifier} 
     */
    CreateToastNotifierWithId(applicationId) {
        if(applicationId is String) {
            pin := HSTRING.Create(applicationId)
            applicationId := pin.Value
        }
        applicationId := applicationId is Win32Handle ? NumGet(applicationId, "ptr") : applicationId

        result := ComCall(7, this, "ptr", applicationId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ToastNotifier(result_)
    }

    /**
     * 
     * @param {Integer} type 
     * @returns {XmlDocument} 
     */
    GetTemplateContent(type) {
        result := ComCall(8, this, "int", type, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XmlDocument(result_)
    }
}
