#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFileIOStatics.ahk
#Include ..\..\Guid.ahk

/**
 * Provides helper methods for reading and writing files that are represented by objects of type [IStorageFile](istoragefile.md).
 * @remarks
 * This class is static and cannot be instantiated. Call the methods directly instead.
 * 
 * To learn more about what locations your app can access, see [File access permissions](/windows/uwp/files/file-access-permissions).
 * 
 * To learn how to read and write to files, see [Create, write, and read a file](/windows/uwp/files/quickstart-reading-and-writing-files).
 * @see https://learn.microsoft.com/uwp/api/windows.storage.fileio
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class FileIO extends IInspectable {
;@region Static Methods
    /**
     * Reads the contents of the specified file using the specified character encoding and returns text.
     * @param {IStorageFile} file_ The file to read.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileio.readtextasync
     */
    static ReadTextAsync(file_) {
        if (!FileIO.HasProp("__IFileIOStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.FileIO")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileIOStatics.IID)
            FileIO.__IFileIOStatics := IFileIOStatics(factoryPtr)
        }

        return FileIO.__IFileIOStatics.ReadTextAsync(file_)
    }

    /**
     * Reads the contents of the specified file and returns text.
     * @remarks
     * Any object that implements the [IStorageFile](istoragefile.md) interface may be passed to this method or its overload through the *file* parameter.
     * 
     * This method uses the character encoding of the specified file. If you want to specify different encoding, call [ReadTextAsync(IStorageFile, UnicodeEncoding)](fileio_readtextasync_1063800.md) instead.
     * @param {IStorageFile} file_ The file to read.
     * @param {Integer} encoding 
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileio.readtextasync
     */
    static ReadTextWithEncodingAsync(file_, encoding) {
        if (!FileIO.HasProp("__IFileIOStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.FileIO")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileIOStatics.IID)
            FileIO.__IFileIOStatics := IFileIOStatics(factoryPtr)
        }

        return FileIO.__IFileIOStatics.ReadTextWithEncodingAsync(file_, encoding)
    }

    /**
     * Writes text to the specified file using the specified character encoding.
     * @param {IStorageFile} file_ The file that the text is written to.
     * @param {HSTRING} contents The text to write.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileio.writetextasync
     */
    static WriteTextAsync(file_, contents) {
        if (!FileIO.HasProp("__IFileIOStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.FileIO")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileIOStatics.IID)
            FileIO.__IFileIOStatics := IFileIOStatics(factoryPtr)
        }

        return FileIO.__IFileIOStatics.WriteTextAsync(file_, contents)
    }

    /**
     * Writes text to the specified file.
     * @remarks
     * This method attempts to automatically detect the encoding of a file based on the presence of byte order marks. If an encoding cannot be detected, the encoding specified by the caller is used.
     * @param {IStorageFile} file_ The file that the text is written to.
     * @param {HSTRING} contents The text to write.
     * @param {Integer} encoding 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileio.writetextasync
     */
    static WriteTextWithEncodingAsync(file_, contents, encoding) {
        if (!FileIO.HasProp("__IFileIOStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.FileIO")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileIOStatics.IID)
            FileIO.__IFileIOStatics := IFileIOStatics(factoryPtr)
        }

        return FileIO.__IFileIOStatics.WriteTextWithEncodingAsync(file_, contents, encoding)
    }

    /**
     * Appends text to the specified file using the specified character encoding.
     * @param {IStorageFile} file_ The file that the text is appended to.
     * @param {HSTRING} contents The text to append.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileio.appendtextasync
     */
    static AppendTextAsync(file_, contents) {
        if (!FileIO.HasProp("__IFileIOStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.FileIO")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileIOStatics.IID)
            FileIO.__IFileIOStatics := IFileIOStatics(factoryPtr)
        }

        return FileIO.__IFileIOStatics.AppendTextAsync(file_, contents)
    }

    /**
     * Appends text to the specified file.
     * @param {IStorageFile} file_ The file that the text is appended to.
     * @param {HSTRING} contents The text to append.
     * @param {Integer} encoding 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileio.appendtextasync
     */
    static AppendTextWithEncodingAsync(file_, contents, encoding) {
        if (!FileIO.HasProp("__IFileIOStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.FileIO")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileIOStatics.IID)
            FileIO.__IFileIOStatics := IFileIOStatics(factoryPtr)
        }

        return FileIO.__IFileIOStatics.AppendTextWithEncodingAsync(file_, contents, encoding)
    }

    /**
     * Reads the contents of the specified file using the specified character encoding and returns lines of text.
     * @param {IStorageFile} file_ The file to read.
     * @returns {IAsyncOperation<IVector<HSTRING>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileio.readlinesasync
     */
    static ReadLinesAsync(file_) {
        if (!FileIO.HasProp("__IFileIOStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.FileIO")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileIOStatics.IID)
            FileIO.__IFileIOStatics := IFileIOStatics(factoryPtr)
        }

        return FileIO.__IFileIOStatics.ReadLinesAsync(file_)
    }

    /**
     * Reads the contents of the specified file and returns lines of text.
     * @remarks
     * This method uses the character encoding of the specified file. If you want to specify different encoding, call [ReadLinesAsync(IStorageFile, UnicodeEncoding)](fileio_readlinesasync_584387765.md) instead.
     * @param {IStorageFile} file_ The file to read.
     * @param {Integer} encoding 
     * @returns {IAsyncOperation<IVector<HSTRING>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileio.readlinesasync
     */
    static ReadLinesWithEncodingAsync(file_, encoding) {
        if (!FileIO.HasProp("__IFileIOStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.FileIO")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileIOStatics.IID)
            FileIO.__IFileIOStatics := IFileIOStatics(factoryPtr)
        }

        return FileIO.__IFileIOStatics.ReadLinesWithEncodingAsync(file_, encoding)
    }

    /**
     * Writes lines of text to the specified file using the specified character encoding.
     * @param {IStorageFile} file_ The file that the lines are written to.
     * @param {IIterable<HSTRING>} lines The list of text strings to write as lines.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileio.writelinesasync
     */
    static WriteLinesAsync(file_, lines) {
        if (!FileIO.HasProp("__IFileIOStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.FileIO")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileIOStatics.IID)
            FileIO.__IFileIOStatics := IFileIOStatics(factoryPtr)
        }

        return FileIO.__IFileIOStatics.WriteLinesAsync(file_, lines)
    }

    /**
     * Writes lines of text to the specified file.
     * @remarks
     * This method attempts to automatically detect the encoding of a file based on the presence of byte order marks. If an encoding cannot be detected, the encoding specified by the caller is used.
     * @param {IStorageFile} file_ The file that the lines are written to.
     * @param {IIterable<HSTRING>} lines The list of text strings to write as lines.
     * @param {Integer} encoding 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileio.writelinesasync
     */
    static WriteLinesWithEncodingAsync(file_, lines, encoding) {
        if (!FileIO.HasProp("__IFileIOStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.FileIO")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileIOStatics.IID)
            FileIO.__IFileIOStatics := IFileIOStatics(factoryPtr)
        }

        return FileIO.__IFileIOStatics.WriteLinesWithEncodingAsync(file_, lines, encoding)
    }

    /**
     * Appends lines of text to the specified file using the specified character encoding.
     * @param {IStorageFile} file_ The file that the lines are appended to.
     * @param {IIterable<HSTRING>} lines The list of text strings to append as lines.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileio.appendlinesasync
     */
    static AppendLinesAsync(file_, lines) {
        if (!FileIO.HasProp("__IFileIOStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.FileIO")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileIOStatics.IID)
            FileIO.__IFileIOStatics := IFileIOStatics(factoryPtr)
        }

        return FileIO.__IFileIOStatics.AppendLinesAsync(file_, lines)
    }

    /**
     * Appends lines of text to the specified file.
     * @param {IStorageFile} file_ The file that the lines are appended to.
     * @param {IIterable<HSTRING>} lines The list of text strings to append as lines.
     * @param {Integer} encoding 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileio.appendlinesasync
     */
    static AppendLinesWithEncodingAsync(file_, lines, encoding) {
        if (!FileIO.HasProp("__IFileIOStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.FileIO")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileIOStatics.IID)
            FileIO.__IFileIOStatics := IFileIOStatics(factoryPtr)
        }

        return FileIO.__IFileIOStatics.AppendLinesWithEncodingAsync(file_, lines, encoding)
    }

    /**
     * Reads the contents of the specified file and returns a buffer.
     * @param {IStorageFile} file_ The file to read.
     * @returns {IAsyncOperation<IBuffer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileio.readbufferasync
     */
    static ReadBufferAsync(file_) {
        if (!FileIO.HasProp("__IFileIOStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.FileIO")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileIOStatics.IID)
            FileIO.__IFileIOStatics := IFileIOStatics(factoryPtr)
        }

        return FileIO.__IFileIOStatics.ReadBufferAsync(file_)
    }

    /**
     * Writes data from a buffer to the specified file.
     * @param {IStorageFile} file_ The file that the buffer of data is written to.
     * @param {IBuffer} buffer_ The buffer that contains the data to write.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileio.writebufferasync
     */
    static WriteBufferAsync(file_, buffer_) {
        if (!FileIO.HasProp("__IFileIOStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.FileIO")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileIOStatics.IID)
            FileIO.__IFileIOStatics := IFileIOStatics(factoryPtr)
        }

        return FileIO.__IFileIOStatics.WriteBufferAsync(file_, buffer_)
    }

    /**
     * Writes an array of bytes of data to the specified file.
     * @param {IStorageFile} file_ The file that the byte is written to.
     * @param {Integer} buffer_length 
     * @param {Pointer<Integer>} buffer The array of bytes to write.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileio.writebytesasync
     */
    static WriteBytesAsync(file_, buffer_length, buffer) {
        if (!FileIO.HasProp("__IFileIOStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.FileIO")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileIOStatics.IID)
            FileIO.__IFileIOStatics := IFileIOStatics(factoryPtr)
        }

        return FileIO.__IFileIOStatics.WriteBytesAsync(file_, buffer_length, buffer)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
