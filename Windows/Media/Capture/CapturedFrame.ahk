#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICapturedFrame.ahk
#Include ..\..\Storage\Streams\IContentTypeProvider.ahk
#Include ..\..\Storage\Streams\IRandomAccessStream.ahk
#Include ..\..\Storage\Streams\IOutputStream.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\Storage\Streams\IInputStream.ahk
#Include .\ICapturedFrameWithSoftwareBitmap.ahk
#Include .\ICapturedFrame2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a captured video frame.
 * @remarks
 * There are several different techniques for capturing photos using the [MediaCapture](mediacapture.md) class, including [AdvancedPhotoCapture](advancedphotocapture.md), [LowLagPhotoCapture](lowlagphotocapture.md), [LowLagPhotoSequenceCapture](lowlagphotosequencecapture.md), and [VariablePhotoSequenceCapture](../windows.media.capture.core/variablephotosequencecapture.md). Though the sets of APIs used for each of these techniques vary, ultimately they all return the captured photo to you in the form of a **CapturedFrame** object.
 * 
 * For more information on capturing photos and videos, see [Camera](/windows/apps/develop/camera/camera).
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.capturedframe
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class CapturedFrame extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICapturedFrame

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICapturedFrame.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the width of the captured frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.capturedframe.width
     * @type {Integer} 
     */
    Width {
        get => this.get_Width()
    }

    /**
     * Gets the height of the captured frame
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.capturedframe.height
     * @type {Integer} 
     */
    Height {
        get => this.get_Height()
    }

    /**
     * Gets the content type of the captured frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.capturedframe.contenttype
     * @type {HSTRING} 
     */
    ContentType {
        get => this.get_ContentType()
    }

    /**
     * Gets the size of the captured frame in bytes.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.capturedframe.size
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
        set => this.put_Size(value)
    }

    /**
     * Gets the position of the captured frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.capturedframe.position
     * @type {Integer} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * Gets a value that indicates if the captured frame can be read from.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.capturedframe.canread
     * @type {Boolean} 
     */
    CanRead {
        get => this.get_CanRead()
    }

    /**
     * Gets a value that indicates if the captured frame can be written to.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.capturedframe.canwrite
     * @type {Boolean} 
     */
    CanWrite {
        get => this.get_CanWrite()
    }

    /**
     * Gets a SoftwareBitmap object representing the captured frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.capturedframe.softwarebitmap
     * @type {SoftwareBitmap} 
     */
    SoftwareBitmap {
        get => this.get_SoftwareBitmap()
    }

    /**
     * Gets an object containing capture control metadata for the [CapturedFrame](capturedframe.md). Capture controls adjust capture settings such as ISO and exposure.
     * @remarks
     * This property is useful for apps that want to capture frames in an uncompressed format and then base further processing on the control values with which the frame was captured. When capturing to a compressed format, the control values automatically encoded into the image file.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.capturedframe.controlvalues
     * @type {CapturedFrameControlValues} 
     */
    ControlValues {
        get => this.get_ControlValues()
    }

    /**
     * Gets an object containing bitmap properties for the [CapturedFrame](capturedframe.md). These properties convey image metadata such as EXIF data.
     * @remarks
     * This property is useful for apps that want to capture frames in an uncompressed format. When capturing to a compressed format, the bitmap properties such as EXIF data are automatically encoded into the image file. When capturing to a raw format, you can get the bitmap properties using this API and then, for example, set the [BitmapProperties](../windows.graphics.imaging/bitmapencoder_bitmapproperties.md) property of a [BitmapEncoder](../windows.graphics.imaging/bitmapencoder.md) to include the associated metadata in the encoded file. 
     * 
     * For more information on encoding bitmaps, see [Create, edit, and save bitmap images](/windows/uwp/audio-video-camera/imaging).
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.capturedframe.bitmapproperties
     * @type {BitmapPropertySet} 
     */
    BitmapProperties {
        get => this.get_BitmapProperties()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Width() {
        if (!this.HasProp("__ICapturedFrame")) {
            if ((queryResult := this.QueryInterface(ICapturedFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICapturedFrame := ICapturedFrame(outPtr)
        }

        return this.__ICapturedFrame.get_Width()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Height() {
        if (!this.HasProp("__ICapturedFrame")) {
            if ((queryResult := this.QueryInterface(ICapturedFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICapturedFrame := ICapturedFrame(outPtr)
        }

        return this.__ICapturedFrame.get_Height()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContentType() {
        if (!this.HasProp("__IContentTypeProvider")) {
            if ((queryResult := this.QueryInterface(IContentTypeProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentTypeProvider := IContentTypeProvider(outPtr)
        }

        return this.__IContentTypeProvider.get_ContentType()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IRandomAccessStream")) {
            if ((queryResult := this.QueryInterface(IRandomAccessStream.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRandomAccessStream := IRandomAccessStream(outPtr)
        }

        return this.__IRandomAccessStream.get_Size()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Size(value) {
        if (!this.HasProp("__IRandomAccessStream")) {
            if ((queryResult := this.QueryInterface(IRandomAccessStream.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRandomAccessStream := IRandomAccessStream(outPtr)
        }

        return this.__IRandomAccessStream.put_Size(value)
    }

    /**
     * Gets the input stream at the specified position.
     * @param {Integer} position The position in the input stream.
     * @returns {IInputStream} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.capturedframe.getinputstreamat
     */
    GetInputStreamAt(position) {
        if (!this.HasProp("__IRandomAccessStream")) {
            if ((queryResult := this.QueryInterface(IRandomAccessStream.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRandomAccessStream := IRandomAccessStream(outPtr)
        }

        return this.__IRandomAccessStream.GetInputStreamAt(position)
    }

    /**
     * Gets the output stream at the specified position.
     * @param {Integer} position The position in the output stream.
     * @returns {IOutputStream} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.capturedframe.getoutputstreamat
     */
    GetOutputStreamAt(position) {
        if (!this.HasProp("__IRandomAccessStream")) {
            if ((queryResult := this.QueryInterface(IRandomAccessStream.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRandomAccessStream := IRandomAccessStream(outPtr)
        }

        return this.__IRandomAccessStream.GetOutputStreamAt(position)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Position() {
        if (!this.HasProp("__IRandomAccessStream")) {
            if ((queryResult := this.QueryInterface(IRandomAccessStream.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRandomAccessStream := IRandomAccessStream(outPtr)
        }

        return this.__IRandomAccessStream.get_Position()
    }

    /**
     * Seeks the stream to the specified position.
     * @param {Integer} position The position in the stream to seek too.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.capturedframe.seek
     */
    Seek(position) {
        if (!this.HasProp("__IRandomAccessStream")) {
            if ((queryResult := this.QueryInterface(IRandomAccessStream.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRandomAccessStream := IRandomAccessStream(outPtr)
        }

        return this.__IRandomAccessStream.Seek(position)
    }

    /**
     * Creates a copy of the stream.
     * @returns {IRandomAccessStream} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.capturedframe.clonestream
     */
    CloneStream() {
        if (!this.HasProp("__IRandomAccessStream")) {
            if ((queryResult := this.QueryInterface(IRandomAccessStream.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRandomAccessStream := IRandomAccessStream(outPtr)
        }

        return this.__IRandomAccessStream.CloneStream()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanRead() {
        if (!this.HasProp("__IRandomAccessStream")) {
            if ((queryResult := this.QueryInterface(IRandomAccessStream.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRandomAccessStream := IRandomAccessStream(outPtr)
        }

        return this.__IRandomAccessStream.get_CanRead()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanWrite() {
        if (!this.HasProp("__IRandomAccessStream")) {
            if ((queryResult := this.QueryInterface(IRandomAccessStream.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRandomAccessStream := IRandomAccessStream(outPtr)
        }

        return this.__IRandomAccessStream.get_CanWrite()
    }

    /**
     * Asynchronously writes the specified data to the stream.
     * @param {IBuffer} buffer_ The data to write to the stream.
     * @returns {IAsyncOperationWithProgress<Integer, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.capturedframe.writeasync
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
     * Asynchronously commits and flushes all of the data of the [CapturedFrame](capturedframe.md).
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.capturedframe.flushasync
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
     * Closes the captured framed object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.capturedframe.close
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
     * Returns an asynchronous byte reader object.
     * @param {IBuffer} buffer_ The buffer into which the asynchronous read operation places the bytes that are read.
     * @param {Integer} count The number of bytes to read that is less than or equal to the [Capacity](/previous-versions/hh438363(v=vs.85)) value.
     * @param {Integer} options Specifies the type of the asynchronous read operation.
     * @returns {IAsyncOperationWithProgress<IBuffer, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.capturedframe.readasync
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
     * 
     * @returns {SoftwareBitmap} 
     */
    get_SoftwareBitmap() {
        if (!this.HasProp("__ICapturedFrameWithSoftwareBitmap")) {
            if ((queryResult := this.QueryInterface(ICapturedFrameWithSoftwareBitmap.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICapturedFrameWithSoftwareBitmap := ICapturedFrameWithSoftwareBitmap(outPtr)
        }

        return this.__ICapturedFrameWithSoftwareBitmap.get_SoftwareBitmap()
    }

    /**
     * 
     * @returns {CapturedFrameControlValues} 
     */
    get_ControlValues() {
        if (!this.HasProp("__ICapturedFrame2")) {
            if ((queryResult := this.QueryInterface(ICapturedFrame2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICapturedFrame2 := ICapturedFrame2(outPtr)
        }

        return this.__ICapturedFrame2.get_ControlValues()
    }

    /**
     * 
     * @returns {BitmapPropertySet} 
     */
    get_BitmapProperties() {
        if (!this.HasProp("__ICapturedFrame2")) {
            if ((queryResult := this.QueryInterface(ICapturedFrame2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICapturedFrame2 := ICapturedFrame2(outPtr)
        }

        return this.__ICapturedFrame2.get_BitmapProperties()
    }

;@endregion Instance Methods
}
