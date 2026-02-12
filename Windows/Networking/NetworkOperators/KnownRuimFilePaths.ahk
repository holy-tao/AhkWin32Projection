#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKnownRuimFilePathsStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Static class that provides known RUIM file paths.
 * @remarks
 * Your code does not instantiate this class. The class and all its properties are static.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.knownruimfilepaths
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class KnownRuimFilePaths extends IInspectable {
;@region Static Properties
    /**
     * Static property that gets the EFSPN path.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.knownruimfilepaths.efspn
     * @type {IVectorView<Integer>} 
     */
    static EFSpn {
        get => KnownRuimFilePaths.get_EFSpn()
    }

    /**
     * Static property that gets the GID1 path.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.knownruimfilepaths.gid1
     * @type {IVectorView<Integer>} 
     */
    static Gid1 {
        get => KnownRuimFilePaths.get_Gid1()
    }

    /**
     * Static property that gets the GID2 path.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.knownruimfilepaths.gid2
     * @type {IVectorView<Integer>} 
     */
    static Gid2 {
        get => KnownRuimFilePaths.get_Gid2()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    static get_EFSpn() {
        if (!KnownRuimFilePaths.HasProp("__IKnownRuimFilePathsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.KnownRuimFilePaths")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownRuimFilePathsStatics.IID)
            KnownRuimFilePaths.__IKnownRuimFilePathsStatics := IKnownRuimFilePathsStatics(factoryPtr)
        }

        return KnownRuimFilePaths.__IKnownRuimFilePathsStatics.get_EFSpn()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    static get_Gid1() {
        if (!KnownRuimFilePaths.HasProp("__IKnownRuimFilePathsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.KnownRuimFilePaths")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownRuimFilePathsStatics.IID)
            KnownRuimFilePaths.__IKnownRuimFilePathsStatics := IKnownRuimFilePathsStatics(factoryPtr)
        }

        return KnownRuimFilePaths.__IKnownRuimFilePathsStatics.get_Gid1()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    static get_Gid2() {
        if (!KnownRuimFilePaths.HasProp("__IKnownRuimFilePathsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.KnownRuimFilePaths")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownRuimFilePathsStatics.IID)
            KnownRuimFilePaths.__IKnownRuimFilePathsStatics := IKnownRuimFilePathsStatics(factoryPtr)
        }

        return KnownRuimFilePaths.__IKnownRuimFilePathsStatics.get_Gid2()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
