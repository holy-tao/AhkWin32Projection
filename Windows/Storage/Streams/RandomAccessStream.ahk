#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRandomAccessStreamStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides random access of data in input and output streams.
 * @remarks
 * For more info, see [Quickstart: Reading and writing files](/windows/uwp/files/quickstart-reading-and-writing-files), which shows how to read and write bytes to a file by using a RandomAccessStream. To encode an image by using a stream, see [Imaging](/windows/uwp/audio-video-camera/imaging).
 * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.randomaccessstream
 * @namespace Windows.Storage.Streams
 * @version WindowsRuntime 1.4
 */
class RandomAccessStream extends IInspectable {
;@region Static Methods
    /**
     * Copies the specified number of bytes from a source stream to a destination stream.
     * @param {IInputStream} source The stream to copy data from.
     * @param {IOutputStream} destination The stream to copy data to.
     * @returns {IAsyncOperationWithProgress<Integer, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.randomaccessstream.copyasync
     */
    static CopyAsync(source, destination) {
        if (!RandomAccessStream.HasProp("__IRandomAccessStreamStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Streams.RandomAccessStream")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRandomAccessStreamStatics.IID)
            RandomAccessStream.__IRandomAccessStreamStatics := IRandomAccessStreamStatics(factoryPtr)
        }

        return RandomAccessStream.__IRandomAccessStreamStatics.CopyAsync(source, destination)
    }

    /**
     * Copies a source stream to a destination stream.
     * @param {IInputStream} source The stream to copy data from.
     * @param {IOutputStream} destination The stream to copy data to.
     * @param {Integer} bytesToCopy 
     * @returns {IAsyncOperationWithProgress<Integer, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.randomaccessstream.copyasync
     */
    static CopySizeAsync(source, destination, bytesToCopy) {
        if (!RandomAccessStream.HasProp("__IRandomAccessStreamStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Streams.RandomAccessStream")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRandomAccessStreamStatics.IID)
            RandomAccessStream.__IRandomAccessStreamStatics := IRandomAccessStreamStatics(factoryPtr)
        }

        return RandomAccessStream.__IRandomAccessStreamStatics.CopySizeAsync(source, destination, bytesToCopy)
    }

    /**
     * Copies a source stream to a destination stream and waits for the copy operation to complete.
     * @remarks
     * The CopyAndCloseAsync method is similar to [CopyAsync](randomaccessstream_copyasync_1577084715.md) but also calls and waits for [FlushAsync](ioutputstream_flushasync_491532439.md) and [Close](/windows/desktop/api/windows.foundation/nf-windows-foundation-iclosable-close) on the output stream before its asynchronous operation completes.
     * @param {IInputStream} source The stream to copy data from.
     * @param {IOutputStream} destination The stream to copy data to.
     * @returns {IAsyncOperationWithProgress<Integer, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.randomaccessstream.copyandcloseasync
     */
    static CopyAndCloseAsync(source, destination) {
        if (!RandomAccessStream.HasProp("__IRandomAccessStreamStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Streams.RandomAccessStream")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRandomAccessStreamStatics.IID)
            RandomAccessStream.__IRandomAccessStreamStatics := IRandomAccessStreamStatics(factoryPtr)
        }

        return RandomAccessStream.__IRandomAccessStreamStatics.CopyAndCloseAsync(source, destination)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
