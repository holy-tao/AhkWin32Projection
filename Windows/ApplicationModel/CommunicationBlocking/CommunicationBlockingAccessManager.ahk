#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICommunicationBlockingAccessManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * The manager responsible for keeping track of blocked numbers and displaying the appropriate blocking user interfaces.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.communicationblocking.communicationblockingaccessmanager
 * @namespace Windows.ApplicationModel.CommunicationBlocking
 * @version WindowsRuntime 1.4
 */
class CommunicationBlockingAccessManager extends IInspectable {
;@region Static Properties
    /**
     * Gets whether or not blocking is currently enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.communicationblocking.communicationblockingaccessmanager.isblockingactive
     * @type {Boolean} 
     */
    static IsBlockingActive {
        get => CommunicationBlockingAccessManager.get_IsBlockingActive()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Boolean} 
     */
    static get_IsBlockingActive() {
        if (!CommunicationBlockingAccessManager.HasProp("__ICommunicationBlockingAccessManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.CommunicationBlocking.CommunicationBlockingAccessManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICommunicationBlockingAccessManagerStatics.IID)
            CommunicationBlockingAccessManager.__ICommunicationBlockingAccessManagerStatics := ICommunicationBlockingAccessManagerStatics(factoryPtr)
        }

        return CommunicationBlockingAccessManager.__ICommunicationBlockingAccessManagerStatics.get_IsBlockingActive()
    }

    /**
     * An asynchronous operation that returns whether or not a number is on the block list.
     * @param {HSTRING} number_ The number to check.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.communicationblocking.communicationblockingaccessmanager.isblockednumberasync
     */
    static IsBlockedNumberAsync(number_) {
        if (!CommunicationBlockingAccessManager.HasProp("__ICommunicationBlockingAccessManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.CommunicationBlocking.CommunicationBlockingAccessManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICommunicationBlockingAccessManagerStatics.IID)
            CommunicationBlockingAccessManager.__ICommunicationBlockingAccessManagerStatics := ICommunicationBlockingAccessManagerStatics(factoryPtr)
        }

        return CommunicationBlockingAccessManager.__ICommunicationBlockingAccessManagerStatics.IsBlockedNumberAsync(number_)
    }

    /**
     * Launches a UI to block numbers if there as an active blocking app.
     * @remarks
     * This method creates and displays a user interface to enable the user to block the provided *phoneNumbers*.
     * @param {IIterable<HSTRING>} phoneNumbers The list of numbers to add to the block list.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.communicationblocking.communicationblockingaccessmanager.showblocknumbersui
     */
    static ShowBlockNumbersUI(phoneNumbers) {
        if (!CommunicationBlockingAccessManager.HasProp("__ICommunicationBlockingAccessManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.CommunicationBlocking.CommunicationBlockingAccessManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICommunicationBlockingAccessManagerStatics.IID)
            CommunicationBlockingAccessManager.__ICommunicationBlockingAccessManagerStatics := ICommunicationBlockingAccessManagerStatics(factoryPtr)
        }

        return CommunicationBlockingAccessManager.__ICommunicationBlockingAccessManagerStatics.ShowBlockNumbersUI(phoneNumbers)
    }

    /**
     * Launches the app to unblock numbers if there as an active blocking app.
     * @param {IIterable<HSTRING>} phoneNumbers The list of numbers to remove from the block list.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.communicationblocking.communicationblockingaccessmanager.showunblocknumbersui
     */
    static ShowUnblockNumbersUI(phoneNumbers) {
        if (!CommunicationBlockingAccessManager.HasProp("__ICommunicationBlockingAccessManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.CommunicationBlocking.CommunicationBlockingAccessManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICommunicationBlockingAccessManagerStatics.IID)
            CommunicationBlockingAccessManager.__ICommunicationBlockingAccessManagerStatics := ICommunicationBlockingAccessManagerStatics(factoryPtr)
        }

        return CommunicationBlockingAccessManager.__ICommunicationBlockingAccessManagerStatics.ShowUnblockNumbersUI(phoneNumbers)
    }

    /**
     * Displays the list of blocked calls.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.communicationblocking.communicationblockingaccessmanager.showblockedcallsui
     */
    static ShowBlockedCallsUI() {
        if (!CommunicationBlockingAccessManager.HasProp("__ICommunicationBlockingAccessManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.CommunicationBlocking.CommunicationBlockingAccessManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICommunicationBlockingAccessManagerStatics.IID)
            CommunicationBlockingAccessManager.__ICommunicationBlockingAccessManagerStatics := ICommunicationBlockingAccessManagerStatics(factoryPtr)
        }

        return CommunicationBlockingAccessManager.__ICommunicationBlockingAccessManagerStatics.ShowBlockedCallsUI()
    }

    /**
     * Displays the list of blocked messages.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.communicationblocking.communicationblockingaccessmanager.showblockedmessagesui
     */
    static ShowBlockedMessagesUI() {
        if (!CommunicationBlockingAccessManager.HasProp("__ICommunicationBlockingAccessManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.CommunicationBlocking.CommunicationBlockingAccessManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICommunicationBlockingAccessManagerStatics.IID)
            CommunicationBlockingAccessManager.__ICommunicationBlockingAccessManagerStatics := ICommunicationBlockingAccessManagerStatics(factoryPtr)
        }

        return CommunicationBlockingAccessManager.__ICommunicationBlockingAccessManagerStatics.ShowBlockedMessagesUI()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
