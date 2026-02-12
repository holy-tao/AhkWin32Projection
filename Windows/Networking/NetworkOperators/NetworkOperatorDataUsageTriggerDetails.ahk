#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INetworkOperatorDataUsageTriggerDetails.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides details about the data usage change that activated a [NetworkOperatorDataUsageTrigger](../windows.applicationmodel.background/networkoperatordatausagetrigger.md).
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * >
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic, and [Mobile Broadband](/windows-hardware/drivers/mobilebroadband/index).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatordatausagetriggerdetails
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class NetworkOperatorDataUsageTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INetworkOperatorDataUsageTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INetworkOperatorDataUsageTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets details about the kind of data usage change that activated a mobile network operator data usage trigger.
     * Details about the kind of data usage change that activated the trigger.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic, and [Mobile Broadband](/windows-hardware/drivers/mobilebroadband/index).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatordatausagetriggerdetails.notificationkind
     * @type {Integer} 
     */
    NotificationKind {
        get => this.get_NotificationKind()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NotificationKind() {
        if (!this.HasProp("__INetworkOperatorDataUsageTriggerDetails")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorDataUsageTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorDataUsageTriggerDetails := INetworkOperatorDataUsageTriggerDetails(outPtr)
        }

        return this.__INetworkOperatorDataUsageTriggerDetails.get_NotificationKind()
    }

;@endregion Instance Methods
}
