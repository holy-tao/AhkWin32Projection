#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Storage\Streams\IRandomAccessStreamReference.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\Appointments\AppointmentCalendar.ahk
#Include ..\Email\EmailMailbox.ahk
#Include ..\Contacts\ContactList.ahk
#Include ..\Contacts\ContactAnnotationList.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.UserDataAccounts
 * @version WindowsRuntime 1.4
 */
class IUserDataAccount extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserDataAccount
     * @type {Guid}
     */
    static IID => Guid("{b9c4367e-b348-4910-be94-4ad4bba6dea7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_UserDisplayName", "put_UserDisplayName", "get_OtherAppReadAccess", "put_OtherAppReadAccess", "get_Icon", "get_DeviceAccountTypeId", "get_PackageFamilyName", "SaveAsync", "DeleteAsync", "FindAppointmentCalendarsAsync", "FindEmailMailboxesAsync", "FindContactListsAsync", "FindContactAnnotationListsAsync"]

    /**
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {HSTRING} 
     */
    UserDisplayName {
        get => this.get_UserDisplayName()
        set => this.put_UserDisplayName(value)
    }

    /**
     * @type {Integer} 
     */
    OtherAppReadAccess {
        get => this.get_OtherAppReadAccess()
        set => this.put_OtherAppReadAccess(value)
    }

    /**
     * @type {IRandomAccessStreamReference} 
     */
    Icon {
        get => this.get_Icon()
    }

    /**
     * @type {HSTRING} 
     */
    DeviceAccountTypeId {
        get => this.get_DeviceAccountTypeId()
    }

    /**
     * @type {HSTRING} 
     */
    PackageFamilyName {
        get => this.get_PackageFamilyName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
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
    get_UserDisplayName() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_UserDisplayName(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OtherAppReadAccess() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_OtherAppReadAccess(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_Icon() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRandomAccessStreamReference(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceAccountTypeId() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PackageFamilyName() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    SaveAsync() {
        result := ComCall(14, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    DeleteAsync() {
        result := ComCall(15, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<AppointmentCalendar>>} 
     */
    FindAppointmentCalendarsAsync() {
        result := ComCall(16, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, AppointmentCalendar), result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<EmailMailbox>>} 
     */
    FindEmailMailboxesAsync() {
        result := ComCall(17, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, EmailMailbox), result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<ContactList>>} 
     */
    FindContactListsAsync() {
        result := ComCall(18, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, ContactList), result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<ContactAnnotationList>>} 
     */
    FindContactAnnotationListsAsync() {
        result := ComCall(19, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, ContactAnnotationList), result_)
    }
}
