#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmartCardCryptogramMaterialPackageCharacteristics.ahk
#Include ..\..\..\Guid.ahk

/**
 * This class contains characteristics of a cryptogram material package.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogrammaterialpackagecharacteristics
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardCryptogramMaterialPackageCharacteristics extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmartCardCryptogramMaterialPackageCharacteristics

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmartCardCryptogramMaterialPackageCharacteristics.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the package name.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogrammaterialpackagecharacteristics.packagename
     * @type {HSTRING} 
     */
    PackageName {
        get => this.get_PackageName()
    }

    /**
     * Gets the storage key name.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogrammaterialpackagecharacteristics.storagekeyname
     * @type {HSTRING} 
     */
    StorageKeyName {
        get => this.get_StorageKeyName()
    }

    /**
     * Gets the date that the material package was imported.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogrammaterialpackagecharacteristics.dateimported
     * @type {DateTime} 
     */
    DateImported {
        get => this.get_DateImported()
    }

    /**
     * Gets the package format.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogrammaterialpackagecharacteristics.packageformat
     * @type {Integer} 
     */
    PackageFormat {
        get => this.get_PackageFormat()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of [SmartCardCryptogramMaterialPackageCharacteristics](./smartcardcryptogrammaterialpackagecharacteristics.md).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.SmartCards.SmartCardCryptogramMaterialPackageCharacteristics")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PackageName() {
        if (!this.HasProp("__ISmartCardCryptogramMaterialPackageCharacteristics")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramMaterialPackageCharacteristics.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramMaterialPackageCharacteristics := ISmartCardCryptogramMaterialPackageCharacteristics(outPtr)
        }

        return this.__ISmartCardCryptogramMaterialPackageCharacteristics.get_PackageName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_StorageKeyName() {
        if (!this.HasProp("__ISmartCardCryptogramMaterialPackageCharacteristics")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramMaterialPackageCharacteristics.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramMaterialPackageCharacteristics := ISmartCardCryptogramMaterialPackageCharacteristics(outPtr)
        }

        return this.__ISmartCardCryptogramMaterialPackageCharacteristics.get_StorageKeyName()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_DateImported() {
        if (!this.HasProp("__ISmartCardCryptogramMaterialPackageCharacteristics")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramMaterialPackageCharacteristics.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramMaterialPackageCharacteristics := ISmartCardCryptogramMaterialPackageCharacteristics(outPtr)
        }

        return this.__ISmartCardCryptogramMaterialPackageCharacteristics.get_DateImported()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PackageFormat() {
        if (!this.HasProp("__ISmartCardCryptogramMaterialPackageCharacteristics")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramMaterialPackageCharacteristics.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramMaterialPackageCharacteristics := ISmartCardCryptogramMaterialPackageCharacteristics(outPtr)
        }

        return this.__ISmartCardCryptogramMaterialPackageCharacteristics.get_PackageFormat()
    }

;@endregion Instance Methods
}
