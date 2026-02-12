#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IIsolatedWindowsHostMessengerStatics.ahk
#Include .\IIsolatedWindowsHostMessengerStatics2.ahk
#Include ..\..\..\Guid.ahk

/**
 * **Deprecated.** Runtime class for two methods: [PostMessageToReceivier](isolatedwindowshostmessenger_postmessagetoreceiver_901016500.md) and [getfileid](isolatedwindowshostmessenger_getfileid_1663057180.md).
 * @remarks
 * > [!WARNING]
 * > This is a deprecated API.
 * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowshostmessenger
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IsolatedWindowsHostMessenger extends IInspectable {
;@region Static Methods
    /**
     * **Deprecated.** Post a message from the Isolated Windows Environment to the receiver that is registered on the host side.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @param {Guid} receiverId GUID for message receiver.
     * @param {IVectorView<IInspectable>} message IVectorView
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowshostmessenger.postmessagetoreceiver
     */
    static PostMessageToReceiver(receiverId, message) {
        if (!IsolatedWindowsHostMessenger.HasProp("__IIsolatedWindowsHostMessengerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Isolation.IsolatedWindowsHostMessenger")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIsolatedWindowsHostMessengerStatics.IID)
            IsolatedWindowsHostMessenger.__IIsolatedWindowsHostMessengerStatics := IIsolatedWindowsHostMessengerStatics(factoryPtr)
        }

        return IsolatedWindowsHostMessenger.__IIsolatedWindowsHostMessengerStatics.PostMessageToReceiver(receiverId, message)
    }

    /**
     * **Deprecated.** Gets an unique identifier of the file that is opened in the Isolated Windows Environment.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @param {HSTRING} filePath Path of the file on the host.
     * @returns {Guid} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowshostmessenger.getfileid
     */
    static GetFileId(filePath) {
        if (!IsolatedWindowsHostMessenger.HasProp("__IIsolatedWindowsHostMessengerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Isolation.IsolatedWindowsHostMessenger")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIsolatedWindowsHostMessengerStatics.IID)
            IsolatedWindowsHostMessenger.__IIsolatedWindowsHostMessengerStatics := IIsolatedWindowsHostMessengerStatics(factoryPtr)
        }

        return IsolatedWindowsHostMessenger.__IIsolatedWindowsHostMessengerStatics.GetFileId(filePath)
    }

    /**
     * **Deprecated.** Register host message receiver callback.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @param {Guid} receiverId GUID for message receiver.
     * @param {HostMessageReceivedCallback} hostMessageReceivedCallback_ Callback function [hostmessageReceivedCallback](hostmessagereceivedcallback.md)
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowshostmessenger.registerhostmessagereceiver
     */
    static RegisterHostMessageReceiver(receiverId, hostMessageReceivedCallback_) {
        if (!IsolatedWindowsHostMessenger.HasProp("__IIsolatedWindowsHostMessengerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.Isolation.IsolatedWindowsHostMessenger")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIsolatedWindowsHostMessengerStatics2.IID)
            IsolatedWindowsHostMessenger.__IIsolatedWindowsHostMessengerStatics2 := IIsolatedWindowsHostMessengerStatics2(factoryPtr)
        }

        return IsolatedWindowsHostMessenger.__IIsolatedWindowsHostMessengerStatics2.RegisterHostMessageReceiver(receiverId, hostMessageReceivedCallback_)
    }

    /**
     * **Deprecated.** Unregister host message receiver callback.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @param {Guid} receiverId GUID for message receiver.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowshostmessenger.unregisterhostmessagereceiver
     */
    static UnregisterHostMessageReceiver(receiverId) {
        if (!IsolatedWindowsHostMessenger.HasProp("__IIsolatedWindowsHostMessengerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.Isolation.IsolatedWindowsHostMessenger")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIsolatedWindowsHostMessengerStatics2.IID)
            IsolatedWindowsHostMessenger.__IIsolatedWindowsHostMessengerStatics2 := IIsolatedWindowsHostMessengerStatics2(factoryPtr)
        }

        return IsolatedWindowsHostMessenger.__IIsolatedWindowsHostMessengerStatics2.UnregisterHostMessageReceiver(receiverId)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
