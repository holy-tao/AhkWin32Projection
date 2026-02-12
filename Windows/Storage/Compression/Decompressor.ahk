#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDecompressor.ahk
#Include ..\Streams\IInputStream.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IDecompressorFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * A decompressor takes a stream compressed by a compressor and decompresses it.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.compression.decompressor
 * @namespace Windows.Storage.Compression
 * @version WindowsRuntime 1.4
 */
class Decompressor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDecompressor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDecompressor.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * This method creates an instance of a decompressor.
     * @param {IInputStream} underlyingStream The stream of compressed information to be read and decompressed by the decompressor.
     * @returns {Decompressor} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.compression.decompressor.#ctor
     */
    static CreateDecompressor(underlyingStream) {
        if (!Decompressor.HasProp("__IDecompressorFactory")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Compression.Decompressor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDecompressorFactory.IID)
            Decompressor.__IDecompressorFactory := IDecompressorFactory(factoryPtr)
        }

        return Decompressor.__IDecompressorFactory.CreateDecompressor(underlyingStream)
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
     * Detaches the underlying stream from the Decompressor object so that the object can be closed using the [Decompressor.Close](decompressor_close_811482585.md) method without also closing the underlying stream.
     * @returns {IInputStream} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.compression.decompressor.detachstream
     */
    DetachStream() {
        if (!this.HasProp("__IDecompressor")) {
            if ((queryResult := this.QueryInterface(IDecompressor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDecompressor := IDecompressor(outPtr)
        }

        return this.__IDecompressor.DetachStream()
    }

    /**
     * Reads from the compression stream asynchronously.
     * @param {IBuffer} buffer_ The buffer that contains the information to be read from the stream.
     * @param {Integer} count The number of bytes to read.
     * @param {Integer} options Read options
     * @returns {IAsyncOperationWithProgress<IBuffer, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.compression.decompressor.readasync
     */
    ReadAsync(buffer_, count, options) {
        if (!this.HasProp("__IInputStream")) {
            if ((queryResult := this.QueryInterface(IInputStream.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInputStream := IInputStream(outPtr)
        }

        return this.__IInputStream.ReadAsync(buffer_, count, options)
    }

    /**
     * Closes a Decompressor object and synchronously discards any information in buffers. This will close the underlying stream as well unless the [Decompressor.Detach](decompressor_detachstream_464403539.md) method has been used to detach the stream from the object. Subsequent calls on a closed object, except , will fail.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.compression.decompressor.close
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
