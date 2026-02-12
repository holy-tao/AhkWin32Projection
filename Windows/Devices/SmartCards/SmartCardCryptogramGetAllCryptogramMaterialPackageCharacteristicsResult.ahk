#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * This class contains information that is returned by [GetAllCryptogramMaterialPackageCharacteristicsAsync](./smartcardcryptogramgenerator_getallcryptogrammaterialpackagecharacteristicsasync_812224816.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramgetallcryptogrammaterialpackagecharacteristicsresult
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the operation status of [GetAllCryptogramMaterialPackageCharacteristicsAsync](./smartcardcryptogramgenerator_getallcryptogrammaterialpackagecharacteristicsasync_812224816.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramgetallcryptogrammaterialpackagecharacteristicsresult.operationstatus
     * @type {Integer} 
     */
    OperationStatus {
        get => this.get_OperationStatus()
    }

    /**
     * Gets the characteristics.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramgetallcryptogrammaterialpackagecharacteristicsresult.characteristics
     * @type {IVectorView<SmartCardCryptogramMaterialPackageCharacteristics>} 
     */
    Characteristics {
        get => this.get_Characteristics()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an instance of [SmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult](./smartcardcryptogramgetallcryptogrammaterialpackagecharacteristicsresult.md).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.SmartCards.SmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OperationStatus() {
        if (!this.HasProp("__ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult := ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult(outPtr)
        }

        return this.__ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult.get_OperationStatus()
    }

    /**
     * 
     * @returns {IVectorView<SmartCardCryptogramMaterialPackageCharacteristics>} 
     */
    get_Characteristics() {
        if (!this.HasProp("__ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult := ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult(outPtr)
        }

        return this.__ISmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult.get_Characteristics()
    }

;@endregion Instance Methods
}
