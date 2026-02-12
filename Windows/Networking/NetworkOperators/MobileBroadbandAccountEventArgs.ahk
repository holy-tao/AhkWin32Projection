#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandAccountEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information for the [AccountAdded](mobilebroadbandaccountwatcher_accountadded.md) and [AccountRemoved](mobilebroadbandaccountwatcher_accountremoved.md) events.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * <!--MUST add details of how event objects are retrieved from the event handler-->
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandaccounteventargs
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandAccountEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandAccountEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandAccountEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the network account Id that was added or removed.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandaccounteventargs.networkaccountid
     * @type {HSTRING} 
     */
    NetworkAccountId {
        get => this.get_NetworkAccountId()
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
    get_NetworkAccountId() {
        if (!this.HasProp("__IMobileBroadbandAccountEventArgs")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandAccountEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandAccountEventArgs := IMobileBroadbandAccountEventArgs(outPtr)
        }

        return this.__IMobileBroadbandAccountEventArgs.get_NetworkAccountId()
    }

;@endregion Instance Methods
}
