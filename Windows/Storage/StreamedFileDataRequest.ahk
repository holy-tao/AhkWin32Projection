#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include Streams\IOutputStream.ahk
#Include ..\Foundation\IClosable.ahk
#Include .\IStreamedFileDataRequest.ahk
#Include ..\..\Guid.ahk

/**
 * Represents a sequential-access output stream that indicates a request for the data stream of a [StorageFile](storagefile.md) that was created by calling [CreateStreamedFileAsync](storagefile_createstreamedfileasync_1143300277.md) or [ReplaceWithStreamedFileAsync](storagefile_replacewithstreamedfileasync_1583738949.md).
 * @remarks
 * This object is passed to the app's [StreamedFileDataRequestedHandler](streamedfiledatarequestedhandler.md) function when a stream that is represented by a [StorageFile](storagefile.md) is accessed. Define the [StreamedFileDataRequestedHandler](streamedfiledatarequestedhandler.md) function if you use [CreateStreamedFileAsync](storagefile_createstreamedfileasync_1143300277.md) or [ReplaceWithStreamedFileAsync](storagefile_replacewithstreamedfileasync_1583738949.md) to get a [StorageFile](storagefile.md) that represents the stream.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.streamedfiledatarequest
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class StreamedFileDataRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IOutputStream

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IOutputStream.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * Writes data from a buffer to the current stream.
     * @param {IBuffer} buffer_ The buffer that contains the data to write.
     * @returns {IAsyncOperationWithProgress<Integer, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streamedfiledatarequest.writeasync
     */
    WriteAsync(buffer_) {
        if (!this.HasProp("__IOutputStream")) {
            if ((queryResult := this.QueryInterface(IOutputStream.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOutputStream := IOutputStream(outPtr)
        }

        return this.__IOutputStream.WriteAsync(buffer_)
    }

    /**
     * Flushes the data in the current stream.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streamedfiledatarequest.flushasync
     */
    FlushAsync() {
        if (!this.HasProp("__IOutputStream")) {
            if ((queryResult := this.QueryInterface(IOutputStream.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOutputStream := IOutputStream(outPtr)
        }

        return this.__IOutputStream.FlushAsync()
    }

    /**
     * Releases system resources that are exposed by the current stream indicating that the data request is complete.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streamedfiledatarequest.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

    /**
     * Indicates that the data can't be streamed and releases system resources that are exposed by the current stream indicating that the data request is complete.
     * @param {Integer} failureMode The enum value that indicates why the data stream can't be accessed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streamedfiledatarequest.failandclose
     */
    FailAndClose(failureMode) {
        if (!this.HasProp("__IStreamedFileDataRequest")) {
            if ((queryResult := this.QueryInterface(IStreamedFileDataRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamedFileDataRequest := IStreamedFileDataRequest(outPtr)
        }

        return this.__IStreamedFileDataRequest.FailAndClose(failureMode)
    }

;@endregion Instance Methods
}
