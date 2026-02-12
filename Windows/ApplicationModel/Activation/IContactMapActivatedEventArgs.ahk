#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\Contacts\ContactAddress.ahk
#Include ..\Contacts\Contact.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides data when an app is activated to map a contact.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.icontactmapactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IContactMapActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactMapActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{b32bf870-eee7-4ad2-aaf1-a87effcf00a4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Address", "get_Contact"]

    /**
     * Gets the address of a contact for the mapping operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.icontactmapactivatedeventargs.address
     * @type {ContactAddress} 
     */
    Address {
        get => this.get_Address()
    }

    /**
     * Gets the contact for the mapping operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.icontactmapactivatedeventargs.contact
     * @type {Contact} 
     */
    Contact {
        get => this.get_Contact()
    }

    /**
     * 
     * @returns {ContactAddress} 
     */
    get_Address() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContactAddress(value)
    }

    /**
     * 
     * @returns {Contact} 
     */
    get_Contact() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Contact(value)
    }
}
