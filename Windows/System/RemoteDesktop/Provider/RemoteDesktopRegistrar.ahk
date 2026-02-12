#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteDesktopRegistrarStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides methods for querying the status of the remote desktop features enabled by the **Windows.System.RemoteDesktop.Provider** APIs.
  * 
  * > [!IMPORTANT]
  * > The **RemoteDesktopRegistrar** API is part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotedesktop.provider.remotedesktopregistrar
 * @namespace Windows.System.RemoteDesktop.Provider
 * @version WindowsRuntime 1.4
 */
class RemoteDesktopRegistrar extends IInspectable {
;@region Static Properties
    /**
     * Gets the list of [RemoteDesktopInfo](/uwp/api/windows.system.remotedesktop.provider.remotedesktopinfo) objects representing the currently enabled remote desktop connections.
     * @remarks
     * When the URI `ms-remotedesktop:setup` is invoked, remote desktop client apps should call **Append** on the **DesktopInfos** collection to register Windows 365 Cloud PCs to the Windows shell.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotedesktop.provider.remotedesktopregistrar.desktopinfos
     * @type {IVector<RemoteDesktopInfo>} 
     */
    static DesktopInfos {
        get => RemoteDesktopRegistrar.get_DesktopInfos()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {IVector<RemoteDesktopInfo>} 
     */
    static get_DesktopInfos() {
        if (!RemoteDesktopRegistrar.HasProp("__IRemoteDesktopRegistrarStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteDesktop.Provider.RemoteDesktopRegistrar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteDesktopRegistrarStatics.IID)
            RemoteDesktopRegistrar.__IRemoteDesktopRegistrarStatics := IRemoteDesktopRegistrarStatics(factoryPtr)
        }

        return RemoteDesktopRegistrar.__IRemoteDesktopRegistrarStatics.get_DesktopInfos()
    }

    /**
     * Gets a value indicating whether switching to the local session is enabled on the current device.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotedesktop.provider.remotedesktopregistrar.isswitchtolocalsessionenabled
     */
    static IsSwitchToLocalSessionEnabled() {
        if (!RemoteDesktopRegistrar.HasProp("__IRemoteDesktopRegistrarStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteDesktop.Provider.RemoteDesktopRegistrar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteDesktopRegistrarStatics.IID)
            RemoteDesktopRegistrar.__IRemoteDesktopRegistrarStatics := IRemoteDesktopRegistrarStatics(factoryPtr)
        }

        return RemoteDesktopRegistrar.__IRemoteDesktopRegistrarStatics.IsSwitchToLocalSessionEnabled()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
