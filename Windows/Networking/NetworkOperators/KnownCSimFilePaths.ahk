#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKnownCSimFilePathsStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Static class that provides well known CSIM file paths.
 * @remarks
 * Your code does not instantiate this class. The class and all its properties are static.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.knowncsimfilepaths
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class KnownCSimFilePaths extends IInspectable {
;@region Static Properties
    /**
     * Static property that gets the EFSPN path.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.knowncsimfilepaths.efspn
     * @type {IVectorView<Integer>} 
     */
    static EFSpn {
        get => KnownCSimFilePaths.get_EFSpn()
    }

    /**
     * Static property that gets the GID1 path.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.knowncsimfilepaths.gid1
     * @type {IVectorView<Integer>} 
     */
    static Gid1 {
        get => KnownCSimFilePaths.get_Gid1()
    }

    /**
     * Static property that gets the GID2 path.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.knowncsimfilepaths.gid2
     * @type {IVectorView<Integer>} 
     */
    static Gid2 {
        get => KnownCSimFilePaths.get_Gid2()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    static get_EFSpn() {
        if (!KnownCSimFilePaths.HasProp("__IKnownCSimFilePathsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.KnownCSimFilePaths")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownCSimFilePathsStatics.IID)
            KnownCSimFilePaths.__IKnownCSimFilePathsStatics := IKnownCSimFilePathsStatics(factoryPtr)
        }

        return KnownCSimFilePaths.__IKnownCSimFilePathsStatics.get_EFSpn()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    static get_Gid1() {
        if (!KnownCSimFilePaths.HasProp("__IKnownCSimFilePathsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.KnownCSimFilePaths")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownCSimFilePathsStatics.IID)
            KnownCSimFilePaths.__IKnownCSimFilePathsStatics := IKnownCSimFilePathsStatics(factoryPtr)
        }

        return KnownCSimFilePaths.__IKnownCSimFilePathsStatics.get_Gid1()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    static get_Gid2() {
        if (!KnownCSimFilePaths.HasProp("__IKnownCSimFilePathsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.KnownCSimFilePaths")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownCSimFilePathsStatics.IID)
            KnownCSimFilePaths.__IKnownCSimFilePathsStatics := IKnownCSimFilePathsStatics(factoryPtr)
        }

        return KnownCSimFilePaths.__IKnownCSimFilePathsStatics.get_Gid2()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
