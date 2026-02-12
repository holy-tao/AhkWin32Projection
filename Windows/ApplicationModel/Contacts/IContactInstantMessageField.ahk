#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Uri.ahk
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
class IContactInstantMessageField extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactInstantMessageField
     * @type {Guid}
     */
    static IID => Guid("{cce33b37-0d85-41fa-b43d-da599c3eb009}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UserName", "get_Service", "get_DisplayText", "get_LaunchUri"]

    /**
     * @type {HSTRING} 
     */
    UserName {
        get => this.get_UserName()
    }

    /**
     * @type {HSTRING} 
     */
    Service {
        get => this.get_Service()
    }

    /**
     * @type {HSTRING} 
     */
    DisplayText {
        get => this.get_DisplayText()
    }

    /**
     * @type {Uri} 
     */
    LaunchUri {
        get => this.get_LaunchUri()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UserName() {
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
    get_Service() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayText() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_LaunchUri() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }
}
