#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhoneCallHistoryManagerStatics2.ahk
#Include .\IPhoneCallHistoryManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides APIs for the application to get access to the [PhoneCallHistoryStore](phonecallhistorystore.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistorymanager
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneCallHistoryManager extends IInspectable {
;@region Static Methods
    /**
     * Gets the [PhoneCallHistoryManagerForUser](phonecallhistorymanagerforuser.md) object for a specific user which provides access to the [PhoneCallHistoryStore](phonecallhistorystore.md) for a specific user.
     * @param {User} user_ The user that you are interested in.
     * @returns {PhoneCallHistoryManagerForUser} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistorymanager.getforuser
     */
    static GetForUser(user_) {
        if (!PhoneCallHistoryManager.HasProp("__IPhoneCallHistoryManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Calls.PhoneCallHistoryManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPhoneCallHistoryManagerStatics2.IID)
            PhoneCallHistoryManager.__IPhoneCallHistoryManagerStatics2 := IPhoneCallHistoryManagerStatics2(factoryPtr)
        }

        return PhoneCallHistoryManager.__IPhoneCallHistoryManagerStatics2.GetForUser(user_)
    }

    /**
     * Requests the [PhoneCallHistoryStore](phonecallhistorystore.md) associated with the calling application.
     * @param {Integer} accessType The type of access requested for the [PhoneCallHistoryStore](phonecallhistorystore.md) object.
     * @returns {IAsyncOperation<PhoneCallHistoryStore>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistorymanager.requeststoreasync
     */
    static RequestStoreAsync(accessType) {
        if (!PhoneCallHistoryManager.HasProp("__IPhoneCallHistoryManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Calls.PhoneCallHistoryManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPhoneCallHistoryManagerStatics.IID)
            PhoneCallHistoryManager.__IPhoneCallHistoryManagerStatics := IPhoneCallHistoryManagerStatics(factoryPtr)
        }

        return PhoneCallHistoryManager.__IPhoneCallHistoryManagerStatics.RequestStoreAsync(accessType)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
