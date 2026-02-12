#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPathIOStatics.ahk
#Include ..\..\Guid.ahk

/**
 * Provides helper methods for reading and writing a file using the absolute path or Uniform Resource Identifier (URI) of the file.
 * @remarks
 * To read or write to a file using a path or Uniform Resource Identifier (URI), you must have permission to access the file's location. To learn more about what locations your app has permission to access, see [File access permissions](/windows/uwp/files/file-access-permissions).
 * 
 * You can specify an app Uniform Resource Identifier (URI) to read or write files in app-specific locations like your app data folder ("ms-appdata://"). To learn more about app Uniform Resource Identifier (URI), see [How to reference content](/previous-versions/windows/apps/hh781215(v=win.10)).
 * @see https://learn.microsoft.com/uwp/api/windows.storage.pathio
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class PathIO extends IInspectable {
;@region Static Methods
    /**
     * Reads the contents of the file at the specified path or Uniform Resource Identifier (URI) using the specified character encoding and returns text.
     * @param {HSTRING} absolutePath The path of the file to read.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pathio.readtextasync
     */
    static ReadTextAsync(absolutePath) {
        if (!PathIO.HasProp("__IPathIOStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.PathIO")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPathIOStatics.IID)
            PathIO.__IPathIOStatics := IPathIOStatics(factoryPtr)
        }

        return PathIO.__IPathIOStatics.ReadTextAsync(absolutePath)
    }

    /**
     * Reads the contents of the file at the specified path or Uniform Resource Identifier (URI) and returns text.
     * @param {HSTRING} absolutePath The path of the file to read.
     * @param {Integer} encoding 
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pathio.readtextasync
     */
    static ReadTextWithEncodingAsync(absolutePath, encoding) {
        if (!PathIO.HasProp("__IPathIOStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.PathIO")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPathIOStatics.IID)
            PathIO.__IPathIOStatics := IPathIOStatics(factoryPtr)
        }

        return PathIO.__IPathIOStatics.ReadTextWithEncodingAsync(absolutePath, encoding)
    }

    /**
     * Writes text to the file at the specified path or Uniform Resource Identifier (URI) using the specified character encoding.
     * @param {HSTRING} absolutePath The path of the file that the text is written to.
     * @param {HSTRING} contents The text to write.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pathio.writetextasync
     */
    static WriteTextAsync(absolutePath, contents) {
        if (!PathIO.HasProp("__IPathIOStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.PathIO")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPathIOStatics.IID)
            PathIO.__IPathIOStatics := IPathIOStatics(factoryPtr)
        }

        return PathIO.__IPathIOStatics.WriteTextAsync(absolutePath, contents)
    }

    /**
     * Writes text to the file at the specified path or Uniform Resource Identifier (URI).
     * @remarks
     * This method attempts to automatically detect the encoding of a file based on the presence of byte order marks. If an encoding cannot be detected, the encoding specified by the caller in the method overload is used.
     * @param {HSTRING} absolutePath The path of the file that the text is written to.
     * @param {HSTRING} contents The text to write.
     * @param {Integer} encoding 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pathio.writetextasync
     */
    static WriteTextWithEncodingAsync(absolutePath, contents, encoding) {
        if (!PathIO.HasProp("__IPathIOStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.PathIO")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPathIOStatics.IID)
            PathIO.__IPathIOStatics := IPathIOStatics(factoryPtr)
        }

        return PathIO.__IPathIOStatics.WriteTextWithEncodingAsync(absolutePath, contents, encoding)
    }

    /**
     * Appends text to the file at the specified path or Uniform Resource Identifier (URI) using the specified character encoding.
     * @param {HSTRING} absolutePath The path of the file that the text is appended to.
     * @param {HSTRING} contents The text to append.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pathio.appendtextasync
     */
    static AppendTextAsync(absolutePath, contents) {
        if (!PathIO.HasProp("__IPathIOStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.PathIO")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPathIOStatics.IID)
            PathIO.__IPathIOStatics := IPathIOStatics(factoryPtr)
        }

        return PathIO.__IPathIOStatics.AppendTextAsync(absolutePath, contents)
    }

    /**
     * Appends text to the file at the specified path or Uniform Resource Identifier (URI).
     * @param {HSTRING} absolutePath The path of the file that the text is appended to.
     * @param {HSTRING} contents The text to append.
     * @param {Integer} encoding 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pathio.appendtextasync
     */
    static AppendTextWithEncodingAsync(absolutePath, contents, encoding) {
        if (!PathIO.HasProp("__IPathIOStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.PathIO")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPathIOStatics.IID)
            PathIO.__IPathIOStatics := IPathIOStatics(factoryPtr)
        }

        return PathIO.__IPathIOStatics.AppendTextWithEncodingAsync(absolutePath, contents, encoding)
    }

    /**
     * Reads the contents of the file at the specified path or Uniform Resource Identifier (URI) using the specified character encoding and returns lines of text.
     * @param {HSTRING} absolutePath The path of the file to read.
     * @returns {IAsyncOperation<IVector<HSTRING>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pathio.readlinesasync
     */
    static ReadLinesAsync(absolutePath) {
        if (!PathIO.HasProp("__IPathIOStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.PathIO")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPathIOStatics.IID)
            PathIO.__IPathIOStatics := IPathIOStatics(factoryPtr)
        }

        return PathIO.__IPathIOStatics.ReadLinesAsync(absolutePath)
    }

    /**
     * Reads the contents of the file at the specified path or Uniform Resource Identifier (URI) and returns lines of text.
     * @param {HSTRING} absolutePath The path of the file to read.
     * @param {Integer} encoding 
     * @returns {IAsyncOperation<IVector<HSTRING>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pathio.readlinesasync
     */
    static ReadLinesWithEncodingAsync(absolutePath, encoding) {
        if (!PathIO.HasProp("__IPathIOStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.PathIO")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPathIOStatics.IID)
            PathIO.__IPathIOStatics := IPathIOStatics(factoryPtr)
        }

        return PathIO.__IPathIOStatics.ReadLinesWithEncodingAsync(absolutePath, encoding)
    }

    /**
     * Writes lines of text to the file at the specified path or Uniform Resource Identifier (URI) using the specified character encoding.
     * @param {HSTRING} absolutePath The path of the file that the lines are appended to.
     * @param {IIterable<HSTRING>} lines The list of text strings to append as lines.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pathio.writelinesasync
     */
    static WriteLinesAsync(absolutePath, lines) {
        if (!PathIO.HasProp("__IPathIOStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.PathIO")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPathIOStatics.IID)
            PathIO.__IPathIOStatics := IPathIOStatics(factoryPtr)
        }

        return PathIO.__IPathIOStatics.WriteLinesAsync(absolutePath, lines)
    }

    /**
     * Writes lines of text to the file at the specified path or Uniform Resource Identifier (URI).
     * @remarks
     * This method attempts to automatically detect the encoding of a file based on the presence of byte order marks. If an encoding cannot be detected, the encoding specified by the caller in the method overload is used.
     * @param {HSTRING} absolutePath The path of the file that the lines are written to.
     * @param {IIterable<HSTRING>} lines The list of text strings to append as lines.
     * @param {Integer} encoding 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pathio.writelinesasync
     */
    static WriteLinesWithEncodingAsync(absolutePath, lines, encoding) {
        if (!PathIO.HasProp("__IPathIOStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.PathIO")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPathIOStatics.IID)
            PathIO.__IPathIOStatics := IPathIOStatics(factoryPtr)
        }

        return PathIO.__IPathIOStatics.WriteLinesWithEncodingAsync(absolutePath, lines, encoding)
    }

    /**
     * Appends lines of text to the file at the specified path or Uniform Resource Identifier (URI) using the specified character encoding.
     * @param {HSTRING} absolutePath The path of the file that the lines are appended to.
     * @param {IIterable<HSTRING>} lines The list of text strings to append as lines.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pathio.appendlinesasync
     */
    static AppendLinesAsync(absolutePath, lines) {
        if (!PathIO.HasProp("__IPathIOStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.PathIO")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPathIOStatics.IID)
            PathIO.__IPathIOStatics := IPathIOStatics(factoryPtr)
        }

        return PathIO.__IPathIOStatics.AppendLinesAsync(absolutePath, lines)
    }

    /**
     * Appends lines of text to the file at the specified path or Uniform Resource Identifier (URI).
     * @param {HSTRING} absolutePath The path or Uniform Resource Identifier (URI) of the file that the lines are appended to.
     * @param {IIterable<HSTRING>} lines The list of text strings to append as lines.
     * @param {Integer} encoding 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pathio.appendlinesasync
     */
    static AppendLinesWithEncodingAsync(absolutePath, lines, encoding) {
        if (!PathIO.HasProp("__IPathIOStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.PathIO")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPathIOStatics.IID)
            PathIO.__IPathIOStatics := IPathIOStatics(factoryPtr)
        }

        return PathIO.__IPathIOStatics.AppendLinesWithEncodingAsync(absolutePath, lines, encoding)
    }

    /**
     * Reads the contents of the file at the specified path or Uniform Resource Identifier (URI) and returns a buffer.
     * @param {HSTRING} absolutePath The path of the file to read.
     * @returns {IAsyncOperation<IBuffer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pathio.readbufferasync
     */
    static ReadBufferAsync(absolutePath) {
        if (!PathIO.HasProp("__IPathIOStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.PathIO")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPathIOStatics.IID)
            PathIO.__IPathIOStatics := IPathIOStatics(factoryPtr)
        }

        return PathIO.__IPathIOStatics.ReadBufferAsync(absolutePath)
    }

    /**
     * Writes data from a buffer to the file at the specified path or Uniform Resource Identifier (URI).
     * @param {HSTRING} absolutePath The path of the file that the data is written to.
     * @param {IBuffer} buffer_ The buffer that contains the data to write.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pathio.writebufferasync
     */
    static WriteBufferAsync(absolutePath, buffer_) {
        if (!PathIO.HasProp("__IPathIOStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.PathIO")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPathIOStatics.IID)
            PathIO.__IPathIOStatics := IPathIOStatics(factoryPtr)
        }

        return PathIO.__IPathIOStatics.WriteBufferAsync(absolutePath, buffer_)
    }

    /**
     * Writes an array of bytes of data to the file at the specified path or Uniform Resource Identifier (URI).
     * @param {HSTRING} absolutePath The path of the file that the byte is written to.
     * @param {Integer} buffer_length 
     * @param {Pointer<Integer>} buffer An array of bytes to write.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pathio.writebytesasync
     */
    static WriteBytesAsync(absolutePath, buffer_length, buffer) {
        if (!PathIO.HasProp("__IPathIOStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.PathIO")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPathIOStatics.IID)
            PathIO.__IPathIOStatics := IPathIOStatics(factoryPtr)
        }

        return PathIO.__IPathIOStatics.WriteBytesAsync(absolutePath, buffer_length, buffer)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
