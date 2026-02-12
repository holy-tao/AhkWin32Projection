#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\IRandomAccessStream.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\StorageStreamTransaction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Streams
 * @version WindowsRuntime 1.4
 */
class IFileRandomAccessStreamStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileRandomAccessStreamStatics
     * @type {Guid}
     */
    static IID => Guid("{73550107-3b57-4b5d-8345-554d2fc621f0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OpenAsync", "OpenWithOptionsAsync", "OpenTransactedWriteAsync", "OpenTransactedWriteWithOptionsAsync", "OpenForUserAsync", "OpenForUserWithOptionsAsync", "OpenTransactedWriteForUserAsync", "OpenTransactedWriteForUserWithOptionsAsync"]

    /**
     * 
     * @param {HSTRING} filePath 
     * @param {Integer} accessMode 
     * @returns {IAsyncOperation<IRandomAccessStream>} 
     */
    OpenAsync(filePath, accessMode) {
        if(filePath is String) {
            pin := HSTRING.Create(filePath)
            filePath := pin.Value
        }
        filePath := filePath is Win32Handle ? NumGet(filePath, "ptr") : filePath

        result := ComCall(6, this, "ptr", filePath, "int", accessMode, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IRandomAccessStream, operation)
    }

    /**
     * 
     * @param {HSTRING} filePath 
     * @param {Integer} accessMode 
     * @param {Integer} sharingOptions 
     * @param {Integer} openDisposition 
     * @returns {IAsyncOperation<IRandomAccessStream>} 
     */
    OpenWithOptionsAsync(filePath, accessMode, sharingOptions, openDisposition) {
        if(filePath is String) {
            pin := HSTRING.Create(filePath)
            filePath := pin.Value
        }
        filePath := filePath is Win32Handle ? NumGet(filePath, "ptr") : filePath

        result := ComCall(7, this, "ptr", filePath, "int", accessMode, "uint", sharingOptions, "int", openDisposition, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IRandomAccessStream, operation)
    }

    /**
     * 
     * @param {HSTRING} filePath 
     * @returns {IAsyncOperation<StorageStreamTransaction>} 
     */
    OpenTransactedWriteAsync(filePath) {
        if(filePath is String) {
            pin := HSTRING.Create(filePath)
            filePath := pin.Value
        }
        filePath := filePath is Win32Handle ? NumGet(filePath, "ptr") : filePath

        result := ComCall(8, this, "ptr", filePath, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageStreamTransaction, operation)
    }

    /**
     * 
     * @param {HSTRING} filePath 
     * @param {Integer} openOptions 
     * @param {Integer} openDisposition 
     * @returns {IAsyncOperation<StorageStreamTransaction>} 
     */
    OpenTransactedWriteWithOptionsAsync(filePath, openOptions, openDisposition) {
        if(filePath is String) {
            pin := HSTRING.Create(filePath)
            filePath := pin.Value
        }
        filePath := filePath is Win32Handle ? NumGet(filePath, "ptr") : filePath

        result := ComCall(9, this, "ptr", filePath, "uint", openOptions, "int", openDisposition, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageStreamTransaction, operation)
    }

    /**
     * 
     * @param {User} user_ 
     * @param {HSTRING} filePath 
     * @param {Integer} accessMode 
     * @returns {IAsyncOperation<IRandomAccessStream>} 
     */
    OpenForUserAsync(user_, filePath, accessMode) {
        if(filePath is String) {
            pin := HSTRING.Create(filePath)
            filePath := pin.Value
        }
        filePath := filePath is Win32Handle ? NumGet(filePath, "ptr") : filePath

        result := ComCall(10, this, "ptr", user_, "ptr", filePath, "int", accessMode, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IRandomAccessStream, operation)
    }

    /**
     * 
     * @param {User} user_ 
     * @param {HSTRING} filePath 
     * @param {Integer} accessMode 
     * @param {Integer} sharingOptions 
     * @param {Integer} openDisposition 
     * @returns {IAsyncOperation<IRandomAccessStream>} 
     */
    OpenForUserWithOptionsAsync(user_, filePath, accessMode, sharingOptions, openDisposition) {
        if(filePath is String) {
            pin := HSTRING.Create(filePath)
            filePath := pin.Value
        }
        filePath := filePath is Win32Handle ? NumGet(filePath, "ptr") : filePath

        result := ComCall(11, this, "ptr", user_, "ptr", filePath, "int", accessMode, "uint", sharingOptions, "int", openDisposition, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IRandomAccessStream, operation)
    }

    /**
     * 
     * @param {User} user_ 
     * @param {HSTRING} filePath 
     * @returns {IAsyncOperation<StorageStreamTransaction>} 
     */
    OpenTransactedWriteForUserAsync(user_, filePath) {
        if(filePath is String) {
            pin := HSTRING.Create(filePath)
            filePath := pin.Value
        }
        filePath := filePath is Win32Handle ? NumGet(filePath, "ptr") : filePath

        result := ComCall(12, this, "ptr", user_, "ptr", filePath, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageStreamTransaction, operation)
    }

    /**
     * 
     * @param {User} user_ 
     * @param {HSTRING} filePath 
     * @param {Integer} openOptions 
     * @param {Integer} openDisposition 
     * @returns {IAsyncOperation<StorageStreamTransaction>} 
     */
    OpenTransactedWriteForUserWithOptionsAsync(user_, filePath, openOptions, openDisposition) {
        if(filePath is String) {
            pin := HSTRING.Create(filePath)
            filePath := pin.Value
        }
        filePath := filePath is Win32Handle ? NumGet(filePath, "ptr") : filePath

        result := ComCall(13, this, "ptr", user_, "ptr", filePath, "uint", openOptions, "int", openDisposition, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageStreamTransaction, operation)
    }
}
