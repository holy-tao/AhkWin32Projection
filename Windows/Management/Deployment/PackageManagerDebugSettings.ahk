#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPackageManagerDebugSettings.ahk
#Include ..\..\..\Guid.ahk

/**
 * Settings for debugging app [Packages](/uwp/api/windows.applicationmodel.package).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanagerdebugsettings
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class PackageManagerDebugSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPackageManagerDebugSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPackageManagerDebugSettings.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Sets the staging state of a content group for debugging.
     * @remarks
     * The state of the required content group (which is specified by PackageContentGroup.RequiredGroupName) cannot be changed. The method will fail if this group is specified.
     * @param {Package} package_ The app [Package](/uwp/api/windows.applicationmodel.package).
     * @param {HSTRING} contentGroupName The content group name. An AppxContentGroupMap.xml must be present when the app is registered for this API to work.
     * @param {Integer} state The [PackageContentGroupState](../Windows.ApplicationModel/PackageContentGroupState.md) enum value.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanagerdebugsettings.setcontentgroupstateasync
     */
    SetContentGroupStateAsync(package_, contentGroupName, state) {
        if (!this.HasProp("__IPackageManagerDebugSettings")) {
            if ((queryResult := this.QueryInterface(IPackageManagerDebugSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManagerDebugSettings := IPackageManagerDebugSettings(outPtr)
        }

        return this.__IPackageManagerDebugSettings.SetContentGroupStateAsync(package_, contentGroupName, state)
    }

    /**
     * Sets the staging state of a content group for debugging.
     * @param {Package} package_ The app [Package](/uwp/api/windows.applicationmodel.package).
     * @param {HSTRING} contentGroupName The content group name. An AppxContentGroupMap.xml must be present when the app is registered for this API to work.
     * @param {Integer} state The [PackageContentGroupState](../Windows.ApplicationModel/PackageContentGroupState.md) enum value.
     * @param {Float} completionPercentage 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagemanagerdebugsettings.setcontentgroupstateasync
     */
    SetContentGroupStateWithPercentageAsync(package_, contentGroupName, state, completionPercentage) {
        if (!this.HasProp("__IPackageManagerDebugSettings")) {
            if ((queryResult := this.QueryInterface(IPackageManagerDebugSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageManagerDebugSettings := IPackageManagerDebugSettings(outPtr)
        }

        return this.__IPackageManagerDebugSettings.SetContentGroupStateWithPercentageAsync(package_, contentGroupName, state, completionPercentage)
    }

;@endregion Instance Methods
}
