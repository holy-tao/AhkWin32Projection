#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteDesktopInfo.ahk
#Include .\IRemoteDesktopInfoFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a remote desktop.
  * 
  * > [!IMPORTANT]
  * > The **RemoteDesktopInfo** API is part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotedesktop.provider.remotedesktopinfo
 * @namespace Windows.System.RemoteDesktop.Provider
 * @version WindowsRuntime 1.4
 */
class RemoteDesktopInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteDesktopInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteDesktopInfo.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of [RemoteDesktopInfo](/uwp/api/windows.system.remotedesktop.provider.remotedesktopinfo) with the supplied ID and display name.
     * @param {HSTRING} id The ID of the remote desktop.
     * @param {HSTRING} displayName The display name of the remote desktop.
     * @returns {RemoteDesktopInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotedesktop.provider.remotedesktopinfo.#ctor
     */
    static CreateInstance(id, displayName) {
        if (!RemoteDesktopInfo.HasProp("__IRemoteDesktopInfoFactory")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteDesktop.Provider.RemoteDesktopInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteDesktopInfoFactory.IID)
            RemoteDesktopInfo.__IRemoteDesktopInfoFactory := IRemoteDesktopInfoFactory(factoryPtr)
        }

        return RemoteDesktopInfo.__IRemoteDesktopInfoFactory.CreateInstance(id, displayName)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the display name of the remote desktop.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotedesktop.provider.remotedesktopinfo.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Gets the ID of the remote desktop.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotedesktop.provider.remotedesktopinfo.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
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
        if (!this.HasProp("__IRemoteDesktopInfo")) {
            if ((queryResult := this.QueryInterface(IRemoteDesktopInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteDesktopInfo := IRemoteDesktopInfo(outPtr)
        }

        return this.__IRemoteDesktopInfo.get_DisplayName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IRemoteDesktopInfo")) {
            if ((queryResult := this.QueryInterface(IRemoteDesktopInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteDesktopInfo := IRemoteDesktopInfo(outPtr)
        }

        return this.__IRemoteDesktopInfo.get_Id()
    }

;@endregion Instance Methods
}
