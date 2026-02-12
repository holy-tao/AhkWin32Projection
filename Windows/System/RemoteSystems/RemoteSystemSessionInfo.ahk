#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteSystemSessionInfo.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains identifying information about a remote session.
 * @remarks
 * A session that has been joined is represented by a [RemoteSystemSession](RemoteSystemSession.md) object. A session that is known about but has not been joined is represented by a [RemoteSystemSessionInfo](RemoteSystemSessionInfo.md) object.
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessioninfo
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemSessionInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteSystemSessionInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteSystemSessionInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the public-facing name for the remote session, given by the controller of the session.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessioninfo.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Gets the machine name of the device that is the controller of the remote session.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessioninfo.controllerdisplayname
     * @type {HSTRING} 
     */
    ControllerDisplayName {
        get => this.get_ControllerDisplayName()
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
    get_DisplayName() {
        if (!this.HasProp("__IRemoteSystemSessionInfo")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionInfo := IRemoteSystemSessionInfo(outPtr)
        }

        return this.__IRemoteSystemSessionInfo.get_DisplayName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ControllerDisplayName() {
        if (!this.HasProp("__IRemoteSystemSessionInfo")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionInfo := IRemoteSystemSessionInfo(outPtr)
        }

        return this.__IRemoteSystemSessionInfo.get_ControllerDisplayName()
    }

    /**
     * Issues a request from the calling device to join the given remote session.
     * @returns {IAsyncOperation<RemoteSystemSessionJoinResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessioninfo.joinasync
     */
    JoinAsync() {
        if (!this.HasProp("__IRemoteSystemSessionInfo")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionInfo := IRemoteSystemSessionInfo(outPtr)
        }

        return this.__IRemoteSystemSessionInfo.JoinAsync()
    }

;@endregion Instance Methods
}
