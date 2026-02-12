#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppExtensionPackageStatusChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information for the [AppExtensionCatalog.PackageStatusChanged](appextensioncatalog_packagestatuschanged.md) event.
 * @remarks
 * Instances of this class are created by the system and passed as event arguments to your handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appextensions.appextensionpackagestatuschangedeventargs
 * @namespace Windows.ApplicationModel.AppExtensions
 * @version WindowsRuntime 1.4
 */
class AppExtensionPackageStatusChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppExtensionPackageStatusChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppExtensionPackageStatusChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the name of the app extension that has been updated or uninstalled.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appextensions.appextensionpackagestatuschangedeventargs.appextensionname
     * @type {HSTRING} 
     */
    AppExtensionName {
        get => this.get_AppExtensionName()
    }

    /**
     * Gets the package containing the extension that is being updated or uninstalled.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appextensions.appextensionpackagestatuschangedeventargs.package
     * @type {Package} 
     */
    Package {
        get => this.get_Package()
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
    get_AppExtensionName() {
        if (!this.HasProp("__IAppExtensionPackageStatusChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppExtensionPackageStatusChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppExtensionPackageStatusChangedEventArgs := IAppExtensionPackageStatusChangedEventArgs(outPtr)
        }

        return this.__IAppExtensionPackageStatusChangedEventArgs.get_AppExtensionName()
    }

    /**
     * 
     * @returns {Package} 
     */
    get_Package() {
        if (!this.HasProp("__IAppExtensionPackageStatusChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppExtensionPackageStatusChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppExtensionPackageStatusChangedEventArgs := IAppExtensionPackageStatusChangedEventArgs(outPtr)
        }

        return this.__IAppExtensionPackageStatusChangedEventArgs.get_Package()
    }

;@endregion Instance Methods
}
