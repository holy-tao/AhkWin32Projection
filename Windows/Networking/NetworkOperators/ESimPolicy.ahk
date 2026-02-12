#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IESimPolicy.ahk
#Include ..\..\..\Guid.ahk

/**
 * A class that represents the policy for an eSIM, regarding whether the eSIM should be shown on the Local User Interface (LUI) for eSIM management.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * >
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimpolicy
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class ESimPolicy extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IESimPolicy

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IESimPolicy.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value indicating whether the policy for the eSIM calls for the eSIM to be shown on the Local User Interface (LUI) for eSIM management.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimpolicy.shouldenablemanagingui
     * @type {Boolean} 
     */
    ShouldEnableManagingUi {
        get => this.get_ShouldEnableManagingUi()
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
    get_ShouldEnableManagingUi() {
        if (!this.HasProp("__IESimPolicy")) {
            if ((queryResult := this.QueryInterface(IESimPolicy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimPolicy := IESimPolicy(outPtr)
        }

        return this.__IESimPolicy.get_ShouldEnableManagingUi()
    }

;@endregion Instance Methods
}
