#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKeyDerivationAlgorithmProvider.ahk
#Include .\IKeyDerivationAlgorithmProviderStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a key derivation algorithm provider.
 * @remarks
 * When two or more parties share a secret symmetric key, it is often necessary to derive additional keys for use in cryptographic operations. It is also often necessary for a trusted third party to derive distinct cryptographic keys from a single master key. Key derivation functions are used to derive these additional keys.
 * 
 * You can use the static [DeriveKeyMaterial](cryptographicengine_derivekeymaterial_1370645582.md) method in the [CryptographicEngine](cryptographicengine.md) class and the following methods in the [KeyDerivationParameters](keyderivationparameters.md) class to derive a key.
 * 
 * | Method | Description |
 * |---|---|
 * | [BuildForPbkdf2](keyderivationparameters_buildforpbkdf2_636237279.md) | Creates a [KeyDerivationParameters](keyderivationparameters.md) object for use in the password-based key derivation function 2 (PBKDF2). |
 * | [BuildForSP800108](keyderivationparameters_buildforsp800108_1459175055.md) | Creates a [KeyDerivationParameters](keyderivationparameters.md) object for use in a counter mode, hash-based message authentication code (HMAC) key derivation function. |
 * | [BuildForSP80056a](keyderivationparameters_buildforsp80056a_870294687.md) | Creates a [KeyDerivationParameters](keyderivationparameters.md) object for use in the SP800-56A key derivation function. |
 * 
 * You create a KeyDerivationAlgorithmProvider object by calling the static [OpenAlgorithm](keyderivationalgorithmprovider_openalgorithm_637226074.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.keyderivationalgorithmprovider
 * @namespace Windows.Security.Cryptography.Core
 * @version WindowsRuntime 1.4
 */
class KeyDerivationAlgorithmProvider extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IKeyDerivationAlgorithmProvider

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IKeyDerivationAlgorithmProvider.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of the [KeyDerivationAlgorithmProvider](keyderivationalgorithmprovider.md) class and opens the specified algorithm for use.
     * @remarks
     * You can retrieve the algorithm name by using the [AlgorithmName](keyderivationalgorithmprovider_algorithmname.md) property. You can specify the name of the algorithm by using the static properties in the [KeyDerivationAlgorithmNames](keyderivationalgorithmnames.md) class.
     * @param {HSTRING} algorithm Represents a KDF algorithm provider.
     * @returns {KeyDerivationAlgorithmProvider} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.keyderivationalgorithmprovider.openalgorithm
     */
    static OpenAlgorithm(algorithm) {
        if (!KeyDerivationAlgorithmProvider.HasProp("__IKeyDerivationAlgorithmProviderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmProvider")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyDerivationAlgorithmProviderStatics.IID)
            KeyDerivationAlgorithmProvider.__IKeyDerivationAlgorithmProviderStatics := IKeyDerivationAlgorithmProviderStatics(factoryPtr)
        }

        return KeyDerivationAlgorithmProvider.__IKeyDerivationAlgorithmProviderStatics.OpenAlgorithm(algorithm)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the name of the open key derivation function (KDF) algorithm.
     * @remarks
     * You must call the [OpenAlgorithm](keyderivationalgorithmprovider_openalgorithm_637226074.md) method before calling this property.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.keyderivationalgorithmprovider.algorithmname
     * @type {HSTRING} 
     */
    AlgorithmName {
        get => this.get_AlgorithmName()
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
    get_AlgorithmName() {
        if (!this.HasProp("__IKeyDerivationAlgorithmProvider")) {
            if ((queryResult := this.QueryInterface(IKeyDerivationAlgorithmProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyDerivationAlgorithmProvider := IKeyDerivationAlgorithmProvider(outPtr)
        }

        return this.__IKeyDerivationAlgorithmProvider.get_AlgorithmName()
    }

    /**
     * Creates a KDF key.
     * @param {IBuffer} keyMaterial Data used to create the key.
     * @returns {CryptographicKey} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.keyderivationalgorithmprovider.createkey
     */
    CreateKey(keyMaterial) {
        if (!this.HasProp("__IKeyDerivationAlgorithmProvider")) {
            if ((queryResult := this.QueryInterface(IKeyDerivationAlgorithmProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyDerivationAlgorithmProvider := IKeyDerivationAlgorithmProvider(outPtr)
        }

        return this.__IKeyDerivationAlgorithmProvider.CreateKey(keyMaterial)
    }

;@endregion Instance Methods
}
