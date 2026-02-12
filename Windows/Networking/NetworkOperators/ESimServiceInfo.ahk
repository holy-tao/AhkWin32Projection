#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IESimServiceInfo.ahk
#Include ..\..\..\Guid.ahk

/**
 * A class that represents service information for an eSIM.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * >
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimserviceinfo
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class ESimServiceInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IESimServiceInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IESimServiceInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value indicating the condition under which the user should be challenged for eSIM authentication credentials.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimserviceinfo.authenticationpreference
     * @type {Integer} 
     */
    AuthenticationPreference {
        get => this.get_AuthenticationPreference()
    }

    /**
     * Gets a value indicating whether the policy for the eSIM calls for the eSIM to be shown on the Local User Interface (LUI) for eSIM management.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimserviceinfo.isesimuienabled
     * @type {Boolean} 
     */
    IsESimUiEnabled {
        get => this.get_IsESimUiEnabled()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AuthenticationPreference() {
        if (!this.HasProp("__IESimServiceInfo")) {
            if ((queryResult := this.QueryInterface(IESimServiceInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimServiceInfo := IESimServiceInfo(outPtr)
        }

        return this.__IESimServiceInfo.get_AuthenticationPreference()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsESimUiEnabled() {
        if (!this.HasProp("__IESimServiceInfo")) {
            if ((queryResult := this.QueryInterface(IESimServiceInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimServiceInfo := IESimServiceInfo(outPtr)
        }

        return this.__IESimServiceInfo.get_IsESimUiEnabled()
    }

;@endregion Instance Methods
}
