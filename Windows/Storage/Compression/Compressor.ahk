#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICompressor.ahk
#Include ..\Streams\IOutputStream.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\ICompressorFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * A compressor takes information written to a stream and compresses it using a compression algorithm.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.compression.compressor
 * @namespace Windows.Storage.Compression
 * @version WindowsRuntime 1.4
 */
class Compressor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompressor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompressor.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of a compressor.
     * @param {IOutputStream} underlyingStream The stream of compressed information to be written by the compressor.
     * @returns {Compressor} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.compression.compressor.#ctor
     */
    static CreateCompressor(underlyingStream) {
        if (!Compressor.HasProp("__ICompressorFactory")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Compression.Compressor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompressorFactory.IID)
            Compressor.__ICompressorFactory := ICompressorFactory(factoryPtr)
        }

        return Compressor.__ICompressorFactory.CreateCompressor(underlyingStream)
    }

    /**
     * Creates an instance of a compressor.
     * @param {IOutputStream} underlyingStream The stream of compressed information to be written by the compressor.
     * @param {Integer} algorithm The compression algorithm used by the compressor to write *underlyingStream*.
     * @param {Integer} blockSize Size in bytes of the intermediate buffer used by the compression algorithm. A value of 0 specifies that the compression algorithm will use its default block size. Valid non-zero values for this parameter are 32Kb to 64Mb.
     * @returns {Compressor} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.compression.compressor.#ctor
     */
    static CreateCompressorEx(underlyingStream, algorithm, blockSize) {
        if (!Compressor.HasProp("__ICompressorFactory")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Compression.Compressor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompressorFactory.IID)
            Compressor.__ICompressorFactory := ICompressorFactory(factoryPtr)
        }

        return Compressor.__ICompressorFactory.CreateCompressorEx(underlyingStream, algorithm, blockSize)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * Finishes writing the compression stream.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.compression.compressor.finishasync
     */
    FinishAsync() {
        if (!this.HasProp("__ICompressor")) {
            if ((queryResult := this.QueryInterface(ICompressor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompressor := ICompressor(outPtr)
        }

        return this.__ICompressor.FinishAsync()
    }

    /**
     * Detaches the underlying stream from the Compressor object so that the object can be closed using the [Compressor.Close](compressor_close_811482585.md) method without also closing the underlying stream.
     * @returns {IOutputStream} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.compression.compressor.detachstream
     */
    DetachStream() {
        if (!this.HasProp("__ICompressor")) {
            if ((queryResult := this.QueryInterface(ICompressor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompressor := ICompressor(outPtr)
        }

        return this.__ICompressor.DetachStream()
    }

    /**
     * Writes information to the compression stream asynchronously.
     * @param {IBuffer} buffer_ The buffer that contains the information to be written to the stream.
     * @returns {IAsyncOperationWithProgress<Integer, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.compression.compressor.writeasync
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
     * Flushes the compression stream asynchronously.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.compression.compressor.flushasync
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
     * Closes a Compressor object and synchronously discards any information in buffers. This will close the underlying stream as well unless the [Compressor.Detach](compressor_detachstream_464403539.md) method has been used to detach the stream from the object. Subsequent calls on a closed object, except for , will fail.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.compression.compressor.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
