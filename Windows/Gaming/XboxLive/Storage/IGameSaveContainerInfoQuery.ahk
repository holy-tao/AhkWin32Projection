#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\GameSaveContainerInfoGetResult.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Gaming.XboxLive.Storage
 * @version WindowsRuntime 1.4
 */
class IGameSaveContainerInfoQuery extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGameSaveContainerInfoQuery
     * @type {Guid}
     */
    static IID => Guid("{3c94e863-6f80-4327-9327-ffc11afd42b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetContainerInfoAsync", "GetContainerInfoWithIndexAndMaxAsync", "GetItemCountAsync"]

    /**
     * 
     * @returns {IAsyncOperation<GameSaveContainerInfoGetResult>} 
     */
    GetContainerInfoAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GameSaveContainerInfoGetResult, operation)
    }

    /**
     * 
     * @param {Integer} startIndex 
     * @param {Integer} maxNumberOfItems 
     * @returns {IAsyncOperation<GameSaveContainerInfoGetResult>} 
     */
    GetContainerInfoWithIndexAndMaxAsync(startIndex, maxNumberOfItems) {
        result := ComCall(7, this, "uint", startIndex, "uint", maxNumberOfItems, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GameSaveContainerInfoGetResult, operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<Integer>} 
     */
    GetItemCountAsync() {
        result := ComCall(8, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetUInt32(), operation)
    }
}
