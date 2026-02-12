#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPackageUpdateAvailabilityResult.ahk
#Include ..\..\Guid.ahk

/**
 * Describes whether the main app package listed in the .appinstaller file requires updates.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageupdateavailabilityresult
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class PackageUpdateAvailabilityResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPackageUpdateAvailabilityResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPackageUpdateAvailabilityResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Describes the type of package update that's available.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageupdateavailabilityresult.availability
     * @type {Integer} 
     */
    Availability {
        get => this.get_Availability()
    }

    /**
     * If there is a problem checking for an update via [Package.CheckUpdateAvailabilityAsync](package_checkupdateavailabilityasync_726867427.md), this error can provide details.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageupdateavailabilityresult.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
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
    get_Availability() {
        if (!this.HasProp("__IPackageUpdateAvailabilityResult")) {
            if ((queryResult := this.QueryInterface(IPackageUpdateAvailabilityResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageUpdateAvailabilityResult := IPackageUpdateAvailabilityResult(outPtr)
        }

        return this.__IPackageUpdateAvailabilityResult.get_Availability()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IPackageUpdateAvailabilityResult")) {
            if ((queryResult := this.QueryInterface(IPackageUpdateAvailabilityResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageUpdateAvailabilityResult := IPackageUpdateAvailabilityResult(outPtr)
        }

        return this.__IPackageUpdateAvailabilityResult.get_ExtendedError()
    }

;@endregion Instance Methods
}
