#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteDesktopConnectionInfo.ahk
#Include .\IRemoteDesktopConnectionInfo2.ahk
#Include .\IRemoteDesktopConnectionInfoStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a remote desktop connection on the local desktop.
  * 
  * > [!IMPORTANT]
  * > The **RemoteDesktopConnectionInfo** API is part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
 * @remarks
 * Get an instance of this class by calling [GetForLaunchUri](/uwp/api/windows.system.remotedesktop.provider.remotedesktopconnectioninfo.getforlaunchuri)).
 * 
 * For the remote desktop connections to CloudPCs that are launched from Task view, users can configure which redirections they allow in Windows Settings under the **Privacy and security > CloudPC** tab. Applications using this API may want to read the following registry keys to honor the Cloud PC configuration set by the user in Settings: 
 * 
 * |Feature | Registry Key |
 * |--------|--------------|
 * | Clipboard | HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\CloudPCSetting\AllowClipboardRedirection |
 * | Printer |  HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\CloudPCSetting\AllowPrinterRedirection |
 * | Local Hard Drive | HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\CloudPCSetting\AllowLocalHardDriveRedirection |
 * | Microphone | HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\CloudPCSetting\AllowMicrophoneRedirection |
 * | Location | HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\CloudPCSetting\AllowLocationRedirection |
 * | Camera | HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\CloudPCSetting\AllowCameraRedirection |
 * | Smart Card | HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\CloudPCSetting\AllowSmartCardRedirection |
 * | USB ports | HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\CloudPCSetting\AllowUSBPortsRedirection |
 * | COM ports | HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\CloudPCSetting\AllowCOMPortsRedirection |
 * 
 * The value for each key is a REG_DWORD and is interpreted using the following semantics:
 * 
 * - Off value: 0
 * - On value: 1
 * - No value (default): 1
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotedesktop.provider.remotedesktopconnectioninfo
 * @namespace Windows.System.RemoteDesktop.Provider
 * @version WindowsRuntime 1.4
 */
class RemoteDesktopConnectionInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteDesktopConnectionInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteDesktopConnectionInfo.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves a [RemoteDesktopConnectionInfo](/uwp/api/windows.system.remotedesktop.provider.remotedesktopconnectioninfo) associated with a remote desktop connection and registers a window with the OS to represent the remote desktop.
     * @remarks
     * This call is made by the remote desktop client app running on the local desktop. 
     * 
     * The provider app completes the launch handshake by passing the launch protocol string to **GetForLaunchUri**.
     * @param {Uri} launchUri The launch URI used by the shell to launch the remote desktop client app, with information about the remote desktop session.
     * @param {WindowId} windowId_ The [WindowId](/windows/windows-app-sdk/api/winrt/microsoft.ui.windowid) of the window that will represent the remote desktop.
     * @returns {RemoteDesktopConnectionInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotedesktop.provider.remotedesktopconnectioninfo.getforlaunchuri
     */
    static GetForLaunchUri(launchUri, windowId_) {
        if (!RemoteDesktopConnectionInfo.HasProp("__IRemoteDesktopConnectionInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteDesktop.Provider.RemoteDesktopConnectionInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteDesktopConnectionInfoStatics.IID)
            RemoteDesktopConnectionInfo.__IRemoteDesktopConnectionInfoStatics := IRemoteDesktopConnectionInfoStatics(factoryPtr)
        }

        return RemoteDesktopConnectionInfo.__IRemoteDesktopConnectionInfoStatics.GetForLaunchUri(launchUri, windowId_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Sets the connection status for the remote desktop connection associated with the **RemoteDesktopConnectionInfo**.
     * @remarks
     * The OS uses the status value set by the remote desktop provider to notify the user about the current status of the remote desktop connection associated with the **RemoteDesktopConnectionInfo**.
     * @param {Integer} value A member of the [RemoteDesktopConnectionStatus](/uwp/api/windows.system.remotedesktop.provider.remotedesktopconnectionstatus) enumeration specifying the connection status of a remote desktop connection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotedesktop.provider.remotedesktopconnectioninfo.setconnectionstatus
     */
    SetConnectionStatus(value) {
        if (!this.HasProp("__IRemoteDesktopConnectionInfo")) {
            if ((queryResult := this.QueryInterface(IRemoteDesktopConnectionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteDesktopConnectionInfo := IRemoteDesktopConnectionInfo(outPtr)
        }

        return this.__IRemoteDesktopConnectionInfo.SetConnectionStatus(value)
    }

    /**
     * Notifies the OS that the user has requested to switch to the local session.
     * @remarks
     * The remote desktop provider's remote desktop host service informs the remote desktop client app that the user has requested to switch to the local session over a network channel. When that request is received, the remote desktop client app calls **SwitchToLocalSession** to notify the OS of the request.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotedesktop.provider.remotedesktopconnectioninfo.switchtolocalsession
     */
    SwitchToLocalSession() {
        if (!this.HasProp("__IRemoteDesktopConnectionInfo")) {
            if ((queryResult := this.QueryInterface(IRemoteDesktopConnectionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteDesktopConnectionInfo := IRemoteDesktopConnectionInfo(outPtr)
        }

        return this.__IRemoteDesktopConnectionInfo.SwitchToLocalSession()
    }

    /**
     * 
     * @param {Integer} action 
     * @returns {HRESULT} 
     */
    PerformLocalActionFromRemote(action) {
        if (!this.HasProp("__IRemoteDesktopConnectionInfo2")) {
            if ((queryResult := this.QueryInterface(IRemoteDesktopConnectionInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteDesktopConnectionInfo2 := IRemoteDesktopConnectionInfo2(outPtr)
        }

        return this.__IRemoteDesktopConnectionInfo2.PerformLocalActionFromRemote(action)
    }

;@endregion Instance Methods
}
