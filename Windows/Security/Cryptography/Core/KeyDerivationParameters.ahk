#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKeyDerivationParameters.ahk
#Include .\IKeyDerivationParameters2.ahk
#Include .\IKeyDerivationParametersStatics.ahk
#Include .\IKeyDerivationParametersStatics2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents parameters used when deriving a key.
 * @remarks
 * You do not have to create an instance of the class to use the methods. Instead, use the class name followed by the dot operator (.), followed by the method name.
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.keyderivationparameters
 * @namespace Windows.Security.Cryptography.Core
 * @version WindowsRuntime 1.4
 */
class KeyDerivationParameters extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IKeyDerivationParameters

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IKeyDerivationParameters.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [KeyDerivationParameters](keyderivationparameters.md) object for use in the password-based key derivation function 2 (PBKDF2).
     * @remarks
     * You can use the following algorithm names with the [OpenAlgorithm](keyderivationalgorithmprovider_openalgorithm_637226074.md) function to open a PBKDF2 algorithm provider:
     * 
     * 
     * + [KeyDerivationAlgorithmNames.Pbkdf2Md5](keyderivationalgorithmnames_pbkdf2md5.md)
     * + [KeyDerivationAlgorithmNames.Pbkdf2Sha1](keyderivationalgorithmnames_pbkdf2sha1.md)
     * + [KeyDerivationAlgorithmNames.Pbkdf2Sha256](keyderivationalgorithmnames_pbkdf2sha256.md)
     * + [KeyDerivationAlgorithmNames.Pbkdf2Sha384](keyderivationalgorithmnames_pbkdf2sha384.md)
     * + [KeyDerivationAlgorithmNames.Pbkdf2Sha512](keyderivationalgorithmnames_pbkdf2sha512.md)
     * @param {IBuffer} pbkdf2Salt The salt, a random or pseudorandom value to be combined with the password in multiple iterations. A salt is used to increase entropy above what can be obtained from using a password alone.
     * @param {Integer} iterationCount Number of iterations to be used to derive a key.
     * @returns {KeyDerivationParameters} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.keyderivationparameters.buildforpbkdf2
     */
    static BuildForPbkdf2(pbkdf2Salt, iterationCount) {
        if (!KeyDerivationParameters.HasProp("__IKeyDerivationParametersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.KeyDerivationParameters")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyDerivationParametersStatics.IID)
            KeyDerivationParameters.__IKeyDerivationParametersStatics := IKeyDerivationParametersStatics(factoryPtr)
        }

        return KeyDerivationParameters.__IKeyDerivationParametersStatics.BuildForPbkdf2(pbkdf2Salt, iterationCount)
    }

    /**
     * Creates a [KeyDerivationParameters](keyderivationparameters.md) object for use in a counter mode, hash-based message authentication code (HMAC) key derivation function.
     * @remarks
     * You can use the following algorithm names with the [OpenAlgorithm](keyderivationalgorithmprovider_openalgorithm_637226074.md) function to open a SP800108 KDF algorithm provider:
     * 
     * 
     * + [KeyDerivationAlgorithmNames.Sp800108CtrHmacMd5](keyderivationalgorithmnames_sp800108ctrhmacmd5.md)
     * + [KeyDerivationAlgorithmNames.Sp800108CtrHmacSha1](keyderivationalgorithmnames_sp800108ctrhmacsha1.md)
     * + [KeyDerivationAlgorithmNames.Sp800108CtrHmacSha256](keyderivationalgorithmnames_sp800108ctrhmacsha256.md)
     * + [KeyDerivationAlgorithmNames.Sp800108CtrHmacSha384](keyderivationalgorithmnames_sp800108ctrhmacsha384.md)
     * + [KeyDerivationAlgorithmNames.Sp800108CtrHmacSha512](keyderivationalgorithmnames_sp800108ctrhmacsha512.md)
     * @param {IBuffer} label Buffer that specifies the purpose for the derived keying material.
     * @param {IBuffer} context_ Buffer that specifies information related to the derived keying material. For example, the context can identify the parties who are deriving the keying material and, optionally, a nonce known by the parties.
     * @returns {KeyDerivationParameters} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.keyderivationparameters.buildforsp800108
     */
    static BuildForSP800108(label, context_) {
        if (!KeyDerivationParameters.HasProp("__IKeyDerivationParametersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.KeyDerivationParameters")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyDerivationParametersStatics.IID)
            KeyDerivationParameters.__IKeyDerivationParametersStatics := IKeyDerivationParametersStatics(factoryPtr)
        }

        return KeyDerivationParameters.__IKeyDerivationParametersStatics.BuildForSP800108(label, context_)
    }

    /**
     * Creates a [KeyDerivationParameters](keyderivationparameters.md) object for use in the SP800-56A key derivation function.
     * @remarks
     * You can use the following algorithm names with the [OpenAlgorithm](keyderivationalgorithmprovider_openalgorithm_637226074.md) function to open a SP80056a KDF algorithm provider:
     * 
     * 
     * + [KeyDerivationAlgorithmNames.Sp80056aConcatMd5](keyderivationalgorithmnames_sp80056aconcatmd5.md)
     * + [KeyDerivationAlgorithmNames.Sp80056aConcatSha1](keyderivationalgorithmnames_sp80056aconcatsha1.md)
     * + [KeyDerivationAlgorithmNames.Sp80056aConcatSha256](keyderivationalgorithmnames_sp80056aconcatsha256.md)
     * + [KeyDerivationAlgorithmNames.Sp80056aConcatSha384](keyderivationalgorithmnames_sp80056aconcatsha384.md)
     * + [KeyDerivationAlgorithmNames.Sp80056aConcatSha512](keyderivationalgorithmnames_sp80056aconcatsha512.md)
     * @param {IBuffer} algorithmId Specifies the intended purpose of the derived key.
     * @param {IBuffer} partyUInfo Contains public information contributed by the initiator.
     * @param {IBuffer} partyVInfo Contains public information contributed by the responder.
     * @param {IBuffer} suppPubInfo Contains public information known to both initiator and responder.
     * @param {IBuffer} suppPrivInfo Contains private information known to both initiator and responder, such as a shared secret.
     * @returns {KeyDerivationParameters} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.keyderivationparameters.buildforsp80056a
     */
    static BuildForSP80056a(algorithmId, partyUInfo, partyVInfo, suppPubInfo, suppPrivInfo) {
        if (!KeyDerivationParameters.HasProp("__IKeyDerivationParametersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.KeyDerivationParameters")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyDerivationParametersStatics.IID)
            KeyDerivationParameters.__IKeyDerivationParametersStatics := IKeyDerivationParametersStatics(factoryPtr)
        }

        return KeyDerivationParameters.__IKeyDerivationParametersStatics.BuildForSP80056a(algorithmId, partyUInfo, partyVInfo, suppPubInfo, suppPrivInfo)
    }

    /**
     * Creates a [KeyDerivationParameters](keyderivationparameters.md) object for use in the target algorithm.
     * @param {Integer} capi1KdfTargetAlgorithm_ The target algorithm.
     * @returns {KeyDerivationParameters} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.keyderivationparameters.buildforcapi1kdf
     */
    static BuildForCapi1Kdf(capi1KdfTargetAlgorithm_) {
        if (!KeyDerivationParameters.HasProp("__IKeyDerivationParametersStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.KeyDerivationParameters")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyDerivationParametersStatics2.IID)
            KeyDerivationParameters.__IKeyDerivationParametersStatics2 := IKeyDerivationParametersStatics2(factoryPtr)
        }

        return KeyDerivationParameters.__IKeyDerivationParametersStatics2.BuildForCapi1Kdf(capi1KdfTargetAlgorithm_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the parameters used by the key derivation algorithm.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.keyderivationparameters.kdfgenericbinary
     * @type {IBuffer} 
     */
    KdfGenericBinary {
        get => this.get_KdfGenericBinary()
        set => this.put_KdfGenericBinary(value)
    }

    /**
     * Retrieves the number of iterations used to derive the key. For more information, see [BuildForPbkdf2](keyderivationparameters_buildforpbkdf2_636237279.md).
     * @remarks
     * The number of iterations is specified in the [BuildForPbkdf2](keyderivationparameters_buildforpbkdf2_636237279.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.keyderivationparameters.iterationcount
     * @type {Integer} 
     */
    IterationCount {
        get => this.get_IterationCount()
    }

    /**
     * Gets or sets the [Capi1KdfTargetAlgorithm](capi1kdftargetalgorithm.md).
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.keyderivationparameters.capi1kdftargetalgorithm
     * @type {Integer} 
     */
    Capi1KdfTargetAlgorithm {
        get => this.get_Capi1KdfTargetAlgorithm()
        set => this.put_Capi1KdfTargetAlgorithm(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_KdfGenericBinary() {
        if (!this.HasProp("__IKeyDerivationParameters")) {
            if ((queryResult := this.QueryInterface(IKeyDerivationParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyDerivationParameters := IKeyDerivationParameters(outPtr)
        }

        return this.__IKeyDerivationParameters.get_KdfGenericBinary()
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_KdfGenericBinary(value) {
        if (!this.HasProp("__IKeyDerivationParameters")) {
            if ((queryResult := this.QueryInterface(IKeyDerivationParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyDerivationParameters := IKeyDerivationParameters(outPtr)
        }

        return this.__IKeyDerivationParameters.put_KdfGenericBinary(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IterationCount() {
        if (!this.HasProp("__IKeyDerivationParameters")) {
            if ((queryResult := this.QueryInterface(IKeyDerivationParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyDerivationParameters := IKeyDerivationParameters(outPtr)
        }

        return this.__IKeyDerivationParameters.get_IterationCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Capi1KdfTargetAlgorithm() {
        if (!this.HasProp("__IKeyDerivationParameters2")) {
            if ((queryResult := this.QueryInterface(IKeyDerivationParameters2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyDerivationParameters2 := IKeyDerivationParameters2(outPtr)
        }

        return this.__IKeyDerivationParameters2.get_Capi1KdfTargetAlgorithm()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Capi1KdfTargetAlgorithm(value) {
        if (!this.HasProp("__IKeyDerivationParameters2")) {
            if ((queryResult := this.QueryInterface(IKeyDerivationParameters2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyDerivationParameters2 := IKeyDerivationParameters2(outPtr)
        }

        return this.__IKeyDerivationParameters2.put_Capi1KdfTargetAlgorithm(value)
    }

;@endregion Instance Methods
}
