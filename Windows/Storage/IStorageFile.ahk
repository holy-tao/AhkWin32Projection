#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include Streams\IRandomAccessStream.ahk
#Include .\StorageStreamTransaction.ahk
#Include .\StorageFile.ahk
#Include ..\Foundation\IAsyncAction.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a file. Provides information about the file and its contents, and ways to manipulate them.
  * 
  * 
  * 
  * > > [!IMPORTANT]
  * > If you simply want to work with files in your app, see the [StorageFile](storagefile.md) class.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.istoragefile
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class IStorageFile extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageFile
     * @type {Guid}
     */
    static IID => Guid("{fa3f6186-4214-428c-a64c-14c9ac7315ea}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FileType", "get_ContentType", "OpenAsync", "OpenTransactedWriteAsync", "CopyOverloadDefaultNameAndOptions", "CopyOverloadDefaultOptions", "CopyOverload", "CopyAndReplaceAsync", "MoveOverloadDefaultNameAndOptions", "MoveOverloadDefaultOptions", "MoveOverload", "MoveAndReplaceAsync"]

    /**
     * Gets the type (file name extension) of the file.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istoragefile.filetype
     * @type {HSTRING} 
     */
    FileType {
        get => this.get_FileType()
    }

    /**
     * Gets the MIME type of the contents of the file.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istoragefile.contenttype
     * @type {HSTRING} 
     */
    ContentType {
        get => this.get_ContentType()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FileType() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContentType() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Opens a random-access stream over the file.
     * @param {Integer} accessMode The type of access to allow.
     * @returns {IAsyncOperation<IRandomAccessStream>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istoragefile.openasync
     */
    OpenAsync(accessMode) {
        result := ComCall(8, this, "int", accessMode, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IRandomAccessStream, operation)
    }

    /**
     * Opens a transacted, random-access stream for writing to the file.
     * @returns {IAsyncOperation<StorageStreamTransaction>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istoragefile.opentransactedwriteasync
     */
    OpenTransactedWriteAsync() {
        result := ComCall(9, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageStreamTransaction, operation)
    }

    /**
     * Creates a copy of the file in the specified folder, using the desired name.
     * @param {IStorageFolder} destinationFolder The destination folder where the copy is created.
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istoragefile.copyasync
     */
    CopyOverloadDefaultNameAndOptions(destinationFolder) {
        result := ComCall(10, this, "ptr", destinationFolder, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFile, operation)
    }

    /**
     * Creates a copy of the file in the specified folder, using the desired name. This method also specifies what to do if an existing file in the specified folder has the same name.
     * @param {IStorageFolder} destinationFolder The destination folder where the copy is created.
     * @param {HSTRING} desiredNewName The desired name of the copy.
     * 
     * If there is an existing file in the destination folder that already has the specified *desiredNewName*, the specified [NameCollisionOption](namecollisionoption.md) determines how Windows responds to the conflict.
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istoragefile.copyasync
     */
    CopyOverloadDefaultOptions(destinationFolder, desiredNewName) {
        if(desiredNewName is String) {
            pin := HSTRING.Create(desiredNewName)
            desiredNewName := pin.Value
        }
        desiredNewName := desiredNewName is Win32Handle ? NumGet(desiredNewName, "ptr") : desiredNewName

        result := ComCall(11, this, "ptr", destinationFolder, "ptr", desiredNewName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFile, operation)
    }

    /**
     * Creates a copy of the file in the specified folder.
     * @param {IStorageFolder} destinationFolder The destination folder where the copy is created.
     * @param {HSTRING} desiredNewName 
     * @param {Integer} option 
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istoragefile.copyasync
     */
    CopyOverload(destinationFolder, desiredNewName, option) {
        if(desiredNewName is String) {
            pin := HSTRING.Create(desiredNewName)
            desiredNewName := pin.Value
        }
        desiredNewName := desiredNewName is Win32Handle ? NumGet(desiredNewName, "ptr") : desiredNewName

        result := ComCall(12, this, "ptr", destinationFolder, "ptr", desiredNewName, "int", option, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFile, operation)
    }

    /**
     * Replaces the specified file with a copy of the current file.
     * @param {IStorageFile} fileToReplace The file to replace.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istoragefile.copyandreplaceasync
     */
    CopyAndReplaceAsync(fileToReplace) {
        result := ComCall(13, this, "ptr", fileToReplace, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * Moves the current file to the specified folder and renames the file according to the desired name.
     * @param {IStorageFolder} destinationFolder The destination folder where the file is moved.
     * 
     * This destination folder must be a physical location. Otherwise, if the destination folder exists only in memory, like a file group, this method fails and throws an exception.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istoragefile.moveasync
     */
    MoveOverloadDefaultNameAndOptions(destinationFolder) {
        result := ComCall(14, this, "ptr", destinationFolder, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * Moves the current file to the specified folder and renames the file according to the desired name. This method also specifies what to do if a file with the same name already exists in the specified folder.
     * @param {IStorageFolder} destinationFolder The destination folder where the file is moved.
     * 
     * This destination folder must be a physical location. Otherwise, if the destination folder exists only in memory, like a file group, this method fails and throws an exception.
     * @param {HSTRING} desiredNewName The desired name of the file after it is moved.
     * 
     * If there is an existing file in the destination folder that already has the specified *desiredNewName*, the specified [NameCollisionOption](namecollisionoption.md) determines how Windows responds to the conflict.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istoragefile.moveasync
     */
    MoveOverloadDefaultOptions(destinationFolder, desiredNewName) {
        if(desiredNewName is String) {
            pin := HSTRING.Create(desiredNewName)
            desiredNewName := pin.Value
        }
        desiredNewName := desiredNewName is Win32Handle ? NumGet(desiredNewName, "ptr") : desiredNewName

        result := ComCall(15, this, "ptr", destinationFolder, "ptr", desiredNewName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * Moves the current file to the specified folder.
     * @param {IStorageFolder} destinationFolder The destination folder where the file is moved.
     * 
     * This destination folder must be a physical location. Otherwise, if the destination folder exists only in memory, like a file group, this method fails and throws an exception.
     * @param {HSTRING} desiredNewName 
     * @param {Integer} option 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istoragefile.moveasync
     */
    MoveOverload(destinationFolder, desiredNewName, option) {
        if(desiredNewName is String) {
            pin := HSTRING.Create(desiredNewName)
            desiredNewName := pin.Value
        }
        desiredNewName := desiredNewName is Win32Handle ? NumGet(desiredNewName, "ptr") : desiredNewName

        result := ComCall(16, this, "ptr", destinationFolder, "ptr", desiredNewName, "int", option, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * Moves the current file to the location of the specified file and replaces the specified file in that location.
     * @param {IStorageFile} fileToReplace The file to replace.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istoragefile.moveandreplaceasync
     */
    MoveAndReplaceAsync(fileToReplace) {
        result := ComCall(17, this, "ptr", fileToReplace, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
