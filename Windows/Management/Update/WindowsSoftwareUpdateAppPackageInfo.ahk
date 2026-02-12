#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowsSoftwareUpdateAppPackageInfo.ahk
#Include .\IWindowsSoftwareUpdateAppPackageInfoFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsSoftwareUpdateAppPackageInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowsSoftwareUpdateAppPackageInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowsSoftwareUpdateAppPackageInfo.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {HSTRING} packageFamilyName 
     * @param {Integer} packageArchitecture 
     * @param {Uri} installUri 
     * @returns {WindowsSoftwareUpdateAppPackageInfo} 
     */
    static CreateInstance(packageFamilyName, packageArchitecture, installUri) {
        if (!WindowsSoftwareUpdateAppPackageInfo.HasProp("__IWindowsSoftwareUpdateAppPackageInfoFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.WindowsSoftwareUpdateAppPackageInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowsSoftwareUpdateAppPackageInfoFactory.IID)
            WindowsSoftwareUpdateAppPackageInfo.__IWindowsSoftwareUpdateAppPackageInfoFactory := IWindowsSoftwareUpdateAppPackageInfoFactory(factoryPtr)
        }

        return WindowsSoftwareUpdateAppPackageInfo.__IWindowsSoftwareUpdateAppPackageInfoFactory.CreateInstance(packageFamilyName, packageArchitecture, installUri)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * @type {HSTRING} 
     */
    PackageFamilyName {
        get => this.get_PackageFamilyName()
    }

    /**
     * @type {Integer} 
     */
    PackageArchitecture {
        get => this.get_PackageArchitecture()
    }

    /**
     * @type {Uri} 
     */
    InstallUri {
        get => this.get_InstallUri()
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
    get_PackageFamilyName() {
        if (!this.HasProp("__IWindowsSoftwareUpdateAppPackageInfo")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateAppPackageInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateAppPackageInfo := IWindowsSoftwareUpdateAppPackageInfo(outPtr)
        }

        return this.__IWindowsSoftwareUpdateAppPackageInfo.get_PackageFamilyName()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PackageArchitecture() {
        if (!this.HasProp("__IWindowsSoftwareUpdateAppPackageInfo")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateAppPackageInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateAppPackageInfo := IWindowsSoftwareUpdateAppPackageInfo(outPtr)
        }

        return this.__IWindowsSoftwareUpdateAppPackageInfo.get_PackageArchitecture()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_InstallUri() {
        if (!this.HasProp("__IWindowsSoftwareUpdateAppPackageInfo")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateAppPackageInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateAppPackageInfo := IWindowsSoftwareUpdateAppPackageInfo(outPtr)
        }

        return this.__IWindowsSoftwareUpdateAppPackageInfo.get_InstallUri()
    }

;@endregion Instance Methods
}
