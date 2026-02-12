#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteSystemSessionValueSetReceivedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains information about a [RemoteSystemSessionMessageChannel.ValueSetReceived](RemoteSystemSessionMessageChannel_ValueSetReceived.md) event that was raised, namely the message that was received.
 * @remarks
 * This class is instantiated whenever the [RemoteSystemSessionMessageChannel.ValueSetReceived](RemoteSystemSessionMessageChannel_ValueSetReceived.md) event is raised, and it should be handled by the method(s) registered to this event.
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionvaluesetreceivedeventargs
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemSessionValueSetReceivedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteSystemSessionValueSetReceivedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteSystemSessionValueSetReceivedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the remote session participant that sent the message to the channel and caused this [ValueSetReceived](remotesystemsessionmessagechannel_valuesetreceived.md) event to be raised.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionvaluesetreceivedeventargs.sender
     * @type {RemoteSystemSessionParticipant} 
     */
    Sender {
        get => this.get_Sender()
    }

    /**
     * Gets the contents of the message received by the channel.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionvaluesetreceivedeventargs.message
     * @type {ValueSet} 
     */
    Message {
        get => this.get_Message()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {RemoteSystemSessionParticipant} 
     */
    get_Sender() {
        if (!this.HasProp("__IRemoteSystemSessionValueSetReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionValueSetReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionValueSetReceivedEventArgs := IRemoteSystemSessionValueSetReceivedEventArgs(outPtr)
        }

        return this.__IRemoteSystemSessionValueSetReceivedEventArgs.get_Sender()
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_Message() {
        if (!this.HasProp("__IRemoteSystemSessionValueSetReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionValueSetReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionValueSetReceivedEventArgs := IRemoteSystemSessionValueSetReceivedEventArgs(outPtr)
        }

        return this.__IRemoteSystemSessionValueSetReceivedEventArgs.get_Message()
    }

;@endregion Instance Methods
}
