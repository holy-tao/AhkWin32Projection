#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteSystemSessionMessageChannel.ahk
#Include .\IRemoteSystemSessionMessageChannelFactory.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\RemoteSystemSessionMessageChannel.ahk
#Include .\RemoteSystemSessionValueSetReceivedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Handles a dedicated data transfer channel within a remote session. This class owns the functionality for both sending and receiving.
 * @remarks
 * Messages are sent and received over this channel asynchronously, so the chronological ordering of messages is not guaranteed.
 * 
 * Messages are delivered through a hub and spoke model: any message that a client sends to a participant or a set of participants is internally sent to the host device first, which then sends it to the target participant or participants.
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionmessagechannel
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemSessionMessageChannel extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteSystemSessionMessageChannel

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteSystemSessionMessageChannel.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes an instance of [RemoteSystemSessionMessageChannel](RemoteSystemSessionMessageChannel.md) to manage messaging for a given remote session
     * @param {RemoteSystemSession} session The [RemoteSystemSession](RemoteSystemSession.md) to which this messaging channel will correspond.
     * @param {HSTRING} channelName The user-defined name of the messaging channel. It should be simple and descriptive, such as "Bob's 3D App session."
     * @returns {RemoteSystemSessionMessageChannel} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionmessagechannel.#ctor
     */
    static Create(session, channelName) {
        if (!RemoteSystemSessionMessageChannel.HasProp("__IRemoteSystemSessionMessageChannelFactory")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteSystems.RemoteSystemSessionMessageChannel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteSystemSessionMessageChannelFactory.IID)
            RemoteSystemSessionMessageChannel.__IRemoteSystemSessionMessageChannelFactory := IRemoteSystemSessionMessageChannelFactory(factoryPtr)
        }

        return RemoteSystemSessionMessageChannel.__IRemoteSystemSessionMessageChannelFactory.Create(session, channelName)
    }

    /**
     * Initializes an instance of [RemoteSystemSessionMessageChannel](RemoteSystemSessionMessageChannel.md) to manage messaging for a given remote session, specifying the reliability type of the channel.
     * @param {RemoteSystemSession} session The [RemoteSystemSession](RemoteSystemSession.md) to which this messaging channel will correspond.
     * @param {HSTRING} channelName The user-defined name of the messaging channel. It should be simple and descriptive, such as "Bob's 3D App messaging channel."
     * @param {Integer} reliability A [RemoteSystemSessionMessageChannelReliability](RemoteSystemSessionMessageChannelReliability.md) value describing the reliability type of this channel.
     * @returns {RemoteSystemSessionMessageChannel} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionmessagechannel.#ctor
     */
    static CreateWithReliability(session, channelName, reliability) {
        if (!RemoteSystemSessionMessageChannel.HasProp("__IRemoteSystemSessionMessageChannelFactory")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteSystems.RemoteSystemSessionMessageChannel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteSystemSessionMessageChannelFactory.IID)
            RemoteSystemSessionMessageChannel.__IRemoteSystemSessionMessageChannelFactory := IRemoteSystemSessionMessageChannelFactory(factoryPtr)
        }

        return RemoteSystemSessionMessageChannel.__IRemoteSystemSessionMessageChannelFactory.CreateWithReliability(session, channelName, reliability)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the remote session to which this messaging channel corresponds.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionmessagechannel.session
     * @type {RemoteSystemSession} 
     */
    Session {
        get => this.get_Session()
    }

    /**
     * Raised when a message (in the form of a key-value pair) is received by the channel. The contents of the message are contained by the [RemoteSystemSessionValueSetReceivedEventArgs](RemoteSystemSessionValueSetReceivedEventArgs.md) object that is passed in.
     * @type {TypedEventHandler<RemoteSystemSessionMessageChannel, RemoteSystemSessionValueSetReceivedEventArgs>}
    */
    OnValueSetReceived {
        get {
            if(!this.HasProp("__OnValueSetReceived")){
                this.__OnValueSetReceived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{c476232d-8c76-5ba6-99f5-14557484c20d}"),
                    RemoteSystemSessionMessageChannel,
                    RemoteSystemSessionValueSetReceivedEventArgs
                )
                this.__OnValueSetReceivedToken := this.add_ValueSetReceived(this.__OnValueSetReceived.iface)
            }
            return this.__OnValueSetReceived
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnValueSetReceivedToken")) {
            this.remove_ValueSetReceived(this.__OnValueSetReceivedToken)
            this.__OnValueSetReceived.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {RemoteSystemSession} 
     */
    get_Session() {
        if (!this.HasProp("__IRemoteSystemSessionMessageChannel")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionMessageChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionMessageChannel := IRemoteSystemSessionMessageChannel(outPtr)
        }

        return this.__IRemoteSystemSessionMessageChannel.get_Session()
    }

    /**
     * Sends a message to all other participants in this remote session messaging channel.
     * @param {ValueSet} messageData A [ValueSet](/uwp/api/Windows.Foundation.Collections.ValueSet) object containing the data to be sent to all participants in the channel.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionmessagechannel.broadcastvaluesetasync
     */
    BroadcastValueSetAsync(messageData) {
        if (!this.HasProp("__IRemoteSystemSessionMessageChannel")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionMessageChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionMessageChannel := IRemoteSystemSessionMessageChannel(outPtr)
        }

        return this.__IRemoteSystemSessionMessageChannel.BroadcastValueSetAsync(messageData)
    }

    /**
     * Sends a message to a participant in this remote session messaging channel.
     * @param {ValueSet} messageData A [ValueSet](/uwp/api/Windows.Foundation.Collections.ValueSet) object containing the data to be sent to the specified participant.
     * @param {RemoteSystemSessionParticipant} participant A [RemoteSystemSessionParticipant](RemoteSystemSessionParticipant.md) object corresponding to the participant to which the message should be sent.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionmessagechannel.sendvaluesetasync
     */
    SendValueSetAsync(messageData, participant) {
        if (!this.HasProp("__IRemoteSystemSessionMessageChannel")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionMessageChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionMessageChannel := IRemoteSystemSessionMessageChannel(outPtr)
        }

        return this.__IRemoteSystemSessionMessageChannel.SendValueSetAsync(messageData, participant)
    }

    /**
     * Sends a message to a specified set participants in this remote session messaging channel.
     * @param {ValueSet} messageData A [ValueSet](/uwp/api/Windows.Foundation.Collections.ValueSet) object containing the data to be sent to the specified participants.
     * @param {IIterable<RemoteSystemSessionParticipant>} participants An iterable collection of [RemoteSystemSessionParticipant](RemoteSystemSessionParticipant.md) objects corresponding to the participants to which the message should be sent.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionmessagechannel.sendvaluesettoparticipantsasync
     */
    SendValueSetToParticipantsAsync(messageData, participants) {
        if (!this.HasProp("__IRemoteSystemSessionMessageChannel")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionMessageChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionMessageChannel := IRemoteSystemSessionMessageChannel(outPtr)
        }

        return this.__IRemoteSystemSessionMessageChannel.SendValueSetToParticipantsAsync(messageData, participants)
    }

    /**
     * 
     * @param {TypedEventHandler<RemoteSystemSessionMessageChannel, RemoteSystemSessionValueSetReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ValueSetReceived(handler) {
        if (!this.HasProp("__IRemoteSystemSessionMessageChannel")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionMessageChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionMessageChannel := IRemoteSystemSessionMessageChannel(outPtr)
        }

        return this.__IRemoteSystemSessionMessageChannel.add_ValueSetReceived(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ValueSetReceived(token) {
        if (!this.HasProp("__IRemoteSystemSessionMessageChannel")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionMessageChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionMessageChannel := IRemoteSystemSessionMessageChannel(outPtr)
        }

        return this.__IRemoteSystemSessionMessageChannel.remove_ValueSetReceived(token)
    }

;@endregion Instance Methods
}
