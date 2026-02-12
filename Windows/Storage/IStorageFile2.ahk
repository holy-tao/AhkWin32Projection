#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include Streams\IRandomAccessStream.ahk
#Include .\StorageStreamTransaction.ahk
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
 * @see https://learn.microsoft.com/uwp/api/windows.storage.istoragefile2
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class IStorageFile2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageFile2
     * @type {Guid}
     */
    static IID => Guid("{954e4bcf-0a77-42fb-b777-c2ed58a52e44}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OpenWithOptionsAsync", "OpenTransactedWriteWithOptionsAsync"]

    /**
     * Opens a random-access stream over the file.
     * @remarks
     * If you simply want to open a file in your app, see the [OpenAsync](storagefile_openasync_1542217918.md) method of the [StorageFile](storagefile.md) class.
     * 
     * Using this method, a file can be accessed by both file readers and writers simultaneously. The following is a table describing the situations for various parameter settings of [FileAccessMode](fileaccessmode.md) and [StorageOpenOptions](storageopenoptions.md):
     * 
     * |                        | FileAccessMode | |
     * |------------------------|------|-----------|
     * | **StorageOpenOptions** | Read | ReadWrite |
     * | None                   | A reader which is lower priority than a writer. If a write occurs, this low priority reader will fail. | This is a single writer. The file cannot be opened if OpenAsync(Read, AllowOnlyReaders) has been used, and it will prevent a new OpenAsync(Read, AllowOnlyReaders) from being used. |
     * | AllowOnlyReaders       | A reader which can only exist with other readers. If an open is attempted with a writer, it will fail. | This is a single writer. The file cannot be opened if OpenAsync(Read, AllowOnlyReaders) has been used, and it will prevent a new OpenAsync(Read, AllowOnlyReaders) from being used. |
     * | AllowReadersAndWriters | A reader which can exist with other readers and writers simultaneously. | This writer will invalidate low priority readers when a write occurs and can coexist with other readers and writers. |
     * @param {Integer} accessMode One of the enumeration values that specifies the type of access to allow.
     * @param {Integer} options A bitwise combination of the enumeration values that specify options for opening the stream.
     * @returns {IAsyncOperation<IRandomAccessStream>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istoragefile2.openasync
     */
    OpenWithOptionsAsync(accessMode, options) {
        result := ComCall(6, this, "int", accessMode, "uint", options, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IRandomAccessStream, operation)
    }

    /**
     * Opens a random-access stream to the file that can be used for transacted-write operations with the specified options.
     * @remarks
     * This method results in a stream that writes to a temporary file, then atomically commits the writes to the actual file by renaming the temporary file onto the actual file. Because of how the stream writing works, a transacted writer cannot coexist with another writer, meaning StorageOpenOptions.AllowReadersAndWriters is not valid for this method and will return E_INVALIDARG if used.
     * @param {Integer} options A bitwise combination of the enumeration values that specify options for opening the stream.
     * @returns {IAsyncOperation<StorageStreamTransaction>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istoragefile2.opentransactedwriteasync
     */
    OpenTransactedWriteWithOptionsAsync(options) {
        result := ComCall(7, this, "uint", options, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageStreamTransaction, operation)
    }
}
