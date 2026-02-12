#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Contacts.Provider
 * @version WindowsRuntime 1.4
 */
class IContactPickerUI extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactPickerUI
     * @type {Guid}
     */
    static IID => Guid("{e2cc1366-cf66-43c4-a96a-a5a112db4746}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddContact", "RemoveContact", "ContainsContact", "get_DesiredFields", "get_SelectionMode", "add_ContactRemoved", "remove_ContactRemoved"]

    /**
     * @type {IVectorView<HSTRING>} 
     */
    DesiredFields {
        get => this.get_DesiredFields()
    }

    /**
     * @type {Integer} 
     */
    SelectionMode {
        get => this.get_SelectionMode()
    }

    /**
     * 
     * @param {HSTRING} id 
     * @param {Contact} contact_ 
     * @returns {Integer} 
     */
    AddContact(id, contact_) {
        if(id is String) {
            pin := HSTRING.Create(id)
            id := pin.Value
        }
        id := id is Win32Handle ? NumGet(id, "ptr") : id

        result := ComCall(6, this, "ptr", id, "ptr", contact_, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} id 
     * @returns {HRESULT} 
     */
    RemoveContact(id) {
        if(id is String) {
            pin := HSTRING.Create(id)
            id := pin.Value
        }
        id := id is Win32Handle ? NumGet(id, "ptr") : id

        result := ComCall(7, this, "ptr", id, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} id 
     * @returns {Boolean} 
     */
    ContainsContact(id) {
        if(id is String) {
            pin := HSTRING.Create(id)
            id := pin.Value
        }
        id := id is Win32Handle ? NumGet(id, "ptr") : id

        result := ComCall(8, this, "ptr", id, "int*", &isContained := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return isContained
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_DesiredFields() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectionMode() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<ContactPickerUI, ContactRemovedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ContactRemoved(handler) {
        token := EventRegistrationToken()
        result := ComCall(11, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ContactRemoved(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(12, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
