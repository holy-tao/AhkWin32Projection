#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\Contacts\ContactPanel.ahk
#Include ..\Contacts\Contact.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides data when an app is activated by the contact panel.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.icontactpanelactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IContactPanelActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactPanelActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{52bb63e4-d3d4-4b63-8051-4af2082cab80}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ContactPanel", "get_Contact"]

    /**
     * Gets the contact panel.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.icontactpanelactivatedeventargs.contactpanel
     * @type {ContactPanel} 
     */
    ContactPanel {
        get => this.get_ContactPanel()
    }

    /**
     * Gets the contact.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.icontactpanelactivatedeventargs.contact
     * @type {Contact} 
     */
    Contact {
        get => this.get_Contact()
    }

    /**
     * 
     * @returns {ContactPanel} 
     */
    get_ContactPanel() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContactPanel(value)
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
