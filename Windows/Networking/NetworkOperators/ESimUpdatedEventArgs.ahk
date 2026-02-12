#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IESimUpdatedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [ESimWatcher.Updated](esimwatcher_updated.md) event.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * >
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimupdatedeventargs
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class ESimUpdatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IESimUpdatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IESimUpdatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [ESim](esim.md) instance that was updated.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimupdatedeventargs.esim
     * @type {ESim} 
     */
    ESim {
        get => this.get_ESim()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {ESim} 
     */
    get_ESim() {
        if (!this.HasProp("__IESimUpdatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IESimUpdatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimUpdatedEventArgs := IESimUpdatedEventArgs(outPtr)
        }

        return this.__IESimUpdatedEventArgs.get_ESim()
    }

;@endregion Instance Methods
}
