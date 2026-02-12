#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Contacts\Contact.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides data when an app is activated to send a message a contact.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.icontactmessageactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IContactMessageActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactMessageActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{de598db2-0e03-43b0-bf56-bcc40b3162df}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ServiceId", "get_ServiceUserId", "get_Contact"]

    /**
     * Gets the identifier of the service used for the message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.icontactmessageactivatedeventargs.serviceid
     * @type {HSTRING} 
     */
    ServiceId {
        get => this.get_ServiceId()
    }

    /**
     * Gets the user identifier of the service used for the message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.icontactmessageactivatedeventargs.serviceuserid
     * @type {HSTRING} 
     */
    ServiceUserId {
        get => this.get_ServiceUserId()
    }

    /**
     * Gets the contact for the message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.icontactmessageactivatedeventargs.contact
     * @type {Contact} 
     */
    Contact {
        get => this.get_Contact()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ServiceId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ServiceUserId() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Contact} 
     */
    get_Contact() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Contact(value)
    }
}
