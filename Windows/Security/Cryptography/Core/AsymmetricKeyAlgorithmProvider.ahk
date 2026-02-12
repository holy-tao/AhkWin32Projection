#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAsymmetricKeyAlgorithmProvider.ahk
#Include .\IAsymmetricKeyAlgorithmProvider2.ahk
#Include .\IAsymmetricKeyAlgorithmProviderStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a provider of asymmetric (public) key algorithms. For more information, see [Cryptographic keys](/windows/uwp/security/cryptographic-keys).
 * @remarks
 * You create an AsymmetricKeyAlgorithmProvider object by calling the static [OpenAlgorithm](asymmetrickeyalgorithmprovider_openalgorithm_637226074.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.asymmetrickeyalgorithmprovider
 * @namespace Windows.Security.Cryptography.Core
 * @version WindowsRuntime 1.4
 */
class AsymmetricKeyAlgorithmProvider extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAsymmetricKeyAlgorithmProvider

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAsymmetricKeyAlgorithmProvider.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of the [AsymmetricKeyAlgorithmProvider](asymmetrickeyalgorithmprovider.md) class and opens the specified algorithm for use.
     * @remarks
     * Use the static properties in the [AsymmetricAlgorithmNames](asymmetricalgorithmnames.md) class to specify the name of the algorithm to open.
     * @param {HSTRING} algorithm Algorithm name.
     * @returns {AsymmetricKeyAlgorithmProvider} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.asymmetrickeyalgorithmprovider.openalgorithm
     */
    static OpenAlgorithm(algorithm) {
        if (!AsymmetricKeyAlgorithmProvider.HasProp("__IAsymmetricKeyAlgorithmProviderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.AsymmetricKeyAlgorithmProvider")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAsymmetricKeyAlgorithmProviderStatics.IID)
            AsymmetricKeyAlgorithmProvider.__IAsymmetricKeyAlgorithmProviderStatics := IAsymmetricKeyAlgorithmProviderStatics(factoryPtr)
        }

        return AsymmetricKeyAlgorithmProvider.__IAsymmetricKeyAlgorithmProviderStatics.OpenAlgorithm(algorithm)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the name of the open asymmetric algorithm.
     * @remarks
     * You must call [OpenAlgorithm](asymmetrickeyalgorithmprovider_openalgorithm_637226074.md) before calling the AlgorithmName property.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.asymmetrickeyalgorithmprovider.algorithmname
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
        if (!this.HasProp("__IAsymmetricKeyAlgorithmProvider")) {
            if ((queryResult := this.QueryInterface(IAsymmetricKeyAlgorithmProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsymmetricKeyAlgorithmProvider := IAsymmetricKeyAlgorithmProvider(outPtr)
        }

        return this.__IAsymmetricKeyAlgorithmProvider.get_AlgorithmName()
    }

    /**
     * Creates a public/private key pair.
     * @param {Integer} keySize_ Size, in bits, of the key. Typical key sizes are 512, 1024, 2048, or 4096 bits.
     * @returns {CryptographicKey} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.asymmetrickeyalgorithmprovider.createkeypair
     */
    CreateKeyPair(keySize_) {
        if (!this.HasProp("__IAsymmetricKeyAlgorithmProvider")) {
            if ((queryResult := this.QueryInterface(IAsymmetricKeyAlgorithmProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsymmetricKeyAlgorithmProvider := IAsymmetricKeyAlgorithmProvider(outPtr)
        }

        return this.__IAsymmetricKeyAlgorithmProvider.CreateKeyPair(keySize_)
    }

    /**
     * Imports a public/private key pair from a buffer in the specified format.
     * @param {IBuffer} keyBlob Buffer that contains the key pair to import.
     * @returns {CryptographicKey} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.asymmetrickeyalgorithmprovider.importkeypair
     */
    ImportDefaultPrivateKeyBlob(keyBlob) {
        if (!this.HasProp("__IAsymmetricKeyAlgorithmProvider")) {
            if ((queryResult := this.QueryInterface(IAsymmetricKeyAlgorithmProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsymmetricKeyAlgorithmProvider := IAsymmetricKeyAlgorithmProvider(outPtr)
        }

        return this.__IAsymmetricKeyAlgorithmProvider.ImportDefaultPrivateKeyBlob(keyBlob)
    }

    /**
     * Imports a public/private key pair from a buffer.
     * @param {IBuffer} keyBlob Buffer that contains the key pair to import.
     * @param {Integer} BlobType 
     * @returns {CryptographicKey} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.asymmetrickeyalgorithmprovider.importkeypair
     */
    ImportKeyPairWithBlobType(keyBlob, BlobType) {
        if (!this.HasProp("__IAsymmetricKeyAlgorithmProvider")) {
            if ((queryResult := this.QueryInterface(IAsymmetricKeyAlgorithmProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsymmetricKeyAlgorithmProvider := IAsymmetricKeyAlgorithmProvider(outPtr)
        }

        return this.__IAsymmetricKeyAlgorithmProvider.ImportKeyPairWithBlobType(keyBlob, BlobType)
    }

    /**
     * Imports a public key into a buffer for a specified format.
     * @param {IBuffer} keyBlob Buffer that contains the key to import.
     * @returns {CryptographicKey} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.asymmetrickeyalgorithmprovider.importpublickey
     */
    ImportDefaultPublicKeyBlob(keyBlob) {
        if (!this.HasProp("__IAsymmetricKeyAlgorithmProvider")) {
            if ((queryResult := this.QueryInterface(IAsymmetricKeyAlgorithmProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsymmetricKeyAlgorithmProvider := IAsymmetricKeyAlgorithmProvider(outPtr)
        }

        return this.__IAsymmetricKeyAlgorithmProvider.ImportDefaultPublicKeyBlob(keyBlob)
    }

    /**
     * Imports a public key into a buffer.
     * @param {IBuffer} keyBlob Buffer that contains the key to import.
     * @param {Integer} BlobType 
     * @returns {CryptographicKey} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.asymmetrickeyalgorithmprovider.importpublickey
     */
    ImportPublicKeyWithBlobType(keyBlob, BlobType) {
        if (!this.HasProp("__IAsymmetricKeyAlgorithmProvider")) {
            if ((queryResult := this.QueryInterface(IAsymmetricKeyAlgorithmProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsymmetricKeyAlgorithmProvider := IAsymmetricKeyAlgorithmProvider(outPtr)
        }

        return this.__IAsymmetricKeyAlgorithmProvider.ImportPublicKeyWithBlobType(keyBlob, BlobType)
    }

    /**
     * Creates a public/private key pair using an algorithmic curve name.
     * @param {HSTRING} curveName The name of the curve.
     * @returns {CryptographicKey} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.asymmetrickeyalgorithmprovider.createkeypairwithcurvename
     */
    CreateKeyPairWithCurveName(curveName) {
        if (!this.HasProp("__IAsymmetricKeyAlgorithmProvider2")) {
            if ((queryResult := this.QueryInterface(IAsymmetricKeyAlgorithmProvider2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsymmetricKeyAlgorithmProvider2 := IAsymmetricKeyAlgorithmProvider2(outPtr)
        }

        return this.__IAsymmetricKeyAlgorithmProvider2.CreateKeyPairWithCurveName(curveName)
    }

    /**
     * Creates an asymmetric public/private key pair using curve parameters.
     * @remarks
     * The private key generated is a random integer. The public key is a point, with X and Y coordinates, on an ECDSA curve.
     * @param {Integer} parameters_length 
     * @param {Pointer<Integer>} parameters An array of bytes containing the curve parameters.
     * @returns {CryptographicKey} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.asymmetrickeyalgorithmprovider.createkeypairwithcurveparameters
     */
    CreateKeyPairWithCurveParameters(parameters_length, parameters) {
        if (!this.HasProp("__IAsymmetricKeyAlgorithmProvider2")) {
            if ((queryResult := this.QueryInterface(IAsymmetricKeyAlgorithmProvider2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAsymmetricKeyAlgorithmProvider2 := IAsymmetricKeyAlgorithmProvider2(outPtr)
        }

        return this.__IAsymmetricKeyAlgorithmProvider2.CreateKeyPairWithCurveParameters(parameters_length, parameters)
    }

;@endregion Instance Methods
}
