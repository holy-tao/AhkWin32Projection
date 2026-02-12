#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include .\StorageFile.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class IStorageFileStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageFileStatics
     * @type {Guid}
     */
    static IID => Guid("{5984c710-daf2-43c8-8bb4-a4d3eacfd03f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFileFromPathAsync", "GetFileFromApplicationUriAsync", "CreateStreamedFileAsync", "ReplaceWithStreamedFileAsync", "CreateStreamedFileFromUriAsync", "ReplaceWithStreamedFileFromUriAsync"]

    /**
     * 
     * @param {HSTRING} path_ 
     * @returns {IAsyncOperation<StorageFile>} 
     */
    GetFileFromPathAsync(path_) {
        if(path_ is String) {
            pin := HSTRING.Create(path_)
            path_ := pin.Value
        }
        path_ := path_ is Win32Handle ? NumGet(path_, "ptr") : path_

        result := ComCall(6, this, "ptr", path_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFile, operation)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @returns {IAsyncOperation<StorageFile>} 
     */
    GetFileFromApplicationUriAsync(uri_) {
        result := ComCall(7, this, "ptr", uri_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFile, operation)
    }

    /**
     * 
     * @param {HSTRING} displayNameWithExtension 
     * @param {StreamedFileDataRequestedHandler} dataRequested 
     * @param {IRandomAccessStreamReference} thumbnail 
     * @returns {IAsyncOperation<StorageFile>} 
     */
    CreateStreamedFileAsync(displayNameWithExtension, dataRequested, thumbnail) {
        if(displayNameWithExtension is String) {
            pin := HSTRING.Create(displayNameWithExtension)
            displayNameWithExtension := pin.Value
        }
        displayNameWithExtension := displayNameWithExtension is Win32Handle ? NumGet(displayNameWithExtension, "ptr") : displayNameWithExtension

        result := ComCall(8, this, "ptr", displayNameWithExtension, "ptr", dataRequested, "ptr", thumbnail, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFile, operation)
    }

    /**
     * 
     * @param {IStorageFile} fileToReplace 
     * @param {StreamedFileDataRequestedHandler} dataRequested 
     * @param {IRandomAccessStreamReference} thumbnail 
     * @returns {IAsyncOperation<StorageFile>} 
     */
    ReplaceWithStreamedFileAsync(fileToReplace, dataRequested, thumbnail) {
        result := ComCall(9, this, "ptr", fileToReplace, "ptr", dataRequested, "ptr", thumbnail, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFile, operation)
    }

    /**
     * 
     * @param {HSTRING} displayNameWithExtension 
     * @param {Uri} uri_ 
     * @param {IRandomAccessStreamReference} thumbnail 
     * @returns {IAsyncOperation<StorageFile>} 
     */
    CreateStreamedFileFromUriAsync(displayNameWithExtension, uri_, thumbnail) {
        if(displayNameWithExtension is String) {
            pin := HSTRING.Create(displayNameWithExtension)
            displayNameWithExtension := pin.Value
        }
        displayNameWithExtension := displayNameWithExtension is Win32Handle ? NumGet(displayNameWithExtension, "ptr") : displayNameWithExtension

        result := ComCall(10, this, "ptr", displayNameWithExtension, "ptr", uri_, "ptr", thumbnail, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFile, operation)
    }

    /**
     * 
     * @param {IStorageFile} fileToReplace 
     * @param {Uri} uri_ 
     * @param {IRandomAccessStreamReference} thumbnail 
     * @returns {IAsyncOperation<StorageFile>} 
     */
    ReplaceWithStreamedFileFromUriAsync(fileToReplace, uri_, thumbnail) {
        result := ComCall(11, this, "ptr", fileToReplace, "ptr", uri_, "ptr", thumbnail, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFile, operation)
    }
}
