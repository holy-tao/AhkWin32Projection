#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INetworkOperatorNotificationTrigger.ahk
#Include .\INetworkOperatorNotificationTriggerFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a mobile network operator notification trigger.
 * @remarks
 * In preference to using **NetworkOperatorNotificationTrigger** and handling a **DataPlanThresholdReached** value for [NetworkOperatorEventMessageType](../windows.networking.networkoperators/networkoperatoreventmessagetype.md), you should use [NetworkOperatorDataUsageTrigger](networkoperatordatausagetrigger.md). You can register **NetworkOperatorDataUsageTrigger** by using standard background trigger idioms.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.networkoperatornotificationtrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class NetworkOperatorNotificationTrigger extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INetworkOperatorNotificationTrigger

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INetworkOperatorNotificationTrigger.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of a mobile network operator notification.
     * @param {HSTRING} networkAccountId Specifies the unique identifier of the mobile broadband account.
     * @returns {NetworkOperatorNotificationTrigger} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.networkoperatornotificationtrigger.#ctor
     */
    static Create(networkAccountId) {
        if (!NetworkOperatorNotificationTrigger.HasProp("__INetworkOperatorNotificationTriggerFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.NetworkOperatorNotificationTrigger")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INetworkOperatorNotificationTriggerFactory.IID)
            NetworkOperatorNotificationTrigger.__INetworkOperatorNotificationTriggerFactory := INetworkOperatorNotificationTriggerFactory(factoryPtr)
        }

        return NetworkOperatorNotificationTrigger.__INetworkOperatorNotificationTriggerFactory.Create(networkAccountId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the account identifier for the mobile network operator notification trigger.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.networkoperatornotificationtrigger.networkaccountid
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
        if (!this.HasProp("__INetworkOperatorNotificationTrigger")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorNotificationTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorNotificationTrigger := INetworkOperatorNotificationTrigger(outPtr)
        }

        return this.__INetworkOperatorNotificationTrigger.get_NetworkAccountId()
    }

;@endregion Instance Methods
}
