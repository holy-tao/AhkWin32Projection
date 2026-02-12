#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICortanaPermissionsManager.ahk
#Include .\ICortanaPermissionsManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to the users Cortana authorization settings.
 * @remarks
 * This is a static class, you do not need to get a CortanaPermissionsManager object to access its members.
 * 
 * The CortanaPermissionManager class requires the following be added to the Package.appmanifest:
 * 
 * - To \<Package\>
 *   - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
 *   - `IgnorableNamespaces="rescap"`
 * - Under \<Capabilities\>
 *   - `<rescap:capability name="cortanaPermissions"/>`
 * @see https://learn.microsoft.com/uwp/api/windows.services.cortana.cortanapermissionsmanager
 * @namespace Windows.Services.Cortana
 * @version WindowsRuntime 1.4
 */
class CortanaPermissionsManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICortanaPermissionsManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICortanaPermissionsManager.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves the Cortana permissions for the current user.
     * @remarks
     * The [CortanaPermissionManager](cortanapermissionsmanager.md) class requires the following be added to the Package.appmanifest:
     * 
     * - To \<Package\>
     *   - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
     *   - `IgnorableNamespaces="rescap"`
     * - Under \<Capabilities\>
     *   - `<rescap:capability name="cortanaPermissions"/>`
     * @returns {CortanaPermissionsManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.cortana.cortanapermissionsmanager.getdefault
     */
    static GetDefault() {
        if (!CortanaPermissionsManager.HasProp("__ICortanaPermissionsManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Cortana.CortanaPermissionsManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICortanaPermissionsManagerStatics.IID)
            CortanaPermissionsManager.__ICortanaPermissionsManagerStatics := ICortanaPermissionsManagerStatics(factoryPtr)
        }

        return CortanaPermissionsManager.__ICortanaPermissionsManagerStatics.GetDefault()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Retrieves whether Cortana is supported.
     * @remarks
     * The [CortanaPermissionManager](cortanapermissionsmanager.md) class requires the following be added to the Package.appmanifest:
     * 
     * - To \<Package\>
     *   - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
     *   - `IgnorableNamespaces="rescap"`
     * - Under \<Capabilities\>
     *   - `<rescap:capability name="cortanaPermissions"/>`
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.cortana.cortanapermissionsmanager.issupported
     */
    IsSupported() {
        if (!this.HasProp("__ICortanaPermissionsManager")) {
            if ((queryResult := this.QueryInterface(ICortanaPermissionsManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICortanaPermissionsManager := ICortanaPermissionsManager(outPtr)
        }

        return this.__ICortanaPermissionsManager.IsSupported()
    }

    /**
     * Asynchronously retreives whether the specified permissions are granted.
     * @remarks
     * The [CortanaPermissionManager](cortanapermissionsmanager.md) class requires the following be added to the Package.appmanifest:
     * 
     * - To \<Package\>
     *   - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
     *   - `IgnorableNamespaces="rescap"`
     * - Under \<Capabilities\>
     *   - `<rescap:capability name="cortanaPermissions"/>`
     * @param {IIterable<Integer>} permissions The collection of [permissions](cortanapermission.md) of interest.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.cortana.cortanapermissionsmanager.arepermissionsgrantedasync
     */
    ArePermissionsGrantedAsync(permissions) {
        if (!this.HasProp("__ICortanaPermissionsManager")) {
            if ((queryResult := this.QueryInterface(ICortanaPermissionsManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICortanaPermissionsManager := ICortanaPermissionsManager(outPtr)
        }

        return this.__ICortanaPermissionsManager.ArePermissionsGrantedAsync(permissions)
    }

    /**
     * Asynchronously grants the specified set of Cortana permissions.
     * @remarks
     * The [CortanaPermissionManager](cortanapermissionsmanager.md) class requires the following be added to the Package.appmanifest:
     * 
     * - To \<Package\>
     *   - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
     *   - `IgnorableNamespaces="rescap"`
     * - Under \<Capabilities\>
     *   - `<rescap:capability name="cortanaPermissions"/>`
     * @param {IIterable<Integer>} permissions The collection of [permissions](cortanapermission.md) to grant.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.cortana.cortanapermissionsmanager.grantpermissionsasync
     */
    GrantPermissionsAsync(permissions) {
        if (!this.HasProp("__ICortanaPermissionsManager")) {
            if ((queryResult := this.QueryInterface(ICortanaPermissionsManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICortanaPermissionsManager := ICortanaPermissionsManager(outPtr)
        }

        return this.__ICortanaPermissionsManager.GrantPermissionsAsync(permissions)
    }

    /**
     * Asynchronously revokes the specified set of Cortana permissions.
     * @remarks
     * The [CortanaPermissionManager](cortanapermissionsmanager.md) class requires the following be added to the Package.appmanifest:
     * 
     * - To \<Package\>
     *   - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
     *   - `IgnorableNamespaces="rescap"`
     * - Under \<Capabilities\>
     *   - `<rescap:capability name="cortanaPermissions"/>`
     * @param {IIterable<Integer>} permissions The collection of [permissions](cortanapermission.md) to revoke.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.cortana.cortanapermissionsmanager.revokepermissionsasync
     */
    RevokePermissionsAsync(permissions) {
        if (!this.HasProp("__ICortanaPermissionsManager")) {
            if ((queryResult := this.QueryInterface(ICortanaPermissionsManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICortanaPermissionsManager := ICortanaPermissionsManager(outPtr)
        }

        return this.__ICortanaPermissionsManager.RevokePermissionsAsync(permissions)
    }

;@endregion Instance Methods
}
