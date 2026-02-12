#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPackageExtensionPackageStatusChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information for the [PackageExtensionCatalog.PackageStatusChanged](packageextensioncatalog_packagestatuschanged.md) event.
 * @remarks
 * Instances of this class are created by the system and passed as event arguments to your handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageextensions.packageextensionpackagestatuschangedeventargs
 * @namespace Windows.ApplicationModel.PackageExtensions
 * @version WindowsRuntime 1.4
 */
class PackageExtensionPackageStatusChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPackageExtensionPackageStatusChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPackageExtensionPackageStatusChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the name of the package extension that has been updated or uninstalled.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageextensions.packageextensionpackagestatuschangedeventargs.packageextensionname
     * @type {HSTRING} 
     */
    PackageExtensionName {
        get => this.get_PackageExtensionName()
    }

    /**
     * Gets the package containing the extension that is being updated or uninstalled.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageextensions.packageextensionpackagestatuschangedeventargs.package
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
    get_PackageExtensionName() {
        if (!this.HasProp("__IPackageExtensionPackageStatusChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageExtensionPackageStatusChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageExtensionPackageStatusChangedEventArgs := IPackageExtensionPackageStatusChangedEventArgs(outPtr)
        }

        return this.__IPackageExtensionPackageStatusChangedEventArgs.get_PackageExtensionName()
    }

    /**
     * 
     * @returns {Package} 
     */
    get_Package() {
        if (!this.HasProp("__IPackageExtensionPackageStatusChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageExtensionPackageStatusChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageExtensionPackageStatusChangedEventArgs := IPackageExtensionPackageStatusChangedEventArgs(outPtr)
        }

        return this.__IPackageExtensionPackageStatusChangedEventArgs.get_Package()
    }

;@endregion Instance Methods
}
