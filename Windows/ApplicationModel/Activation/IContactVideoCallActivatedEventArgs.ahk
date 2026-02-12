#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Contacts\Contact.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides data when an app is activated to video call a contact.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.icontactvideocallactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IContactVideoCallActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactVideoCallActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{61079db8-e3e7-4b4f-858d-5c63a96ef684}")

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
     * Gets the identifier of the service used for the video call.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.icontactvideocallactivatedeventargs.serviceid
     * @type {HSTRING} 
     */
    ServiceId {
        get => this.get_ServiceId()
    }

    /**
     * Gets the user identifier of the service used for the video call.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.icontactvideocallactivatedeventargs.serviceuserid
     * @type {HSTRING} 
     */
    ServiceUserId {
        get => this.get_ServiceUserId()
    }

    /**
     * Gets the contact for the video call.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.icontactvideocallactivatedeventargs.contact
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
