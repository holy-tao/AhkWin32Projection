#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPackageUserInformation.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about the users of an installed [Package](/uwp/api/windows.applicationmodel.package).
 * @remarks
 * To enumerate the users who have installed a package, use the [PackageManager.FindUsers](packagemanager_findusers_1161384994.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packageuserinformation
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class PackageUserInformation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPackageUserInformation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPackageUserInformation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the security identifier (SID) of the [Package](/uwp/api/windows.applicationmodel.package) user.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packageuserinformation.usersecurityid
     * @type {HSTRING} 
     */
    UserSecurityId {
        get => this.get_UserSecurityId()
    }

    /**
     * Gets the install state of the [Package](/uwp/api/windows.applicationmodel.package) for the user.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packageuserinformation.installstate
     * @type {Integer} 
     */
    InstallState {
        get => this.get_InstallState()
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
    get_UserSecurityId() {
        if (!this.HasProp("__IPackageUserInformation")) {
            if ((queryResult := this.QueryInterface(IPackageUserInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageUserInformation := IPackageUserInformation(outPtr)
        }

        return this.__IPackageUserInformation.get_UserSecurityId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InstallState() {
        if (!this.HasProp("__IPackageUserInformation")) {
            if ((queryResult := this.QueryInterface(IPackageUserInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageUserInformation := IPackageUserInformation(outPtr)
        }

        return this.__IPackageUserInformation.get_InstallState()
    }

;@endregion Instance Methods
}
