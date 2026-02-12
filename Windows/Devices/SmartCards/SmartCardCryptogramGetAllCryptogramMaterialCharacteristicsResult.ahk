#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * This class contains information that is returned by [GetAllCryptogramMaterialCharacteristicsAsync](./smartcardcryptogramgenerator_getallcryptogrammaterialcharacteristicsasync_2123004404.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramgetallcryptogrammaterialcharacteristicsresult
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the operation status of  [GetAllCryptogramMaterialCharacteristicsAsync](./smartcardcryptogramgenerator_getallcryptogrammaterialcharacteristicsasync_2123004404.md) operation.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramgetallcryptogrammaterialcharacteristicsresult.operationstatus
     * @type {Integer} 
     */
    OperationStatus {
        get => this.get_OperationStatus()
    }

    /**
     * Gets the characteristics.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramgetallcryptogrammaterialcharacteristicsresult.characteristics
     * @type {IVectorView<SmartCardCryptogramMaterialCharacteristics>} 
     */
    Characteristics {
        get => this.get_Characteristics()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an instance of [SmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult](./smartcardcryptogramgetallcryptogrammaterialcharacteristicsresult.md).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.SmartCards.SmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OperationStatus() {
        if (!this.HasProp("__ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult := ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult(outPtr)
        }

        return this.__ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult.get_OperationStatus()
    }

    /**
     * 
     * @returns {IVectorView<SmartCardCryptogramMaterialCharacteristics>} 
     */
    get_Characteristics() {
        if (!this.HasProp("__ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult := ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult(outPtr)
        }

        return this.__ISmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult.get_Characteristics()
    }

;@endregion Instance Methods
}
