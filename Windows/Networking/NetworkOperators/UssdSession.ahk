#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUssdSession.ahk
#Include .\IUssdSessionStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a session of the USSD network protocol.
  * 
  * > [!IMPORTANT]
  * > **UssdSession** is applicable to Windows 10 for desktop form factors (MBIM-based modems), but not to Windows 10 Mobile (RIL-based modems).
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.ussdsession
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class UssdSession extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUssdSession

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUssdSession.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a USSD session for the mobile device associated with the supplied network account ID.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @param {HSTRING} networkAccountId The network account ID to use to select the corresponding mobile broadband device to use for the USSD session.
     * @returns {UssdSession} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.ussdsession.createfromnetworkaccountid
     */
    static CreateFromNetworkAccountId(networkAccountId) {
        if (!UssdSession.HasProp("__IUssdSessionStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.UssdSession")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUssdSessionStatics.IID)
            UssdSession.__IUssdSessionStatics := IUssdSessionStatics(factoryPtr)
        }

        return UssdSession.__IUssdSessionStatics.CreateFromNetworkAccountId(networkAccountId)
    }

    /**
     * Creates a USSD session for the mobile device associated with the supplied network interface ID.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @param {HSTRING} networkInterfaceId The network interface ID to use to select the corresponding mobile broadband device to use for the USSD session.
     * @returns {UssdSession} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.ussdsession.createfromnetworkinterfaceid
     */
    static CreateFromNetworkInterfaceId(networkInterfaceId) {
        if (!UssdSession.HasProp("__IUssdSessionStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.UssdSession")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUssdSessionStatics.IID)
            UssdSession.__IUssdSessionStatics := IUssdSessionStatics(factoryPtr)
        }

        return UssdSession.__IUssdSessionStatics.CreateFromNetworkInterfaceId(networkInterfaceId)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Sends a message to a USSD session and returns a handler to retrieve the reply asynchronously.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * The USSD message being sent can be either a request or a response. The operation is asynchronous and issues a single callback using the [IAsyncOperation(UssdReply)](../windows.foundation/iasyncoperation_1.md) interface upon completion. You can cancel the asynchronous operation using the [IAsyncOperation(UssdReply)](../windows.foundation/iasyncoperation_1.md) interface.
     * 
     * When an application using the C++ projection of SendMessageAndGetReplyAsync releases its last reference to the [UssdSession](ussdsession.md) object from within that callback, SendMessageAndGetReplyAsync may hang. Therefore, applications must ensure that the callback is not released from within SendMessageAndGetReplyAsync. One way of doing this is to create another asynchronous operation (for example, a timer) from within the callback whose completion callback is used to release the session object by passing it a reference to the session object.
     * 
     * ```cppwinrt
     * @param {UssdMessage} message The message to send to the USSD session.
     * @returns {IAsyncOperation<UssdReply>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.ussdsession.sendmessageandgetreplyasync
     */
    SendMessageAndGetReplyAsync(message) {
        if (!this.HasProp("__IUssdSession")) {
            if ((queryResult := this.QueryInterface(IUssdSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUssdSession := IUssdSession(outPtr)
        }

        return this.__IUssdSession.SendMessageAndGetReplyAsync(message)
    }

    /**
     * Closes the USSD session with the network.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.ussdsession.close
     */
    Close() {
        if (!this.HasProp("__IUssdSession")) {
            if ((queryResult := this.QueryInterface(IUssdSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUssdSession := IUssdSession(outPtr)
        }

        return this.__IUssdSession.Close()
    }

;@endregion Instance Methods
}
