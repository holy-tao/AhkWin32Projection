#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteSystemSessionParticipant.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a device that is a participant in a remote session. A session can have one or more participants.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionparticipant
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemSessionParticipant extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteSystemSessionParticipant

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteSystemSessionParticipant.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the remote system that is a participant in the session.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionparticipant.remotesystem
     * @type {RemoteSystem} 
     */
    RemoteSystem {
        get => this.get_RemoteSystem()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {RemoteSystem} 
     */
    get_RemoteSystem() {
        if (!this.HasProp("__IRemoteSystemSessionParticipant")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionParticipant.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionParticipant := IRemoteSystemSessionParticipant(outPtr)
        }

        return this.__IRemoteSystemSessionParticipant.get_RemoteSystem()
    }

    /**
     * Retrieves a list of host names for this remote session participant that are resolvable by the other remote systems in the session.
     * @returns {IVectorView<HostName>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionparticipant.gethostnames
     */
    GetHostNames() {
        if (!this.HasProp("__IRemoteSystemSessionParticipant")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionParticipant.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionParticipant := IRemoteSystemSessionParticipant(outPtr)
        }

        return this.__IRemoteSystemSessionParticipant.GetHostNames()
    }

;@endregion Instance Methods
}
