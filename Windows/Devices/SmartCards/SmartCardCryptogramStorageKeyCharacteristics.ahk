#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmartCardCryptogramStorageKeyCharacteristics.ahk
#Include ..\..\..\Guid.ahk

/**
 * This class contains characteristics of storage keys.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramstoragekeycharacteristics
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardCryptogramStorageKeyCharacteristics extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmartCardCryptogramStorageKeyCharacteristics

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmartCardCryptogramStorageKeyCharacteristics.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the storage key name.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramstoragekeycharacteristics.storagekeyname
     * @type {HSTRING} 
     */
    StorageKeyName {
        get => this.get_StorageKeyName()
    }

    /**
     * Gets the date this storage key was created.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramstoragekeycharacteristics.datecreated
     * @type {DateTime} 
     */
    DateCreated {
        get => this.get_DateCreated()
    }

    /**
     * Gets the algorithm.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramstoragekeycharacteristics.algorithm
     * @type {Integer} 
     */
    Algorithm {
        get => this.get_Algorithm()
    }

    /**
     * Gets the capabilities.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramstoragekeycharacteristics.capabilities
     * @type {Integer} 
     */
    Capabilities {
        get => this.get_Capabilities()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of [SmartCardCryptogramStorageKeyCharacteristics](./smartcardcryptogramstoragekeycharacteristics.md).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.SmartCards.SmartCardCryptogramStorageKeyCharacteristics")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_StorageKeyName() {
        if (!this.HasProp("__ISmartCardCryptogramStorageKeyCharacteristics")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramStorageKeyCharacteristics.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramStorageKeyCharacteristics := ISmartCardCryptogramStorageKeyCharacteristics(outPtr)
        }

        return this.__ISmartCardCryptogramStorageKeyCharacteristics.get_StorageKeyName()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_DateCreated() {
        if (!this.HasProp("__ISmartCardCryptogramStorageKeyCharacteristics")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramStorageKeyCharacteristics.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramStorageKeyCharacteristics := ISmartCardCryptogramStorageKeyCharacteristics(outPtr)
        }

        return this.__ISmartCardCryptogramStorageKeyCharacteristics.get_DateCreated()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Algorithm() {
        if (!this.HasProp("__ISmartCardCryptogramStorageKeyCharacteristics")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramStorageKeyCharacteristics.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramStorageKeyCharacteristics := ISmartCardCryptogramStorageKeyCharacteristics(outPtr)
        }

        return this.__ISmartCardCryptogramStorageKeyCharacteristics.get_Algorithm()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Capabilities() {
        if (!this.HasProp("__ISmartCardCryptogramStorageKeyCharacteristics")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramStorageKeyCharacteristics.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramStorageKeyCharacteristics := ISmartCardCryptogramStorageKeyCharacteristics(outPtr)
        }

        return this.__ISmartCardCryptogramStorageKeyCharacteristics.get_Capabilities()
    }

;@endregion Instance Methods
}
