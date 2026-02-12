#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SmartCardCryptogramStorageKeyInfo.ahk
#Include .\SmartCardCryptogramMaterialPossessionProof.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class ISmartCardCryptogramGenerator extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmartCardCryptogramGenerator
     * @type {Guid}
     */
    static IID => Guid("{e39f587b-edd3-4e49-b594-0ff5e4d0c76f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SupportedCryptogramMaterialTypes", "get_SupportedCryptogramAlgorithms", "get_SupportedCryptogramMaterialPackageFormats", "get_SupportedCryptogramMaterialPackageConfirmationResponseFormats", "get_SupportedSmartCardCryptogramStorageKeyCapabilities", "DeleteCryptogramMaterialStorageKeyAsync", "CreateCryptogramMaterialStorageKeyAsync", "RequestCryptogramMaterialStorageKeyInfoAsync", "ImportCryptogramMaterialPackageAsync", "TryProvePossessionOfCryptogramMaterialPackageAsync", "RequestUnlockCryptogramMaterialForUseAsync", "DeleteCryptogramMaterialPackageAsync"]

    /**
     * @type {IVectorView<Integer>} 
     */
    SupportedCryptogramMaterialTypes {
        get => this.get_SupportedCryptogramMaterialTypes()
    }

    /**
     * @type {IVectorView<Integer>} 
     */
    SupportedCryptogramAlgorithms {
        get => this.get_SupportedCryptogramAlgorithms()
    }

    /**
     * @type {IVectorView<Integer>} 
     */
    SupportedCryptogramMaterialPackageFormats {
        get => this.get_SupportedCryptogramMaterialPackageFormats()
    }

    /**
     * @type {IVectorView<Integer>} 
     */
    SupportedCryptogramMaterialPackageConfirmationResponseFormats {
        get => this.get_SupportedCryptogramMaterialPackageConfirmationResponseFormats()
    }

    /**
     * @type {IVectorView<Integer>} 
     */
    SupportedSmartCardCryptogramStorageKeyCapabilities {
        get => this.get_SupportedSmartCardCryptogramStorageKeyCapabilities()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedCryptogramMaterialTypes() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedCryptogramAlgorithms() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedCryptogramMaterialPackageFormats() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedCryptogramMaterialPackageConfirmationResponseFormats() {
        result := ComCall(9, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedSmartCardCryptogramStorageKeyCapabilities() {
        result := ComCall(10, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetUInt32(), result_)
    }

    /**
     * 
     * @param {HSTRING} storageKeyName 
     * @returns {IAsyncOperation<Integer>} 
     */
    DeleteCryptogramMaterialStorageKeyAsync(storageKeyName) {
        if(storageKeyName is String) {
            pin := HSTRING.Create(storageKeyName)
            storageKeyName := pin.Value
        }
        storageKeyName := storageKeyName is Win32Handle ? NumGet(storageKeyName, "ptr") : storageKeyName

        result := ComCall(11, this, "ptr", storageKeyName, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }

    /**
     * 
     * @param {Integer} promptingBehavior 
     * @param {HSTRING} storageKeyName 
     * @param {Integer} algorithm 
     * @param {Integer} capabilities 
     * @returns {IAsyncOperation<Integer>} 
     */
    CreateCryptogramMaterialStorageKeyAsync(promptingBehavior, storageKeyName, algorithm, capabilities) {
        if(storageKeyName is String) {
            pin := HSTRING.Create(storageKeyName)
            storageKeyName := pin.Value
        }
        storageKeyName := storageKeyName is Win32Handle ? NumGet(storageKeyName, "ptr") : storageKeyName

        result := ComCall(12, this, "int", promptingBehavior, "ptr", storageKeyName, "int", algorithm, "uint", capabilities, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }

    /**
     * 
     * @param {Integer} promptingBehavior 
     * @param {HSTRING} storageKeyName 
     * @param {Integer} format 
     * @returns {IAsyncOperation<SmartCardCryptogramStorageKeyInfo>} 
     */
    RequestCryptogramMaterialStorageKeyInfoAsync(promptingBehavior, storageKeyName, format) {
        if(storageKeyName is String) {
            pin := HSTRING.Create(storageKeyName)
            storageKeyName := pin.Value
        }
        storageKeyName := storageKeyName is Win32Handle ? NumGet(storageKeyName, "ptr") : storageKeyName

        result := ComCall(13, this, "int", promptingBehavior, "ptr", storageKeyName, "int", format, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(SmartCardCryptogramStorageKeyInfo, result_)
    }

    /**
     * 
     * @param {Integer} format 
     * @param {HSTRING} storageKeyName 
     * @param {HSTRING} materialPackageName 
     * @param {IBuffer} cryptogramMaterialPackage 
     * @returns {IAsyncOperation<Integer>} 
     */
    ImportCryptogramMaterialPackageAsync(format, storageKeyName, materialPackageName, cryptogramMaterialPackage) {
        if(storageKeyName is String) {
            pin := HSTRING.Create(storageKeyName)
            storageKeyName := pin.Value
        }
        storageKeyName := storageKeyName is Win32Handle ? NumGet(storageKeyName, "ptr") : storageKeyName
        if(materialPackageName is String) {
            pin := HSTRING.Create(materialPackageName)
            materialPackageName := pin.Value
        }
        materialPackageName := materialPackageName is Win32Handle ? NumGet(materialPackageName, "ptr") : materialPackageName

        result := ComCall(14, this, "int", format, "ptr", storageKeyName, "ptr", materialPackageName, "ptr", cryptogramMaterialPackage, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }

    /**
     * 
     * @param {Integer} promptingBehavior 
     * @param {Integer} responseFormat 
     * @param {HSTRING} materialPackageName 
     * @param {HSTRING} materialName 
     * @param {IBuffer} challenge 
     * @returns {IAsyncOperation<SmartCardCryptogramMaterialPossessionProof>} 
     */
    TryProvePossessionOfCryptogramMaterialPackageAsync(promptingBehavior, responseFormat, materialPackageName, materialName, challenge) {
        if(materialPackageName is String) {
            pin := HSTRING.Create(materialPackageName)
            materialPackageName := pin.Value
        }
        materialPackageName := materialPackageName is Win32Handle ? NumGet(materialPackageName, "ptr") : materialPackageName
        if(materialName is String) {
            pin := HSTRING.Create(materialName)
            materialName := pin.Value
        }
        materialName := materialName is Win32Handle ? NumGet(materialName, "ptr") : materialName

        result := ComCall(15, this, "int", promptingBehavior, "int", responseFormat, "ptr", materialPackageName, "ptr", materialName, "ptr", challenge, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(SmartCardCryptogramMaterialPossessionProof, result_)
    }

    /**
     * 
     * @param {Integer} promptingBehavior 
     * @returns {IAsyncOperation<Integer>} 
     */
    RequestUnlockCryptogramMaterialForUseAsync(promptingBehavior) {
        result := ComCall(16, this, "int", promptingBehavior, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }

    /**
     * 
     * @param {HSTRING} materialPackageName 
     * @returns {IAsyncOperation<Integer>} 
     */
    DeleteCryptogramMaterialPackageAsync(materialPackageName) {
        if(materialPackageName is String) {
            pin := HSTRING.Create(materialPackageName)
            materialPackageName := pin.Value
        }
        materialPackageName := materialPackageName is Win32Handle ? NumGet(materialPackageName, "ptr") : materialPackageName

        result := ComCall(17, this, "ptr", materialPackageName, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }
}
