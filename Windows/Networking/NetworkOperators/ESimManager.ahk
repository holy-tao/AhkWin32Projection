#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IESimManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * A class that you can use to construct an [ESimWatcher](esimwatcher.md), and to obtain service information.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * >
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimmanager
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class ESimManager extends IInspectable {
;@region Static Properties
    /**
     * Gets service information for the eSIM manager object.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimmanager.serviceinfo
     * @type {ESimServiceInfo} 
     */
    static ServiceInfo {
        get => ESimManager.get_ServiceInfo()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {ESimServiceInfo} 
     */
    static get_ServiceInfo() {
        if (!ESimManager.HasProp("__IESimManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.ESimManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IESimManagerStatics.IID)
            ESimManager.__IESimManagerStatics := IESimManagerStatics(factoryPtr)
        }

        return ESimManager.__IESimManagerStatics.get_ServiceInfo()
    }

    /**
     * Attempts to create a new instance of the [ESimWatcher](esimwatcher.md) class.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @returns {ESimWatcher} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimmanager.trycreateesimwatcher
     */
    static TryCreateESimWatcher() {
        if (!ESimManager.HasProp("__IESimManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.ESimManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IESimManagerStatics.IID)
            ESimManager.__IESimManagerStatics := IESimManagerStatics(factoryPtr)
        }

        return ESimManager.__IESimManagerStatics.TryCreateESimWatcher()
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_ServiceInfoChanged(handler) {
        if (!ESimManager.HasProp("__IESimManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.ESimManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IESimManagerStatics.IID)
            ESimManager.__IESimManagerStatics := IESimManagerStatics(factoryPtr)
        }

        return ESimManager.__IESimManagerStatics.add_ServiceInfoChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_ServiceInfoChanged(token) {
        if (!ESimManager.HasProp("__IESimManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.ESimManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IESimManagerStatics.IID)
            ESimManager.__IESimManagerStatics := IESimManagerStatics(factoryPtr)
        }

        return ESimManager.__IESimManagerStatics.remove_ServiceInfoChanged(token)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
