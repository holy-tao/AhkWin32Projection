#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmartCardCryptogramMaterialCharacteristics.ahk
#Include ..\..\..\Guid.ahk

/**
 * This class contains characteristics of cryptogram material.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogrammaterialcharacteristics
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardCryptogramMaterialCharacteristics extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmartCardCryptogramMaterialCharacteristics

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmartCardCryptogramMaterialCharacteristics.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the material name.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogrammaterialcharacteristics.materialname
     * @type {HSTRING} 
     */
    MaterialName {
        get => this.get_MaterialName()
    }

    /**
     * Gets the allowed algorithms.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogrammaterialcharacteristics.allowedalgorithms
     * @type {IVectorView<Integer>} 
     */
    AllowedAlgorithms {
        get => this.get_AllowedAlgorithms()
    }

    /**
     * Gets the allowed proof of allowed proof of possession algorithms.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogrammaterialcharacteristics.allowedproofofpossessionalgorithms
     * @type {IVectorView<Integer>} 
     */
    AllowedProofOfPossessionAlgorithms {
        get => this.get_AllowedProofOfPossessionAlgorithms()
    }

    /**
     * Gets the allowed validation algorithms.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogrammaterialcharacteristics.allowedvalidations
     * @type {IVectorView<Integer>} 
     */
    AllowedValidations {
        get => this.get_AllowedValidations()
    }

    /**
     * Gets the material type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogrammaterialcharacteristics.materialtype
     * @type {Integer} 
     */
    MaterialType {
        get => this.get_MaterialType()
    }

    /**
     * Gets the protection method.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogrammaterialcharacteristics.protectionmethod
     * @type {Integer} 
     */
    ProtectionMethod {
        get => this.get_ProtectionMethod()
    }

    /**
     * Gets the protection version.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogrammaterialcharacteristics.protectionversion
     * @type {Integer} 
     */
    ProtectionVersion {
        get => this.get_ProtectionVersion()
    }

    /**
     * Gets the material length.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogrammaterialcharacteristics.materiallength
     * @type {Integer} 
     */
    MaterialLength {
        get => this.get_MaterialLength()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of [SmartCardCryptogramMaterialCharacteristics](./smartcardcryptogrammaterialcharacteristics.md)
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.SmartCards.SmartCardCryptogramMaterialCharacteristics")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MaterialName() {
        if (!this.HasProp("__ISmartCardCryptogramMaterialCharacteristics")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramMaterialCharacteristics.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramMaterialCharacteristics := ISmartCardCryptogramMaterialCharacteristics(outPtr)
        }

        return this.__ISmartCardCryptogramMaterialCharacteristics.get_MaterialName()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_AllowedAlgorithms() {
        if (!this.HasProp("__ISmartCardCryptogramMaterialCharacteristics")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramMaterialCharacteristics.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramMaterialCharacteristics := ISmartCardCryptogramMaterialCharacteristics(outPtr)
        }

        return this.__ISmartCardCryptogramMaterialCharacteristics.get_AllowedAlgorithms()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_AllowedProofOfPossessionAlgorithms() {
        if (!this.HasProp("__ISmartCardCryptogramMaterialCharacteristics")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramMaterialCharacteristics.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramMaterialCharacteristics := ISmartCardCryptogramMaterialCharacteristics(outPtr)
        }

        return this.__ISmartCardCryptogramMaterialCharacteristics.get_AllowedProofOfPossessionAlgorithms()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_AllowedValidations() {
        if (!this.HasProp("__ISmartCardCryptogramMaterialCharacteristics")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramMaterialCharacteristics.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramMaterialCharacteristics := ISmartCardCryptogramMaterialCharacteristics(outPtr)
        }

        return this.__ISmartCardCryptogramMaterialCharacteristics.get_AllowedValidations()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaterialType() {
        if (!this.HasProp("__ISmartCardCryptogramMaterialCharacteristics")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramMaterialCharacteristics.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramMaterialCharacteristics := ISmartCardCryptogramMaterialCharacteristics(outPtr)
        }

        return this.__ISmartCardCryptogramMaterialCharacteristics.get_MaterialType()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProtectionMethod() {
        if (!this.HasProp("__ISmartCardCryptogramMaterialCharacteristics")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramMaterialCharacteristics.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramMaterialCharacteristics := ISmartCardCryptogramMaterialCharacteristics(outPtr)
        }

        return this.__ISmartCardCryptogramMaterialCharacteristics.get_ProtectionMethod()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProtectionVersion() {
        if (!this.HasProp("__ISmartCardCryptogramMaterialCharacteristics")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramMaterialCharacteristics.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramMaterialCharacteristics := ISmartCardCryptogramMaterialCharacteristics(outPtr)
        }

        return this.__ISmartCardCryptogramMaterialCharacteristics.get_ProtectionVersion()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaterialLength() {
        if (!this.HasProp("__ISmartCardCryptogramMaterialCharacteristics")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramMaterialCharacteristics.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramMaterialCharacteristics := ISmartCardCryptogramMaterialCharacteristics(outPtr)
        }

        return this.__ISmartCardCryptogramMaterialCharacteristics.get_MaterialLength()
    }

;@endregion Instance Methods
}
