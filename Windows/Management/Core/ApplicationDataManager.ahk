#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IApplicationDataManager.ahk
#Include .\IApplicationDataManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Enables you to access and manage the app data store for a package family.
  * 
  * This class is intended to be used by development tools and utilities. It can't be used in a process running in an app container.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.core.applicationdatamanager
 * @namespace Windows.Management.Core
 * @version WindowsRuntime 1.4
 */
class ApplicationDataManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IApplicationDataManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IApplicationDataManager.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Provides access to the app data store for the specified package family.
     * @param {HSTRING} packageFamilyName The package family name.
     * @returns {ApplicationData} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.core.applicationdatamanager.createforpackagefamily
     */
    static CreateForPackageFamily(packageFamilyName) {
        if (!ApplicationDataManager.HasProp("__IApplicationDataManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Management.Core.ApplicationDataManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IApplicationDataManagerStatics.IID)
            ApplicationDataManager.__IApplicationDataManagerStatics := IApplicationDataManagerStatics(factoryPtr)
        }

        return ApplicationDataManager.__IApplicationDataManagerStatics.CreateForPackageFamily(packageFamilyName)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
