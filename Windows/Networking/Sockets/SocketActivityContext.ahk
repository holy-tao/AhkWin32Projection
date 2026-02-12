#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISocketActivityContext.ahk
#Include .\ISocketActivityContextFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * The context associated with a socket while transferring ownership of the socket between an app and the socket brokering service.
 * @remarks
 * The SocketActivityContext class used by an app to pass serialized data to associate the app context to a transferred socket.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.socketactivitycontext
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class SocketActivityContext extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISocketActivityContext

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISocketActivityContext.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Constructs a new SocketActivityContext object with given context data.
     * @param {IBuffer} data Context data to be used when the socket broker notifies the app of socket activity.
     * @returns {SocketActivityContext} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.socketactivitycontext.#ctor
     */
    static Create(data) {
        if (!SocketActivityContext.HasProp("__ISocketActivityContextFactory")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Sockets.SocketActivityContext")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISocketActivityContextFactory.IID)
            SocketActivityContext.__ISocketActivityContextFactory := ISocketActivityContextFactory(factoryPtr)
        }

        return SocketActivityContext.__ISocketActivityContextFactory.Create(data)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Get the serialized data to associate the app context to a transferred socket.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.socketactivitycontext.data
     * @type {IBuffer} 
     */
    Data {
        get => this.get_Data()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Data() {
        if (!this.HasProp("__ISocketActivityContext")) {
            if ((queryResult := this.QueryInterface(ISocketActivityContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocketActivityContext := ISocketActivityContext(outPtr)
        }

        return this.__ISocketActivityContext.get_Data()
    }

;@endregion Instance Methods
}
