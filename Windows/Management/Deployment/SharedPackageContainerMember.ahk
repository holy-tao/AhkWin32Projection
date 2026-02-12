#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISharedPackageContainerMember.ahk
#Include .\ISharedPackageContainerMemberFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a package family and any associated tuple-data that can be added to a [SharedPackageContainer](sharedpackagecontainer.md)
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.sharedpackagecontainermember
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class SharedPackageContainerMember extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISharedPackageContainerMember

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISharedPackageContainerMember.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new instance of the [SharedPackageContainerMember](sharedpackagecontainermember.md)
     * @param {HSTRING} packageFamilyName The package family name of the package container member.
     * @returns {SharedPackageContainerMember} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.sharedpackagecontainermember.#ctor
     */
    static CreateInstance(packageFamilyName) {
        if (!SharedPackageContainerMember.HasProp("__ISharedPackageContainerMemberFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Deployment.SharedPackageContainerMember")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISharedPackageContainerMemberFactory.IID)
            SharedPackageContainerMember.__ISharedPackageContainerMemberFactory := ISharedPackageContainerMemberFactory(factoryPtr)
        }

        return SharedPackageContainerMember.__ISharedPackageContainerMemberFactory.CreateInstance(packageFamilyName)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the package family name of the package container member.
     * @remarks
     * A single package family can only be added to one shared package container at a time.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.sharedpackagecontainermember.packagefamilyname
     * @type {HSTRING} 
     */
    PackageFamilyName {
        get => this.get_PackageFamilyName()
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
        if (!this.HasProp("__ISharedPackageContainerMember")) {
            if ((queryResult := this.QueryInterface(ISharedPackageContainerMember.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISharedPackageContainerMember := ISharedPackageContainerMember(outPtr)
        }

        return this.__ISharedPackageContainerMember.get_PackageFamilyName()
    }

;@endregion Instance Methods
}
