#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Storage\Streams\IRandomAccessStreamWithContentType.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\ContactField.ahk
#Include .\ContactLocationField.ahk
#Include .\ContactInstantMessageField.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Gets the display picture of a contact.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.phone.personalinformation.icontactinformation.getdisplaypictureasync
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class IContactInformation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactInformation
     * @type {Guid}
     */
    static IID => Guid("{275eb6d4-6a2e-4278-a914-e460d5f088f6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "GetThumbnailAsync", "get_Emails", "get_PhoneNumbers", "get_Locations", "get_InstantMessages", "get_CustomFields", "QueryCustomFields"]

    /**
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {IVectorView<ContactField>} 
     */
    Emails {
        get => this.get_Emails()
    }

    /**
     * @type {IVectorView<ContactField>} 
     */
    PhoneNumbers {
        get => this.get_PhoneNumbers()
    }

    /**
     * @type {IVectorView<ContactLocationField>} 
     */
    Locations {
        get => this.get_Locations()
    }

    /**
     * @type {IVectorView<ContactInstantMessageField>} 
     */
    InstantMessages {
        get => this.get_InstantMessages()
    }

    /**
     * @type {IVectorView<ContactField>} 
     */
    CustomFields {
        get => this.get_CustomFields()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IAsyncOperation<IRandomAccessStreamWithContentType>} 
     */
    GetThumbnailAsync() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IRandomAccessStreamWithContentType, operation)
    }

    /**
     * 
     * @returns {IVectorView<ContactField>} 
     */
    get_Emails() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(ContactField, value)
    }

    /**
     * 
     * @returns {IVectorView<ContactField>} 
     */
    get_PhoneNumbers() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(ContactField, value)
    }

    /**
     * 
     * @returns {IVectorView<ContactLocationField>} 
     */
    get_Locations() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(ContactLocationField, value)
    }

    /**
     * 
     * @returns {IVectorView<ContactInstantMessageField>} 
     */
    get_InstantMessages() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(ContactInstantMessageField, value)
    }

    /**
     * 
     * @returns {IVectorView<ContactField>} 
     */
    get_CustomFields() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(ContactField, value)
    }

    /**
     * 
     * @param {HSTRING} customName 
     * @returns {IVectorView<ContactField>} 
     */
    QueryCustomFields(customName) {
        if(customName is String) {
            pin := HSTRING.Create(customName)
            customName := pin.Value
        }
        customName := customName is Win32Handle ? NumGet(customName, "ptr") : customName

        result := ComCall(13, this, "ptr", customName, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(ContactField, value)
    }
}
