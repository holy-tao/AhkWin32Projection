#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFindSharedPackageContainerOptions.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides options for creating a shared package container with a call to  [SharedPackageContainerManager.FindContainer](sharedpackagecontainermanager_findcontainers_1148802511.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.findsharedpackagecontaineroptions
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class FindSharedPackageContainerOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFindSharedPackageContainerOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFindSharedPackageContainerOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the name of the shared package container to find.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.findsharedpackagecontaineroptions.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * Gets or sets the package family name used by the find operation. Containers including the specified package family name are included in the find results.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.findsharedpackagecontaineroptions.packagefamilyname
     * @type {HSTRING} 
     */
    PackageFamilyName {
        get => this.get_PackageFamilyName()
        set => this.put_PackageFamilyName(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [FindSharedPackageContainerOptions](findsharedpackagecontaineroptions.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Management.Deployment.FindSharedPackageContainerOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IFindSharedPackageContainerOptions")) {
            if ((queryResult := this.QueryInterface(IFindSharedPackageContainerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFindSharedPackageContainerOptions := IFindSharedPackageContainerOptions(outPtr)
        }

        return this.__IFindSharedPackageContainerOptions.get_Name()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Name(value) {
        if (!this.HasProp("__IFindSharedPackageContainerOptions")) {
            if ((queryResult := this.QueryInterface(IFindSharedPackageContainerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFindSharedPackageContainerOptions := IFindSharedPackageContainerOptions(outPtr)
        }

        return this.__IFindSharedPackageContainerOptions.put_Name(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PackageFamilyName() {
        if (!this.HasProp("__IFindSharedPackageContainerOptions")) {
            if ((queryResult := this.QueryInterface(IFindSharedPackageContainerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFindSharedPackageContainerOptions := IFindSharedPackageContainerOptions(outPtr)
        }

        return this.__IFindSharedPackageContainerOptions.get_PackageFamilyName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PackageFamilyName(value) {
        if (!this.HasProp("__IFindSharedPackageContainerOptions")) {
            if ((queryResult := this.QueryInterface(IFindSharedPackageContainerOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFindSharedPackageContainerOptions := IFindSharedPackageContainerOptions(outPtr)
        }

        return this.__IFindSharedPackageContainerOptions.put_PackageFamilyName(value)
    }

;@endregion Instance Methods
}
