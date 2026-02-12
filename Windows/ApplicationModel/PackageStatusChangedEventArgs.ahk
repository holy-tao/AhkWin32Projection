#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPackageStatusChangedEventArgs.ahk
#Include ..\..\Guid.ahk

/**
 * Provides access to the package that has changed.
 * @remarks
 * This object is passed to the app's package status changed event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagestatuschangedeventargs
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class PackageStatusChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPackageStatusChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPackageStatusChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The package that has changed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagestatuschangedeventargs.package
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
     * @returns {Package} 
     */
    get_Package() {
        if (!this.HasProp("__IPackageStatusChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageStatusChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageStatusChangedEventArgs := IPackageStatusChangedEventArgs(outPtr)
        }

        return this.__IPackageStatusChangedEventArgs.get_Package()
    }

;@endregion Instance Methods
}
