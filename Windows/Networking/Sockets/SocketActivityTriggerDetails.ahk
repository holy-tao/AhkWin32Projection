#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISocketActivityTriggerDetails.ahk
#Include ..\..\..\Guid.ahk

/**
 * A object instantiated by the background broker infrastructure and used by an app to retrieve details when a [SocketActivityTrigger](../windows.applicationmodel.background/socketactivitytrigger.md) occurs.
 * @remarks
 * The SocketActivityTriggerDetails object is used by an app to retrieve the [SocketActivityInformation](socketactivityinformation.md) object for the socket that caused a [SocketActivityTrigger](../windows.applicationmodel.background/socketactivitytrigger.md) to occur, and to get the reason that the trigger occurred.
 * 
 * A SocketActivityTriggerDetails instance is created when the background task for a socket signals a [SocketActivityTrigger](../windows.applicationmodel.background/socketactivitytrigger.md). (See the [SocketActivityTrigger](../windows.applicationmodel.background/socketactivitytrigger.md) class page for details on how to create a background task and transfer ownership of a socket to a socket broker for background listening.)
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.socketactivitytriggerdetails
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class SocketActivityTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISocketActivityTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISocketActivityTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Get the reason the [SocketActivityTrigger](../windows.applicationmodel.background/socketactivitytrigger.md) occurred.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.socketactivitytriggerdetails.reason
     * @type {Integer} 
     */
    Reason {
        get => this.get_Reason()
    }

    /**
     * Get the [SocketActivityInformation](socketactivityinformation.md) object for socket that caused the [SocketActivityTrigger](../windows.applicationmodel.background/socketactivitytrigger.md) to occur.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.socketactivitytriggerdetails.socketinformation
     * @type {SocketActivityInformation} 
     */
    SocketInformation {
        get => this.get_SocketInformation()
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
    get_Reason() {
        if (!this.HasProp("__ISocketActivityTriggerDetails")) {
            if ((queryResult := this.QueryInterface(ISocketActivityTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocketActivityTriggerDetails := ISocketActivityTriggerDetails(outPtr)
        }

        return this.__ISocketActivityTriggerDetails.get_Reason()
    }

    /**
     * 
     * @returns {SocketActivityInformation} 
     */
    get_SocketInformation() {
        if (!this.HasProp("__ISocketActivityTriggerDetails")) {
            if ((queryResult := this.QueryInterface(ISocketActivityTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISocketActivityTriggerDetails := ISocketActivityTriggerDetails(outPtr)
        }

        return this.__ISocketActivityTriggerDetails.get_SocketInformation()
    }

;@endregion Instance Methods
}
