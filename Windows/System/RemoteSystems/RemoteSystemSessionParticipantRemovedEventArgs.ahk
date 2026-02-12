#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteSystemSessionParticipantRemovedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains information about a [RemoteSystemSessionParticipantWatcher.Removed](RemoteSystemSessionParticipantWatcher_Removed.md) event, namely the participant that was removed from the session.
 * @remarks
 * This class is instantiated whenever the [RemoteSystemSessionParticipantWatcher.Removed](RemoteSystemSessionParticipantWatcher_Removed.md) is raised, and it should be handled by the method(s) registered to this event.
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionparticipantremovedeventargs
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemSessionParticipantRemovedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteSystemSessionParticipantRemovedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteSystemSessionParticipantRemovedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the participant that was removed from the remote session.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionparticipantremovedeventargs.participant
     * @type {RemoteSystemSessionParticipant} 
     */
    Participant {
        get => this.get_Participant()
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
    get_Participant() {
        if (!this.HasProp("__IRemoteSystemSessionParticipantRemovedEventArgs")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionParticipantRemovedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionParticipantRemovedEventArgs := IRemoteSystemSessionParticipantRemovedEventArgs(outPtr)
        }

        return this.__IRemoteSystemSessionParticipantRemovedEventArgs.get_Participant()
    }

;@endregion Instance Methods
}
