#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserDataAccount.ahk
#Include .\IUserDataAccount2.ahk
#Include .\IUserDataAccount3.ahk
#Include .\IUserDataAccount4.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a user data account used to access email, contacts, calendars, and so on.
 * @remarks
 * Call [UserDataAccountStore.GetAccountAsync](userdataaccountstore_getaccountasync_446150997.md) to get an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccount
 * @namespace Windows.ApplicationModel.UserDataAccounts
 * @version WindowsRuntime 1.4
 */
class UserDataAccount extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserDataAccount

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserDataAccount.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a string that uniquely identifies the [UserDataAccount](userdataaccount.md) on the local device.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccount.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets or sets a user name associated with the [UserDataAccount](userdataaccount.md) that is suitable for displaying.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccount.userdisplayname
     * @type {HSTRING} 
     */
    UserDisplayName {
        get => this.get_UserDisplayName()
        set => this.put_UserDisplayName(value)
    }

    /**
     * Gets or sets a value indicating whether other apps on the device have read access to the [UserDataAccount](userdataaccount.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccount.otherappreadaccess
     * @type {Integer} 
     */
    OtherAppReadAccess {
        get => this.get_OtherAppReadAccess()
        set => this.put_OtherAppReadAccess(value)
    }

    /**
     * Gets the icon associated with the [UserDataAccount](userdataaccount.md).
     * @remarks
     * This property is only valid for device user data accounts. It will return **null** for app user data accounts.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccount.icon
     * @type {IRandomAccessStreamReference} 
     */
    Icon {
        get => this.get_Icon()
        set => this.put_Icon(value)
    }

    /**
     * Gets the unique identifier for the type of the account.
     * @remarks
     * Valid values for this property are:
     * 
     * <table>
     *    <tr><th>Account type</th><th>ID</th></tr>
     *    <tr><td>Exchange Active Sync</td><td>6833942B-ABDA-4C20-9757-4F9252396BD4</td></tr>
     *    <tr><td>Google via Exchange Active Sync</td><td>E288529A-1917-4985-897F-34D8121EBFC3</td></tr>
     *    <tr><td>Internet Mail (Pop/IMAP)</td><td>DC23EAD7-BBF2-44D7-A791-6B2B7580F0C2</td></tr>
     *    <tr><td>Google via IMAP/CardDAV/CalDAV</td><td>0A95CDAA-C7EB-4133-9793-75E13089F082</td></tr>
     *    <tr><td>iCloud via IMAP/CardDAV/CalDAV</td><td>45157403-77C9-4E68-9485-6DD9A79D534A</td></tr>
     * </table>
     * 
     * Other values may be added in the future, so you should have a default case to handle unknown values.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccount.deviceaccounttypeid
     * @type {HSTRING} 
     */
    DeviceAccountTypeId {
        get => this.get_DeviceAccountTypeId()
    }

    /**
     * Gets the unique identifier for the app package that created the [UserDataAccount](userdataaccount.md).
     * @remarks
     * This value will be **null** for device user data accounts.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccount.packagefamilyname
     * @type {HSTRING} 
     */
    PackageFamilyName {
        get => this.get_PackageFamilyName()
    }

    /**
     * Gets the enterprise identity associated with the user account.
     * @remarks
     * The EnterpriseId is often a corporate email address and is used when encrypting or decrypting corporate data.
     * 
     * > [!IMPORTANT]
     * > If the EnterpriseId is **null** or empty then the account is not enterprise protected.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccount.enterpriseid
     * @type {HSTRING} 
     */
    EnterpriseId {
        get => this.get_EnterpriseId()
    }

    /**
     * Gets a Boolean value indicating if the user account data is encrypted when the device becomes locked.
     * @remarks
     * Encrypted data will return as empty value sets during a locked state.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccount.isprotectedunderlock
     * @type {Boolean} 
     */
    IsProtectedUnderLock {
        get => this.get_IsProtectedUnderLock()
        set => this.put_IsProtectedUnderLock(value)
    }

    /**
     * Gets a list of package family names for apps that have explicit read access even if they don't have the system capability.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccount.explictreadaccesspackagefamilynames
     * @type {IVector<HSTRING>} 
     */
    ExplictReadAccessPackageFamilyNames {
        get => this.get_ExplictReadAccessPackageFamilyNames()
    }

    /**
     * Gets or sets the human readable display name for the user data account.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccount.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * This API supports the product infrastructure and is not intended to be used directly from your code.
     * 
     * Microsoft Internal Use Only.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccount.canshowcreatecontactgroup
     * @type {Boolean} 
     */
    CanShowCreateContactGroup {
        get => this.get_CanShowCreateContactGroup()
        set => this.put_CanShowCreateContactGroup(value)
    }

    /**
     * Provides a place to store data to be used by the app when interacting with a [UserDataAccount](userdataaccount.md) provider.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccount.providerproperties
     * @type {IPropertySet} 
     */
    ProviderProperties {
        get => this.get_ProviderProperties()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IUserDataAccount")) {
            if ((queryResult := this.QueryInterface(IUserDataAccount.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccount := IUserDataAccount(outPtr)
        }

        return this.__IUserDataAccount.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UserDisplayName() {
        if (!this.HasProp("__IUserDataAccount")) {
            if ((queryResult := this.QueryInterface(IUserDataAccount.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccount := IUserDataAccount(outPtr)
        }

        return this.__IUserDataAccount.get_UserDisplayName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_UserDisplayName(value) {
        if (!this.HasProp("__IUserDataAccount")) {
            if ((queryResult := this.QueryInterface(IUserDataAccount.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccount := IUserDataAccount(outPtr)
        }

        return this.__IUserDataAccount.put_UserDisplayName(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OtherAppReadAccess() {
        if (!this.HasProp("__IUserDataAccount")) {
            if ((queryResult := this.QueryInterface(IUserDataAccount.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccount := IUserDataAccount(outPtr)
        }

        return this.__IUserDataAccount.get_OtherAppReadAccess()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_OtherAppReadAccess(value) {
        if (!this.HasProp("__IUserDataAccount")) {
            if ((queryResult := this.QueryInterface(IUserDataAccount.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccount := IUserDataAccount(outPtr)
        }

        return this.__IUserDataAccount.put_OtherAppReadAccess(value)
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_Icon() {
        if (!this.HasProp("__IUserDataAccount")) {
            if ((queryResult := this.QueryInterface(IUserDataAccount.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccount := IUserDataAccount(outPtr)
        }

        return this.__IUserDataAccount.get_Icon()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceAccountTypeId() {
        if (!this.HasProp("__IUserDataAccount")) {
            if ((queryResult := this.QueryInterface(IUserDataAccount.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccount := IUserDataAccount(outPtr)
        }

        return this.__IUserDataAccount.get_DeviceAccountTypeId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PackageFamilyName() {
        if (!this.HasProp("__IUserDataAccount")) {
            if ((queryResult := this.QueryInterface(IUserDataAccount.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccount := IUserDataAccount(outPtr)
        }

        return this.__IUserDataAccount.get_PackageFamilyName()
    }

    /**
     * Asynchronously persists the [UserDataAccount](userdataaccount.md) to the database.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccount.saveasync
     */
    SaveAsync() {
        if (!this.HasProp("__IUserDataAccount")) {
            if ((queryResult := this.QueryInterface(IUserDataAccount.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccount := IUserDataAccount(outPtr)
        }

        return this.__IUserDataAccount.SaveAsync()
    }

    /**
     * Asynchronously deletes all the contact, calendar and email data associated with the account.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccount.deleteasync
     */
    DeleteAsync() {
        if (!this.HasProp("__IUserDataAccount")) {
            if ((queryResult := this.QueryInterface(IUserDataAccount.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccount := IUserDataAccount(outPtr)
        }

        return this.__IUserDataAccount.DeleteAsync()
    }

    /**
     * Returns a collection of [AppointmentCalendar](../windows.applicationmodel.appointments/appointmentcalendar.md) instances associated with the [UserDataAccount](userdataaccount.md).
     * @returns {IAsyncOperation<IVectorView<AppointmentCalendar>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccount.findappointmentcalendarsasync
     */
    FindAppointmentCalendarsAsync() {
        if (!this.HasProp("__IUserDataAccount")) {
            if ((queryResult := this.QueryInterface(IUserDataAccount.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccount := IUserDataAccount(outPtr)
        }

        return this.__IUserDataAccount.FindAppointmentCalendarsAsync()
    }

    /**
     * Returns a collection of [EmailMailbox](../windows.applicationmodel.email/emailmailbox.md) instances associated with the [UserDataAccount](userdataaccount.md).
     * @returns {IAsyncOperation<IVectorView<EmailMailbox>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccount.findemailmailboxesasync
     */
    FindEmailMailboxesAsync() {
        if (!this.HasProp("__IUserDataAccount")) {
            if ((queryResult := this.QueryInterface(IUserDataAccount.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccount := IUserDataAccount(outPtr)
        }

        return this.__IUserDataAccount.FindEmailMailboxesAsync()
    }

    /**
     * Returns a collection of [ContactList](../windows.applicationmodel.contacts/contactlist.md) instances associated with the [UserDataAccount](userdataaccount.md).
     * @returns {IAsyncOperation<IVectorView<ContactList>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccount.findcontactlistsasync
     */
    FindContactListsAsync() {
        if (!this.HasProp("__IUserDataAccount")) {
            if ((queryResult := this.QueryInterface(IUserDataAccount.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccount := IUserDataAccount(outPtr)
        }

        return this.__IUserDataAccount.FindContactListsAsync()
    }

    /**
     * Returns a collection of [ContactAnnotationList](../windows.applicationmodel.contacts/contactannotationlist.md) instances associated with the [UserDataAccount](userdataaccount.md).
     * @returns {IAsyncOperation<IVectorView<ContactAnnotationList>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccount.findcontactannotationlistsasync
     */
    FindContactAnnotationListsAsync() {
        if (!this.HasProp("__IUserDataAccount")) {
            if ((queryResult := this.QueryInterface(IUserDataAccount.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccount := IUserDataAccount(outPtr)
        }

        return this.__IUserDataAccount.FindContactAnnotationListsAsync()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EnterpriseId() {
        if (!this.HasProp("__IUserDataAccount2")) {
            if ((queryResult := this.QueryInterface(IUserDataAccount2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccount2 := IUserDataAccount2(outPtr)
        }

        return this.__IUserDataAccount2.get_EnterpriseId()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsProtectedUnderLock() {
        if (!this.HasProp("__IUserDataAccount2")) {
            if ((queryResult := this.QueryInterface(IUserDataAccount2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccount2 := IUserDataAccount2(outPtr)
        }

        return this.__IUserDataAccount2.get_IsProtectedUnderLock()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_ExplictReadAccessPackageFamilyNames() {
        if (!this.HasProp("__IUserDataAccount3")) {
            if ((queryResult := this.QueryInterface(IUserDataAccount3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccount3 := IUserDataAccount3(outPtr)
        }

        return this.__IUserDataAccount3.get_ExplictReadAccessPackageFamilyNames()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IUserDataAccount3")) {
            if ((queryResult := this.QueryInterface(IUserDataAccount3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccount3 := IUserDataAccount3(outPtr)
        }

        return this.__IUserDataAccount3.get_DisplayName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayName(value) {
        if (!this.HasProp("__IUserDataAccount3")) {
            if ((queryResult := this.QueryInterface(IUserDataAccount3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccount3 := IUserDataAccount3(outPtr)
        }

        return this.__IUserDataAccount3.put_DisplayName(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanShowCreateContactGroup() {
        if (!this.HasProp("__IUserDataAccount4")) {
            if ((queryResult := this.QueryInterface(IUserDataAccount4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccount4 := IUserDataAccount4(outPtr)
        }

        return this.__IUserDataAccount4.get_CanShowCreateContactGroup()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanShowCreateContactGroup(value) {
        if (!this.HasProp("__IUserDataAccount4")) {
            if ((queryResult := this.QueryInterface(IUserDataAccount4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccount4 := IUserDataAccount4(outPtr)
        }

        return this.__IUserDataAccount4.put_CanShowCreateContactGroup(value)
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    get_ProviderProperties() {
        if (!this.HasProp("__IUserDataAccount4")) {
            if ((queryResult := this.QueryInterface(IUserDataAccount4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccount4 := IUserDataAccount4(outPtr)
        }

        return this.__IUserDataAccount4.get_ProviderProperties()
    }

    /**
     * Returns a collection of [UserDataTask](/uwp/api/windows.applicationmodel.userdatatasks.userdatatask) instances associated with the [UserDataAccount](userdataaccount.md).
     * @returns {IAsyncOperation<IVectorView<UserDataTaskList>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccount.finduserdatatasklistsasync
     */
    FindUserDataTaskListsAsync() {
        if (!this.HasProp("__IUserDataAccount4")) {
            if ((queryResult := this.QueryInterface(IUserDataAccount4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccount4 := IUserDataAccount4(outPtr)
        }

        return this.__IUserDataAccount4.FindUserDataTaskListsAsync()
    }

    /**
     * This API supports the product infrastructure and is not intended to be used directly from your code.
     * 
     * Microsoft Internal Use Only.
     * @returns {IAsyncOperation<IVectorView<ContactGroup>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccount.findcontactgroupsasync
     */
    FindContactGroupsAsync() {
        if (!this.HasProp("__IUserDataAccount4")) {
            if ((queryResult := this.QueryInterface(IUserDataAccount4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccount4 := IUserDataAccount4(outPtr)
        }

        return this.__IUserDataAccount4.FindContactGroupsAsync()
    }

    /**
     * This API supports the product infrastructure and is not intended to be used directly from your code.
     * 
     * Microsoft Internal Use Only.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccount.tryshowcreatecontactgroupasync
     */
    TryShowCreateContactGroupAsync() {
        if (!this.HasProp("__IUserDataAccount4")) {
            if ((queryResult := this.QueryInterface(IUserDataAccount4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccount4 := IUserDataAccount4(outPtr)
        }

        return this.__IUserDataAccount4.TryShowCreateContactGroupAsync()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsProtectedUnderLock(value) {
        if (!this.HasProp("__IUserDataAccount4")) {
            if ((queryResult := this.QueryInterface(IUserDataAccount4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccount4 := IUserDataAccount4(outPtr)
        }

        return this.__IUserDataAccount4.put_IsProtectedUnderLock(value)
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} value 
     * @returns {HRESULT} 
     */
    put_Icon(value) {
        if (!this.HasProp("__IUserDataAccount4")) {
            if ((queryResult := this.QueryInterface(IUserDataAccount4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccount4 := IUserDataAccount4(outPtr)
        }

        return this.__IUserDataAccount4.put_Icon(value)
    }

;@endregion Instance Methods
}
