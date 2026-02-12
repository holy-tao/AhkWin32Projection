#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\SmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult.ahk
#Include .\SmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class ISmartCardCryptogramGenerator2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmartCardCryptogramGenerator2
     * @type {Guid}
     */
    static IID => Guid("{7116aa34-5d6d-4b4a-96a3-efa47d2a7e25}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ValidateRequestApduAsync", "GetAllCryptogramStorageKeyCharacteristicsAsync", "GetAllCryptogramMaterialPackageCharacteristicsAsync", "GetAllCryptogramMaterialPackageCharacteristicsWithStorageKeyAsync", "GetAllCryptogramMaterialCharacteristicsAsync"]

    /**
     * 
     * @param {Integer} promptingBehavior 
     * @param {IBuffer} apduToValidate 
     * @param {IIterable<SmartCardCryptogramPlacementStep>} cryptogramPlacementSteps 
     * @returns {IAsyncOperation<Integer>} 
     */
    ValidateRequestApduAsync(promptingBehavior, apduToValidate, cryptogramPlacementSteps) {
        result := ComCall(6, this, "int", promptingBehavior, "ptr", apduToValidate, "ptr", cryptogramPlacementSteps, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<SmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult>} 
     */
    GetAllCryptogramStorageKeyCharacteristicsAsync() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(SmartCardCryptogramGetAllCryptogramStorageKeyCharacteristicsResult, result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<SmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult>} 
     */
    GetAllCryptogramMaterialPackageCharacteristicsAsync() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(SmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult, result_)
    }

    /**
     * 
     * @param {HSTRING} storageKeyName 
     * @returns {IAsyncOperation<SmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult>} 
     */
    GetAllCryptogramMaterialPackageCharacteristicsWithStorageKeyAsync(storageKeyName) {
        if(storageKeyName is String) {
            pin := HSTRING.Create(storageKeyName)
            storageKeyName := pin.Value
        }
        storageKeyName := storageKeyName is Win32Handle ? NumGet(storageKeyName, "ptr") : storageKeyName

        result := ComCall(9, this, "ptr", storageKeyName, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(SmartCardCryptogramGetAllCryptogramMaterialPackageCharacteristicsResult, result_)
    }

    /**
     * 
     * @param {Integer} promptingBehavior 
     * @param {HSTRING} materialPackageName 
     * @returns {IAsyncOperation<SmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult>} 
     */
    GetAllCryptogramMaterialCharacteristicsAsync(promptingBehavior, materialPackageName) {
        if(materialPackageName is String) {
            pin := HSTRING.Create(materialPackageName)
            materialPackageName := pin.Value
        }
        materialPackageName := materialPackageName is Win32Handle ? NumGet(materialPackageName, "ptr") : materialPackageName

        result := ComCall(10, this, "int", promptingBehavior, "ptr", materialPackageName, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(SmartCardCryptogramGetAllCryptogramMaterialCharacteristicsResult, result_)
    }
}
