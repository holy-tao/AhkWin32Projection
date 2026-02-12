#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmartCardCryptogramGenerator.ahk
#Include .\ISmartCardCryptogramGenerator2.ahk
#Include .\ISmartCardCryptogramGeneratorStatics2.ahk
#Include .\ISmartCardCryptogramGeneratorStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the mechanism for providing hardware supported for secure payment applications and protocols.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramgenerator
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardCryptogramGenerator extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmartCardCryptogramGenerator

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmartCardCryptogramGenerator.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Returns whether the SmartCardCryptogramGenerator is supported.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramgenerator.issupported
     */
    static IsSupported() {
        if (!SmartCardCryptogramGenerator.HasProp("__ISmartCardCryptogramGeneratorStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.SmartCards.SmartCardCryptogramGenerator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISmartCardCryptogramGeneratorStatics2.IID)
            SmartCardCryptogramGenerator.__ISmartCardCryptogramGeneratorStatics2 := ISmartCardCryptogramGeneratorStatics2(factoryPtr)
        }

        return SmartCardCryptogramGenerator.__ISmartCardCryptogramGeneratorStatics2.IsSupported()
    }

    /**
     * Gets the smart card cryptogram generator.
     * @returns {IAsyncOperation<SmartCardCryptogramGenerator>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramgenerator.getsmartcardcryptogramgeneratorasync
     */
    static GetSmartCardCryptogramGeneratorAsync() {
        if (!SmartCardCryptogramGenerator.HasProp("__ISmartCardCryptogramGeneratorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.SmartCards.SmartCardCryptogramGenerator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISmartCardCryptogramGeneratorStatics.IID)
            SmartCardCryptogramGenerator.__ISmartCardCryptogramGeneratorStatics := ISmartCardCryptogramGeneratorStatics(factoryPtr)
        }

        return SmartCardCryptogramGenerator.__ISmartCardCryptogramGeneratorStatics.GetSmartCardCryptogramGeneratorAsync()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the supported cryptogram material types.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramgenerator.supportedcryptogrammaterialtypes
     * @type {IVectorView<Integer>} 
     */
    SupportedCryptogramMaterialTypes {
        get => this.get_SupportedCryptogramMaterialTypes()
    }

    /**
     * Get the supported cryptogram algorithms.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramgenerator.supportedcryptogramalgorithms
     * @type {IVectorView<Integer>} 
     */
    SupportedCryptogramAlgorithms {
        get => this.get_SupportedCryptogramAlgorithms()
    }

    /**
     * Gets the supported cryptogram material package formats.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramgenerator.supportedcryptogrammaterialpackageformats
     * @type {IVectorView<Integer>} 
     */
    SupportedCryptogramMaterialPackageFormats {
        get => this.get_SupportedCryptogramMaterialPackageFormats()
    }

    /**
     * Gets the supported cryptogram material package confirmation response formats.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramgenerator.supportedcryptogrammaterialpackageconfirmationresponseformats
     * @type {IVectorView<Integer>} 
     */
    SupportedCryptogramMaterialPackageConfirmationResponseFormats {
        get => this.get_SupportedCryptogramMaterialPackageConfirmationResponseFormats()
    }

    /**
     * Gets the supported smart card cryptogram storage key capabilities.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramgenerator.supportedsmartcardcryptogramstoragekeycapabilities
     * @type {IVectorView<Integer>} 
     */
    SupportedSmartCardCryptogramStorageKeyCapabilities {
        get => this.get_SupportedSmartCardCryptogramStorageKeyCapabilities()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedCryptogramMaterialTypes() {
        if (!this.HasProp("__ISmartCardCryptogramGenerator")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramGenerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramGenerator := ISmartCardCryptogramGenerator(outPtr)
        }

        return this.__ISmartCardCryptogramGenerator.get_SupportedCryptogramMaterialTypes()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedCryptogramAlgorithms() {
        if (!this.HasProp("__ISmartCardCryptogramGenerator")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramGenerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramGenerator := ISmartCardCryptogramGenerator(outPtr)
        }

        return this.__ISmartCardCryptogramGenerator.get_SupportedCryptogramAlgorithms()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedCryptogramMaterialPackageFormats() {
        if (!this.HasProp("__ISmartCardCryptogramGenerator")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramGenerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramGenerator := ISmartCardCryptogramGenerator(outPtr)
        }

        return this.__ISmartCardCryptogramGenerator.get_SupportedCryptogramMaterialPackageFormats()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedCryptogramMaterialPackageConfirmationResponseFormats() {
        if (!this.HasProp("__ISmartCardCryptogramGenerator")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramGenerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramGenerator := ISmartCardCryptogramGenerator(outPtr)
        }

        return this.__ISmartCardCryptogramGenerator.get_SupportedCryptogramMaterialPackageConfirmationResponseFormats()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedSmartCardCryptogramStorageKeyCapabilities() {
        if (!this.HasProp("__ISmartCardCryptogramGenerator")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramGenerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramGenerator := ISmartCardCryptogramGenerator(outPtr)
        }

        return this.__ISmartCardCryptogramGenerator.get_SupportedSmartCardCryptogramStorageKeyCapabilities()
    }

    /**
     * Deletes the app's storage key and all of its stored packages.
     * @param {HSTRING} storageKeyName The name of the storage key.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramgenerator.deletecryptogrammaterialstoragekeyasync
     */
    DeleteCryptogramMaterialStorageKeyAsync(storageKeyName) {
        if (!this.HasProp("__ISmartCardCryptogramGenerator")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramGenerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramGenerator := ISmartCardCryptogramGenerator(outPtr)
        }

        return this.__ISmartCardCryptogramGenerator.DeleteCryptogramMaterialStorageKeyAsync(storageKeyName)
    }

    /**
     * Generates a cryptogram storage key.
     * @param {Integer} promptingBehavior The user prompting behavior.
     * @param {HSTRING} storageKeyName The name of the new storage key.
     * @param {Integer} algorithm The encryption algorithm to use with the storage key.
     * @param {Integer} capabilities The capabilities of the new storage key.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramgenerator.createcryptogrammaterialstoragekeyasync
     */
    CreateCryptogramMaterialStorageKeyAsync(promptingBehavior, storageKeyName, algorithm, capabilities) {
        if (!this.HasProp("__ISmartCardCryptogramGenerator")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramGenerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramGenerator := ISmartCardCryptogramGenerator(outPtr)
        }

        return this.__ISmartCardCryptogramGenerator.CreateCryptogramMaterialStorageKeyAsync(promptingBehavior, storageKeyName, algorithm, capabilities)
    }

    /**
     * Returns the public key and attestation information related to the cryptogram storage key.
     * @param {Integer} promptingBehavior The prompting behavior to display to the user for validation.
     * @param {HSTRING} storageKeyName The name of the storage key.
     * @param {Integer} format The format in which the public key of the storage key is to be returned.
     * @returns {IAsyncOperation<SmartCardCryptogramStorageKeyInfo>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramgenerator.requestcryptogrammaterialstoragekeyinfoasync
     */
    RequestCryptogramMaterialStorageKeyInfoAsync(promptingBehavior, storageKeyName, format) {
        if (!this.HasProp("__ISmartCardCryptogramGenerator")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramGenerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramGenerator := ISmartCardCryptogramGenerator(outPtr)
        }

        return this.__ISmartCardCryptogramGenerator.RequestCryptogramMaterialStorageKeyInfoAsync(promptingBehavior, storageKeyName, format)
    }

    /**
     * Imports a cryptogram package.
     * @param {Integer} format The format of the package.
     * @param {HSTRING} storageKeyName The name of the storage key.
     * @param {HSTRING} materialPackageName The name of the package.
     * @param {IBuffer} cryptogramMaterialPackage A buffer containing the cryptogram package data.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramgenerator.importcryptogrammaterialpackageasync
     */
    ImportCryptogramMaterialPackageAsync(format, storageKeyName, materialPackageName, cryptogramMaterialPackage) {
        if (!this.HasProp("__ISmartCardCryptogramGenerator")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramGenerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramGenerator := ISmartCardCryptogramGenerator(outPtr)
        }

        return this.__ISmartCardCryptogramGenerator.ImportCryptogramMaterialPackageAsync(format, storageKeyName, materialPackageName, cryptogramMaterialPackage)
    }

    /**
     * This method allows the payment app to query the cryptogram generator for proof of material package possession.
     * @param {Integer} promptingBehavior The prompting behavior to display to the user for validation.
     * @param {Integer} responseFormat The format of the response.
     * @param {HSTRING} materialPackageName The material package name.
     * @param {HSTRING} materialName The material name.
     * @param {IBuffer} challenge A buffer that contains the confirmation challenge token. The challenge token must consist of UTF-8 characters conformating to the following C# regular expression. ```
     * ^(?<api>0\d{7})(?<sc>\d+)(?<tvl>\d*[|][0-9a-fA-F]*[|]\d*[|][QM])*$"
     * ```
     * @returns {IAsyncOperation<SmartCardCryptogramMaterialPossessionProof>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramgenerator.tryprovepossessionofcryptogrammaterialpackageasync
     */
    TryProvePossessionOfCryptogramMaterialPackageAsync(promptingBehavior, responseFormat, materialPackageName, materialName, challenge) {
        if (!this.HasProp("__ISmartCardCryptogramGenerator")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramGenerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramGenerator := ISmartCardCryptogramGenerator(outPtr)
        }

        return this.__ISmartCardCryptogramGenerator.TryProvePossessionOfCryptogramMaterialPackageAsync(promptingBehavior, responseFormat, materialPackageName, materialName, challenge)
    }

    /**
     * Requests that previously imported cryptogram material packages be readied for use.
     * @param {Integer} promptingBehavior The unlock prompting behavior.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramgenerator.requestunlockcryptogrammaterialforuseasync
     */
    RequestUnlockCryptogramMaterialForUseAsync(promptingBehavior) {
        if (!this.HasProp("__ISmartCardCryptogramGenerator")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramGenerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramGenerator := ISmartCardCryptogramGenerator(outPtr)
        }

        return this.__ISmartCardCryptogramGenerator.RequestUnlockCryptogramMaterialForUseAsync(promptingBehavior)
    }

    /**
     * Deletes a cryptogram material package.
     * @param {HSTRING} materialPackageName The material package name.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramgenerator.deletecryptogrammaterialpackageasync
     */
    DeleteCryptogramMaterialPackageAsync(materialPackageName) {
        if (!this.HasProp("__ISmartCardCryptogramGenerator")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramGenerator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramGenerator := ISmartCardCryptogramGenerator(outPtr)
        }

        return this.__ISmartCardCryptogramGenerator.DeleteCryptogramMaterialPackageAsync(materialPackageName)
    }

    /**
     * Validates the APDU request.
     * @param {Integer} promptingBehavior The prompting behavior.
     * @param {IBuffer} apduToValidate The APDU to validate.
     * @param {IIterable<SmartCardCryptogramPlacementStep>} cryptogramPlacementSteps The cryptogram placement steps.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramgenerator.validaterequestapduasync
     */
    ValidateRequestApduAsync(promptingBehavior, apduToValidate, cryptogramPlacementSteps) {
        if (!this.HasProp("__ISmartCardCryptogramGenerator2")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramGenerator2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramGenerator2 := ISmartCardCryptogramGenerator2(outPtr)
        }

        return this.__ISmartCardCryptogramGenerator2.ValidateRequestApduAsync(promptingBehavior, apduToValidate, cryptogramPlacementSteps)
    }

    /**
     * Gets all storage key characteristics.
     * @returns {IAsyncOperation<SmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramgenerator.getallcryptogramstoragekeycharacteristicsasync
     */
    GetAllCryptogramStorageKeyCharacteristicsAsync() {
        if (!this.HasProp("__ISmartCardCryptogramGenerator2")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramGenerator2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramGenerator2 := ISmartCardCryptogramGenerator2(outPtr)
        }

        return this.__ISmartCardCryptogramGenerator2.GetAllCryptogramStorageKeyCharacteristicsAsync()
    }

    /**
     * Gets all the cryptogram material package characteristics.
     * @returns {IAsyncOperation<SmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramgenerator.getallcryptogrammaterialpackagecharacteristicsasync
     */
    GetAllCryptogramMaterialPackageCharacteristicsAsync() {
        if (!this.HasProp("__ISmartCardCryptogramGenerator2")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramGenerator2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramGenerator2 := ISmartCardCryptogramGenerator2(outPtr)
        }

        return this.__ISmartCardCryptogramGenerator2.GetAllCryptogramMaterialPackageCharacteristicsAsync()
    }

    /**
     * Gets all cryptogram material package characteristics.
     * @param {HSTRING} storageKeyName 
     * @returns {IAsyncOperation<SmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramgenerator.getallcryptogrammaterialpackagecharacteristicsasync
     */
    GetAllCryptogramMaterialPackageCharacteristicsWithStorageKeyAsync(storageKeyName) {
        if (!this.HasProp("__ISmartCardCryptogramGenerator2")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramGenerator2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramGenerator2 := ISmartCardCryptogramGenerator2(outPtr)
        }

        return this.__ISmartCardCryptogramGenerator2.GetAllCryptogramMaterialPackageCharacteristicsWithStorageKeyAsync(storageKeyName)
    }

    /**
     * Gets all the cryptogram material characteristics.
     * @param {Integer} promptingBehavior The prompting behavior.
     * @param {HSTRING} materialPackageName The material package name.
     * @returns {IAsyncOperation<SmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramgenerator.getallcryptogrammaterialcharacteristicsasync
     */
    GetAllCryptogramMaterialCharacteristicsAsync(promptingBehavior, materialPackageName) {
        if (!this.HasProp("__ISmartCardCryptogramGenerator2")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramGenerator2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramGenerator2 := ISmartCardCryptogramGenerator2(outPtr)
        }

        return this.__ISmartCardCryptogramGenerator2.GetAllCryptogramMaterialCharacteristicsAsync(promptingBehavior, materialPackageName)
    }

;@endregion Instance Methods
}
