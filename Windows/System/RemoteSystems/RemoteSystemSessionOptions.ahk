#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteSystemSessionOptions.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains additional options that a [RemoteSystemSessionController](RemoteSystemSessionController.md) instance can specify when attempting to create a remote session.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionoptions
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemSessionOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteSystemSessionOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteSystemSessionOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Indicates whether or not the session described by this [RemoteSystemSessionOptions](RemoteSystemSessionOptions.md) instance should be discoverable by invite only.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionoptions.isinviteonly
     * @type {Boolean} 
     */
    IsInviteOnly {
        get => this.get_IsInviteOnly()
        set => this.put_IsInviteOnly(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes an instance of the [RemoteSystemSessionOptions](RemoteSystemSessionOptions.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteSystems.RemoteSystemSessionOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInviteOnly() {
        if (!this.HasProp("__IRemoteSystemSessionOptions")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionOptions := IRemoteSystemSessionOptions(outPtr)
        }

        return this.__IRemoteSystemSessionOptions.get_IsInviteOnly()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsInviteOnly(value) {
        if (!this.HasProp("__IRemoteSystemSessionOptions")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionOptions := IRemoteSystemSessionOptions(outPtr)
        }

        return this.__IRemoteSystemSessionOptions.put_IsInviteOnly(value)
    }

;@endregion Instance Methods
}
