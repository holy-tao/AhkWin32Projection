#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppExtensionPackageUpdatingEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information for the [AppExtensionCatalog.PackageUpdating](appextensioncatalog_packageupdating.md) event.
 * @remarks
 * Instances of this class are created by the system and passed as event arguments to your handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appextensions.appextensionpackageupdatingeventargs
 * @namespace Windows.ApplicationModel.AppExtensions
 * @version WindowsRuntime 1.4
 */
class AppExtensionPackageUpdatingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppExtensionPackageUpdatingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppExtensionPackageUpdatingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the name of the app extension that is being updated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appextensions.appextensionpackageupdatingeventargs.appextensionname
     * @type {HSTRING} 
     */
    AppExtensionName {
        get => this.get_AppExtensionName()
    }

    /**
     * Provides the package containing the extension that is updating.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appextensions.appextensionpackageupdatingeventargs.package
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
        if (!this.HasProp("__IAppExtensionPackageUpdatingEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppExtensionPackageUpdatingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppExtensionPackageUpdatingEventArgs := IAppExtensionPackageUpdatingEventArgs(outPtr)
        }

        return this.__IAppExtensionPackageUpdatingEventArgs.get_AppExtensionName()
    }

    /**
     * 
     * @returns {Package} 
     */
    get_Package() {
        if (!this.HasProp("__IAppExtensionPackageUpdatingEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppExtensionPackageUpdatingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppExtensionPackageUpdatingEventArgs := IAppExtensionPackageUpdatingEventArgs(outPtr)
        }

        return this.__IAppExtensionPackageUpdatingEventArgs.get_Package()
    }

;@endregion Instance Methods
}
