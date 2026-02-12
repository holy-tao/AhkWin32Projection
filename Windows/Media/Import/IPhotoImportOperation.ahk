#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PhotoImportSession.ahk
#Include ..\..\Foundation\IAsyncOperationWithProgress.ahk
#Include .\PhotoImportFindItemsResult.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\PhotoImportImportItemsResult.ahk
#Include .\PhotoImportDeleteImportedItemsFromSourceResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Import
 * @version WindowsRuntime 1.4
 */
class IPhotoImportOperation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhotoImportOperation
     * @type {Guid}
     */
    static IID => Guid("{d9f797e4-a09a-4ee4-a4b1-20940277a5be}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Stage", "get_Session", "get_ContinueFindingItemsAsync", "get_ContinueImportingItemsAsync", "get_ContinueDeletingImportedItemsFromSourceAsync"]

    /**
     * @type {Integer} 
     */
    Stage {
        get => this.get_Stage()
    }

    /**
     * @type {PhotoImportSession} 
     */
    Session {
        get => this.get_Session()
    }

    /**
     * @type {IAsyncOperationWithProgress<PhotoImportFindItemsResult, Integer>} 
     */
    ContinueFindingItemsAsync {
        get => this.get_ContinueFindingItemsAsync()
    }

    /**
     * @type {IAsyncOperationWithProgress<PhotoImportImportItemsResult, PhotoImportProgress>} 
     */
    ContinueImportingItemsAsync {
        get => this.get_ContinueImportingItemsAsync()
    }

    /**
     * @type {IAsyncOperationWithProgress<PhotoImportDeleteImportedItemsFromSourceResult, Float>} 
     */
    ContinueDeletingImportedItemsFromSourceAsync {
        get => this.get_ContinueDeletingImportedItemsFromSourceAsync()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Stage() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {PhotoImportSession} 
     */
    get_Session() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PhotoImportSession(value)
    }

    /**
     * 
     * @returns {IAsyncOperationWithProgress<PhotoImportFindItemsResult, Integer>} 
     */
    get_ContinueFindingItemsAsync() {
        result := ComCall(8, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(PhotoImportFindItemsResult, (ptr) => IPropertyValue(ptr).GetUInt32(), operation)
    }

    /**
     * 
     * @returns {IAsyncOperationWithProgress<PhotoImportImportItemsResult, PhotoImportProgress>} 
     */
    get_ContinueImportingItemsAsync() {
        result := ComCall(9, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(PhotoImportImportItemsResult, (ptr) => IPropertyValue(ptr).GetPhotoImportProgress(), operation)
    }

    /**
     * 
     * @returns {IAsyncOperationWithProgress<PhotoImportDeleteImportedItemsFromSourceResult, Float>} 
     */
    get_ContinueDeletingImportedItemsFromSourceAsync() {
        result := ComCall(10, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(PhotoImportDeleteImportedItemsFromSourceResult, (ptr) => IPropertyValue(ptr).GetDouble(), operation)
    }
}
