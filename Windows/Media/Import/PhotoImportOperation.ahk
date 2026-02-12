#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhotoImportOperation.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an in-progress photo import operation.
 * @remarks
 * Get an instance of this class by calling [PhotoImportManager.GetPendingOperations](photoimportmanager_getpendingoperations_1715149755.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportoperation
 * @namespace Windows.Media.Import
 * @version WindowsRuntime 1.4
 */
class PhotoImportOperation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhotoImportOperation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhotoImportOperation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the current stage of the in-progress operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportoperation.stage
     * @type {Integer} 
     */
    Stage {
        get => this.get_Stage()
    }

    /**
     * Gets the photo import session associated with the operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportoperation.session
     * @type {PhotoImportSession} 
     */
    Session {
        get => this.get_Session()
    }

    /**
     * Causes in-progress find operations to continue.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportoperation.continuefindingitemsasync
     * @type {IAsyncOperationWithProgress<PhotoImportFindItemsResult, Integer>} 
     */
    ContinueFindingItemsAsync {
        get => this.get_ContinueFindingItemsAsync()
    }

    /**
     * Causes in-progress import items operations to continue.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportoperation.continueimportingitemsasync
     * @type {IAsyncOperationWithProgress<PhotoImportImportItemsResult, PhotoImportProgress>} 
     */
    ContinueImportingItemsAsync {
        get => this.get_ContinueImportingItemsAsync()
    }

    /**
     * Causes in-progress delete from source operations to continue.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportoperation.continuedeletingimporteditemsfromsourceasync
     * @type {IAsyncOperationWithProgress<PhotoImportDeleteImportedItemsFromSourceResult, Float>} 
     */
    ContinueDeletingImportedItemsFromSourceAsync {
        get => this.get_ContinueDeletingImportedItemsFromSourceAsync()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Stage() {
        if (!this.HasProp("__IPhotoImportOperation")) {
            if ((queryResult := this.QueryInterface(IPhotoImportOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportOperation := IPhotoImportOperation(outPtr)
        }

        return this.__IPhotoImportOperation.get_Stage()
    }

    /**
     * 
     * @returns {PhotoImportSession} 
     */
    get_Session() {
        if (!this.HasProp("__IPhotoImportOperation")) {
            if ((queryResult := this.QueryInterface(IPhotoImportOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportOperation := IPhotoImportOperation(outPtr)
        }

        return this.__IPhotoImportOperation.get_Session()
    }

    /**
     * 
     * @returns {IAsyncOperationWithProgress<PhotoImportFindItemsResult, Integer>} 
     */
    get_ContinueFindingItemsAsync() {
        if (!this.HasProp("__IPhotoImportOperation")) {
            if ((queryResult := this.QueryInterface(IPhotoImportOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportOperation := IPhotoImportOperation(outPtr)
        }

        return this.__IPhotoImportOperation.get_ContinueFindingItemsAsync()
    }

    /**
     * 
     * @returns {IAsyncOperationWithProgress<PhotoImportImportItemsResult, PhotoImportProgress>} 
     */
    get_ContinueImportingItemsAsync() {
        if (!this.HasProp("__IPhotoImportOperation")) {
            if ((queryResult := this.QueryInterface(IPhotoImportOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportOperation := IPhotoImportOperation(outPtr)
        }

        return this.__IPhotoImportOperation.get_ContinueImportingItemsAsync()
    }

    /**
     * 
     * @returns {IAsyncOperationWithProgress<PhotoImportDeleteImportedItemsFromSourceResult, Float>} 
     */
    get_ContinueDeletingImportedItemsFromSourceAsync() {
        if (!this.HasProp("__IPhotoImportOperation")) {
            if ((queryResult := this.QueryInterface(IPhotoImportOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportOperation := IPhotoImportOperation(outPtr)
        }

        return this.__IPhotoImportOperation.get_ContinueDeletingImportedItemsFromSourceAsync()
    }

;@endregion Instance Methods
}
