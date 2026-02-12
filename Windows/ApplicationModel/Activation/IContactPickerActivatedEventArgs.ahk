#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\Contacts\Provider\ContactPickerUI.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides data when an app is activated because it uses the Contact Picker.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.icontactpickeractivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IContactPickerActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactPickerActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{ce57aae7-6449-45a7-971f-d113be7a8936}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ContactPickerUI"]

    /**
     * The letterbox UI of the contact picker that is displayed when the user wants to pick files or folders that are provided by the app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.icontactpickeractivatedeventargs.contactpickerui
     * @type {ContactPickerUI} 
     */
    ContactPickerUI {
        get => this.get_ContactPickerUI()
    }

    /**
     * 
     * @returns {ContactPickerUI} 
     */
    get_ContactPickerUI() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContactPickerUI(value)
    }
}
