#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * This class contains information that is returned by [GetAllCryptogramStorageKeyCharacteristicsAsync](./smartcardcryptogramgenerator_getallcryptogramstoragekeycharacteristicsasync_495413597.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramgetallcryptogramstoragekeycharacteristicsresult
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the operation status of [GetAllCryptogramStorageKeyCharacteristicsAsync](./smartcardcryptogramgenerator_getallcryptogramstoragekeycharacteristicsasync_495413597.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramgetallcryptogramstoragekeycharacteristicsresult.operationstatus
     * @type {Integer} 
     */
    OperationStatus {
        get => this.get_OperationStatus()
    }

    /**
     * Gets the characteristics.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramgetallcryptogramstoragekeycharacteristicsresult.characteristics
     * @type {IVectorView<SmartCardCryptogramStorageKeyCharacteristics>} 
     */
    Characteristics {
        get => this.get_Characteristics()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of [SmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult](./smartcardcryptogramgetallcryptogramstoragekeycharacteristicsresult.md).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.SmartCards.SmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OperationStatus() {
        if (!this.HasProp("__ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult := ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult(outPtr)
        }

        return this.__ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult.get_OperationStatus()
    }

    /**
     * 
     * @returns {IVectorView<SmartCardCryptogramStorageKeyCharacteristics>} 
     */
    get_Characteristics() {
        if (!this.HasProp("__ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult := ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult(outPtr)
        }

        return this.__ISmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult.get_Characteristics()
    }

;@endregion Instance Methods
}
