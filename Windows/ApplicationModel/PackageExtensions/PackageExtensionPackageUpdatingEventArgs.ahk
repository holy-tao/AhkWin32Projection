#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPackageExtensionPackageUpdatingEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information for the [PackageExtensionCatalog.PackageUpdating](packageextensioncatalog_packageupdating.md) event.
 * @remarks
 * Instances of this class are created by the system and passed as event arguments to your handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageextensions.packageextensionpackageupdatingeventargs
 * @namespace Windows.ApplicationModel.PackageExtensions
 * @version WindowsRuntime 1.4
 */
class PackageExtensionPackageUpdatingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPackageExtensionPackageUpdatingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPackageExtensionPackageUpdatingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the name of the package extension that is being updated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageextensions.packageextensionpackageupdatingeventargs.packageextensionname
     * @type {HSTRING} 
     */
    PackageExtensionName {
        get => this.get_PackageExtensionName()
    }

    /**
     * Provides the package containing the extension that is updating.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageextensions.packageextensionpackageupdatingeventargs.package
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
        if (!this.HasProp("__IPackageExtensionPackageUpdatingEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageExtensionPackageUpdatingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageExtensionPackageUpdatingEventArgs := IPackageExtensionPackageUpdatingEventArgs(outPtr)
        }

        return this.__IPackageExtensionPackageUpdatingEventArgs.get_PackageExtensionName()
    }

    /**
     * 
     * @returns {Package} 
     */
    get_Package() {
        if (!this.HasProp("__IPackageExtensionPackageUpdatingEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageExtensionPackageUpdatingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageExtensionPackageUpdatingEventArgs := IPackageExtensionPackageUpdatingEventArgs(outPtr)
        }

        return this.__IPackageExtensionPackageUpdatingEventArgs.get_Package()
    }

;@endregion Instance Methods
}
