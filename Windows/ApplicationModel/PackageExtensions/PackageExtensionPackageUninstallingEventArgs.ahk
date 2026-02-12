#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPackageExtensionPackageUninstallingEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information for the [PackageExtensionCatalog.PackageUninstalling](packageextensioncatalog_packageuninstalling.md) event.
 * @remarks
 * Instances of this class are created by the system and passed as event arguments to your handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageextensions.packageextensionpackageuninstallingeventargs
 * @namespace Windows.ApplicationModel.PackageExtensions
 * @version WindowsRuntime 1.4
 */
class PackageExtensionPackageUninstallingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPackageExtensionPackageUninstallingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPackageExtensionPackageUninstallingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the name of the package extension that is uninstalling.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageextensions.packageextensionpackageuninstallingeventargs.packageextensionname
     * @type {HSTRING} 
     */
    PackageExtensionName {
        get => this.get_PackageExtensionName()
    }

    /**
     * Gets the package extension package that is uninstalling.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageextensions.packageextensionpackageuninstallingeventargs.package
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
        if (!this.HasProp("__IPackageExtensionPackageUninstallingEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageExtensionPackageUninstallingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageExtensionPackageUninstallingEventArgs := IPackageExtensionPackageUninstallingEventArgs(outPtr)
        }

        return this.__IPackageExtensionPackageUninstallingEventArgs.get_PackageExtensionName()
    }

    /**
     * 
     * @returns {Package} 
     */
    get_Package() {
        if (!this.HasProp("__IPackageExtensionPackageUninstallingEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageExtensionPackageUninstallingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageExtensionPackageUninstallingEventArgs := IPackageExtensionPackageUninstallingEventArgs(outPtr)
        }

        return this.__IPackageExtensionPackageUninstallingEventArgs.get_Package()
    }

;@endregion Instance Methods
}
