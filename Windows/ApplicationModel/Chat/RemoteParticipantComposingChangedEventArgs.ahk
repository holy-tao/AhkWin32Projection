#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteParticipantComposingChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data to the [RemoteParticipantComposingChanged](chatconversation_remoteparticipantcomposingchanged.md) event.
 * @remarks
 * An instance of this class is created by the system and passed as an argument to the [RemoteParticipantComposingChanged](chatconversation_remoteparticipantcomposingchanged.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.remoteparticipantcomposingchangedeventargs
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class RemoteParticipantComposingChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteParticipantComposingChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteParticipantComposingChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the ID for the message transport.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.remoteparticipantcomposingchangedeventargs.transportid
     * @type {HSTRING} 
     */
    TransportId {
        get => this.get_TransportId()
    }

    /**
     * Gets the address of the remote chat participant.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.remoteparticipantcomposingchangedeventargs.participantaddress
     * @type {HSTRING} 
     */
    ParticipantAddress {
        get => this.get_ParticipantAddress()
    }

    /**
     * Gets a Boolean value indicating if the remote participant is currently composing a message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.remoteparticipantcomposingchangedeventargs.iscomposing
     * @type {Boolean} 
     */
    IsComposing {
        get => this.get_IsComposing()
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
    get_TransportId() {
        if (!this.HasProp("__IRemoteParticipantComposingChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IRemoteParticipantComposingChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteParticipantComposingChangedEventArgs := IRemoteParticipantComposingChangedEventArgs(outPtr)
        }

        return this.__IRemoteParticipantComposingChangedEventArgs.get_TransportId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ParticipantAddress() {
        if (!this.HasProp("__IRemoteParticipantComposingChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IRemoteParticipantComposingChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteParticipantComposingChangedEventArgs := IRemoteParticipantComposingChangedEventArgs(outPtr)
        }

        return this.__IRemoteParticipantComposingChangedEventArgs.get_ParticipantAddress()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsComposing() {
        if (!this.HasProp("__IRemoteParticipantComposingChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IRemoteParticipantComposingChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteParticipantComposingChangedEventArgs := IRemoteParticipantComposingChangedEventArgs(outPtr)
        }

        return this.__IRemoteParticipantComposingChangedEventArgs.get_IsComposing()
    }

;@endregion Instance Methods
}
