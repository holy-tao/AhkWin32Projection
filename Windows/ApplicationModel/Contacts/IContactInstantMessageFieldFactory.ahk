#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ContactInstantMessageField.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Creates fields with information about a contact's instant messaging accounts.
  * 
  * > [!NOTE]
  * > IContactInstantMessageFieldFactory may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactConnectedServiceAccount](contactconnectedserviceaccount.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.icontactinstantmessagefieldfactory
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class IContactInstantMessageFieldFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactInstantMessageFieldFactory
     * @type {Guid}
     */
    static IID => Guid("{ba0b6794-91a3-4bb2-b1b9-69a5dff0ba09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstantMessage_Default", "CreateInstantMessage_Category", "CreateInstantMessage_All"]

    /**
     * Creates a field containing information about a contact's instant messaging account.
     * 
     * > [!NOTE]
     * > [IContactInstantMessageFieldFactory](icontactinstantmessagefieldfactory.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactConnectedServiceAccount](contactconnectedserviceaccount.md).
     * @param {HSTRING} userName The user name for the instant messaging account.
     * @returns {ContactInstantMessageField} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.icontactinstantmessagefieldfactory.createinstantmessage
     */
    CreateInstantMessage_Default(userName) {
        if(userName is String) {
            pin := HSTRING.Create(userName)
            userName := pin.Value
        }
        userName := userName is Win32Handle ? NumGet(userName, "ptr") : userName

        result := ComCall(6, this, "ptr", userName, "ptr*", &field := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContactInstantMessageField(field)
    }

    /**
     * Creates a field containing information about a contact's instant messaging account.
     * 
     * > [!NOTE]
     * > [IContactInstantMessageFieldFactory](icontactinstantmessagefieldfactory.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactConnectedServiceAccount](contactconnectedserviceaccount.md).
     * @param {HSTRING} userName The user name of the instant messaging account.
     * @param {Integer} category 
     * @returns {ContactInstantMessageField} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.icontactinstantmessagefieldfactory.createinstantmessage
     */
    CreateInstantMessage_Category(userName, category) {
        if(userName is String) {
            pin := HSTRING.Create(userName)
            userName := pin.Value
        }
        userName := userName is Win32Handle ? NumGet(userName, "ptr") : userName

        result := ComCall(7, this, "ptr", userName, "int", category, "ptr*", &field := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContactInstantMessageField(field)
    }

    /**
     * Creates a field containing information about a contact's instant messaging account.
     * 
     * > [!NOTE]
     * > [IContactInstantMessageFieldFactory](icontactinstantmessagefieldfactory.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactConnectedServiceAccount](contactconnectedserviceaccount.md).
     * @param {HSTRING} userName The user name of the instant messaging account.
     * @param {Integer} category 
     * @param {HSTRING} service 
     * @param {HSTRING} displayText 
     * @param {Uri} verb 
     * @returns {ContactInstantMessageField} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.icontactinstantmessagefieldfactory.createinstantmessage
     */
    CreateInstantMessage_All(userName, category, service, displayText, verb) {
        if(userName is String) {
            pin := HSTRING.Create(userName)
            userName := pin.Value
        }
        userName := userName is Win32Handle ? NumGet(userName, "ptr") : userName
        if(service is String) {
            pin := HSTRING.Create(service)
            service := pin.Value
        }
        service := service is Win32Handle ? NumGet(service, "ptr") : service
        if(displayText is String) {
            pin := HSTRING.Create(displayText)
            displayText := pin.Value
        }
        displayText := displayText is Win32Handle ? NumGet(displayText, "ptr") : displayText

        result := ComCall(8, this, "ptr", userName, "int", category, "ptr", service, "ptr", displayText, "ptr", verb, "ptr*", &field := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContactInstantMessageField(field)
    }
}
