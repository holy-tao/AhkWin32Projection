#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKnownSimFilePathsStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Static class that provides known SIM file paths.
 * @remarks
 * Your code does not instantiate this class. The class and all its properties are static.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.knownsimfilepaths
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class KnownSimFilePaths extends IInspectable {
;@region Static Properties
    /**
     * Static property that gets the EFONS path.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.knownsimfilepaths.efons
     * @type {IVectorView<Integer>} 
     */
    static EFOns {
        get => KnownSimFilePaths.get_EFOns()
    }

    /**
     * Static property that gets the EFSPN path.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.knownsimfilepaths.efspn
     * @type {IVectorView<Integer>} 
     */
    static EFSpn {
        get => KnownSimFilePaths.get_EFSpn()
    }

    /**
     * Static property that gets the GID1 path.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.knownsimfilepaths.gid1
     * @type {IVectorView<Integer>} 
     */
    static Gid1 {
        get => KnownSimFilePaths.get_Gid1()
    }

    /**
     * Static property that gets the GID2 path.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.knownsimfilepaths.gid2
     * @type {IVectorView<Integer>} 
     */
    static Gid2 {
        get => KnownSimFilePaths.get_Gid2()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    static get_EFOns() {
        if (!KnownSimFilePaths.HasProp("__IKnownSimFilePathsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.KnownSimFilePaths")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownSimFilePathsStatics.IID)
            KnownSimFilePaths.__IKnownSimFilePathsStatics := IKnownSimFilePathsStatics(factoryPtr)
        }

        return KnownSimFilePaths.__IKnownSimFilePathsStatics.get_EFOns()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    static get_EFSpn() {
        if (!KnownSimFilePaths.HasProp("__IKnownSimFilePathsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.KnownSimFilePaths")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownSimFilePathsStatics.IID)
            KnownSimFilePaths.__IKnownSimFilePathsStatics := IKnownSimFilePathsStatics(factoryPtr)
        }

        return KnownSimFilePaths.__IKnownSimFilePathsStatics.get_EFSpn()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    static get_Gid1() {
        if (!KnownSimFilePaths.HasProp("__IKnownSimFilePathsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.KnownSimFilePaths")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownSimFilePathsStatics.IID)
            KnownSimFilePaths.__IKnownSimFilePathsStatics := IKnownSimFilePathsStatics(factoryPtr)
        }

        return KnownSimFilePaths.__IKnownSimFilePathsStatics.get_Gid1()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    static get_Gid2() {
        if (!KnownSimFilePaths.HasProp("__IKnownSimFilePathsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.KnownSimFilePaths")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownSimFilePathsStatics.IID)
            KnownSimFilePaths.__IKnownSimFilePathsStatics := IKnownSimFilePathsStatics(factoryPtr)
        }

        return KnownSimFilePaths.__IKnownSimFilePathsStatics.get_Gid2()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
