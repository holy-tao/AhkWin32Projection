#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKnownUSimFilePathsStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Static class that provides known USIM file paths.
 * @remarks
 * Your code does not instantiate this class. The class and all its properties are static.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.knownusimfilepaths
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class KnownUSimFilePaths extends IInspectable {
;@region Static Properties
    /**
     * Static property that gets the EFSPN path.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.knownusimfilepaths.efspn
     * @type {IVectorView<Integer>} 
     */
    static EFSpn {
        get => KnownUSimFilePaths.get_EFSpn()
    }

    /**
     * Static property that gets the EFOPL path.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.knownusimfilepaths.efopl
     * @type {IVectorView<Integer>} 
     */
    static EFOpl {
        get => KnownUSimFilePaths.get_EFOpl()
    }

    /**
     * Static property that gets the EFPNN path.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.knownusimfilepaths.efpnn
     * @type {IVectorView<Integer>} 
     */
    static EFPnn {
        get => KnownUSimFilePaths.get_EFPnn()
    }

    /**
     * Static property that gets the GID1 path.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.knownusimfilepaths.gid1
     * @type {IVectorView<Integer>} 
     */
    static Gid1 {
        get => KnownUSimFilePaths.get_Gid1()
    }

    /**
     * Static property that gets the GID2 path.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.knownusimfilepaths.gid2
     * @type {IVectorView<Integer>} 
     */
    static Gid2 {
        get => KnownUSimFilePaths.get_Gid2()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    static get_EFSpn() {
        if (!KnownUSimFilePaths.HasProp("__IKnownUSimFilePathsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.KnownUSimFilePaths")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownUSimFilePathsStatics.IID)
            KnownUSimFilePaths.__IKnownUSimFilePathsStatics := IKnownUSimFilePathsStatics(factoryPtr)
        }

        return KnownUSimFilePaths.__IKnownUSimFilePathsStatics.get_EFSpn()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    static get_EFOpl() {
        if (!KnownUSimFilePaths.HasProp("__IKnownUSimFilePathsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.KnownUSimFilePaths")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownUSimFilePathsStatics.IID)
            KnownUSimFilePaths.__IKnownUSimFilePathsStatics := IKnownUSimFilePathsStatics(factoryPtr)
        }

        return KnownUSimFilePaths.__IKnownUSimFilePathsStatics.get_EFOpl()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    static get_EFPnn() {
        if (!KnownUSimFilePaths.HasProp("__IKnownUSimFilePathsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.KnownUSimFilePaths")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownUSimFilePathsStatics.IID)
            KnownUSimFilePaths.__IKnownUSimFilePathsStatics := IKnownUSimFilePathsStatics(factoryPtr)
        }

        return KnownUSimFilePaths.__IKnownUSimFilePathsStatics.get_EFPnn()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    static get_Gid1() {
        if (!KnownUSimFilePaths.HasProp("__IKnownUSimFilePathsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.KnownUSimFilePaths")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownUSimFilePathsStatics.IID)
            KnownUSimFilePaths.__IKnownUSimFilePathsStatics := IKnownUSimFilePathsStatics(factoryPtr)
        }

        return KnownUSimFilePaths.__IKnownUSimFilePathsStatics.get_Gid1()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    static get_Gid2() {
        if (!KnownUSimFilePaths.HasProp("__IKnownUSimFilePathsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.KnownUSimFilePaths")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownUSimFilePathsStatics.IID)
            KnownUSimFilePaths.__IKnownUSimFilePathsStatics := IKnownUSimFilePathsStatics(factoryPtr)
        }

        return KnownUSimFilePaths.__IKnownUSimFilePathsStatics.get_Gid2()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
