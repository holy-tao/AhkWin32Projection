#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\GameSaveBlobInfoGetResult.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Gaming.XboxLive.Storage
 * @version WindowsRuntime 1.4
 */
class IGameSaveBlobInfoQuery extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGameSaveBlobInfoQuery
     * @type {Guid}
     */
    static IID => Guid("{9fdd74b2-eeee-447b-a9d2-7f96c0f83208}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBlobInfoAsync", "GetBlobInfoWithIndexAndMaxAsync", "GetItemCountAsync"]

    /**
     * 
     * @returns {IAsyncOperation<GameSaveBlobInfoGetResult>} 
     */
    GetBlobInfoAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GameSaveBlobInfoGetResult, operation)
    }

    /**
     * 
     * @param {Integer} startIndex 
     * @param {Integer} maxNumberOfItems 
     * @returns {IAsyncOperation<GameSaveBlobInfoGetResult>} 
     */
    GetBlobInfoWithIndexAndMaxAsync(startIndex, maxNumberOfItems) {
        result := ComCall(7, this, "uint", startIndex, "uint", maxNumberOfItems, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GameSaveBlobInfoGetResult, operation)
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
