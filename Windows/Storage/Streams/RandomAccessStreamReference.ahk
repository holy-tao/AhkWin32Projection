#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRandomAccessStreamReference.ahk
#Include .\IRandomAccessStreamReferenceStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides random access of data in input and output streams for a file.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.randomaccessstreamreference
 * @namespace Windows.Storage.Streams
 * @version WindowsRuntime 1.4
 */
class RandomAccessStreamReference extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRandomAccessStreamReference

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRandomAccessStreamReference.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a random access stream around a file.
     * @param {IStorageFile} file_ The file to create a stream around.
     * @returns {RandomAccessStreamReference} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.randomaccessstreamreference.createfromfile
     */
    static CreateFromFile(file_) {
        if (!RandomAccessStreamReference.HasProp("__IRandomAccessStreamReferenceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Streams.RandomAccessStreamReference")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRandomAccessStreamReferenceStatics.IID)
            RandomAccessStreamReference.__IRandomAccessStreamReferenceStatics := IRandomAccessStreamReferenceStatics(factoryPtr)
        }

        return RandomAccessStreamReference.__IRandomAccessStreamReferenceStatics.CreateFromFile(file_)
    }

    /**
     * Creates a random access stream around the specified URI.
     * @param {Uri} uri_ The Uniform Resource Identifier (URI) to create the stream around. The valid Uniform Resource Identifier (URI) schemes are  http, https, ms-appx, and ms-appdata.
     * @returns {RandomAccessStreamReference} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.randomaccessstreamreference.createfromuri
     */
    static CreateFromUri(uri_) {
        if (!RandomAccessStreamReference.HasProp("__IRandomAccessStreamReferenceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Streams.RandomAccessStreamReference")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRandomAccessStreamReferenceStatics.IID)
            RandomAccessStreamReference.__IRandomAccessStreamReferenceStatics := IRandomAccessStreamReferenceStatics(factoryPtr)
        }

        return RandomAccessStreamReference.__IRandomAccessStreamReferenceStatics.CreateFromUri(uri_)
    }

    /**
     * Creates a random access stream around the specified stream.
     * @param {IRandomAccessStream} stream The source stream.
     * @returns {RandomAccessStreamReference} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.randomaccessstreamreference.createfromstream
     */
    static CreateFromStream(stream) {
        if (!RandomAccessStreamReference.HasProp("__IRandomAccessStreamReferenceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Streams.RandomAccessStreamReference")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRandomAccessStreamReferenceStatics.IID)
            RandomAccessStreamReference.__IRandomAccessStreamReferenceStatics := IRandomAccessStreamReferenceStatics(factoryPtr)
        }

        return RandomAccessStreamReference.__IRandomAccessStreamReferenceStatics.CreateFromStream(stream)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Opens a stream for random access.
     * @returns {IAsyncOperation<IRandomAccessStreamWithContentType>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.randomaccessstreamreference.openreadasync
     */
    OpenReadAsync() {
        if (!this.HasProp("__IRandomAccessStreamReference")) {
            if ((queryResult := this.QueryInterface(IRandomAccessStreamReference.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRandomAccessStreamReference := IRandomAccessStreamReference(outPtr)
        }

        return this.__IRandomAccessStreamReference.OpenReadAsync()
    }

;@endregion Instance Methods
}
