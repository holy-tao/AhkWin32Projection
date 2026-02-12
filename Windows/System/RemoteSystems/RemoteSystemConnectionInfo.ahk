#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteSystemConnectionInfo.ahk
#Include .\IRemoteSystemConnectionInfoStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about a connection to a remote system. For example, the type of connection.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemconnectioninfo
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemConnectionInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteSystemConnectionInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteSystemConnectionInfo.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of this class corresponding to the given app service connection.
     * @param {AppServiceConnection} connection_ The AppServiceConnection instance for which the underlying remote system connection's information should be obtained.
     * @returns {RemoteSystemConnectionInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemconnectioninfo.trycreatefromappserviceconnection
     */
    static TryCreateFromAppServiceConnection(connection_) {
        if (!RemoteSystemConnectionInfo.HasProp("__IRemoteSystemConnectionInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteSystems.RemoteSystemConnectionInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteSystemConnectionInfoStatics.IID)
            RemoteSystemConnectionInfo.__IRemoteSystemConnectionInfoStatics := IRemoteSystemConnectionInfoStatics(factoryPtr)
        }

        return RemoteSystemConnectionInfo.__IRemoteSystemConnectionInfoStatics.TryCreateFromAppServiceConnection(connection_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets whether the associated remote system connection is a proximal connection or not.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemconnectioninfo.isproximal
     * @type {Boolean} 
     */
    IsProximal {
        get => this.get_IsProximal()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsProximal() {
        if (!this.HasProp("__IRemoteSystemConnectionInfo")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemConnectionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemConnectionInfo := IRemoteSystemConnectionInfo(outPtr)
        }

        return this.__IRemoteSystemConnectionInfo.get_IsProximal()
    }

;@endregion Instance Methods
}
