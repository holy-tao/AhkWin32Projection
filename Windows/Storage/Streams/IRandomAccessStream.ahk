#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\IInputStream.ahk
#Include .\IOutputStream.ahk
#Include .\IRandomAccessStream.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Supports random access of data in input and output streams.
 * @remarks
 * For more info, see [Quickstart: Reading and writing files](/windows/uwp/files/quickstart-reading-and-writing-files), which shows how to read and write bytes to a file by using a [RandomAccessStream](randomaccessstream.md). To encode an image by using a stream, see [Imaging](/windows/uwp/audio-video-camera/imaging).
 * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.irandomaccessstream
 * @namespace Windows.Storage.Streams
 * @version WindowsRuntime 1.4
 */
class IRandomAccessStream extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRandomAccessStream
     * @type {Guid}
     */
    static IID => Guid("{905a0fe1-bc53-11df-8c49-001e4fc686da}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Size", "put_Size", "GetInputStreamAt", "GetOutputStreamAt", "get_Position", "Seek", "CloneStream", "get_CanRead", "get_CanWrite"]

    /**
     * Gets or sets the size of the random access stream.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.irandomaccessstream.size
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
        set => this.put_Size(value)
    }

    /**
     * Gets the byte offset of the stream.
     * @remarks
     * The initial offset of a [IRandomAccessStream](irandomaccessstream.md) is 0.
     * 
     * This offset is affected by both [IInputStream](iinputstream.md) and [IOutputStream](ioutputstream.md) operations.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.irandomaccessstream.position
     * @type {Integer} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * Gets a value that indicates whether the stream can be read from.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.irandomaccessstream.canread
     * @type {Boolean} 
     */
    CanRead {
        get => this.get_CanRead()
    }

    /**
     * Gets a value that indicates whether the stream can be written to.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.irandomaccessstream.canwrite
     * @type {Boolean} 
     */
    CanWrite {
        get => this.get_CanWrite()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Size(value) {
        result := ComCall(7, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns an input stream at a specified location in a stream.
     * @param {Integer} position The location in the stream at which to begin.
     * @returns {IInputStream} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.irandomaccessstream.getinputstreamat
     */
    GetInputStreamAt(position) {
        result := ComCall(8, this, "uint", position, "ptr*", &stream := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInputStream(stream)
    }

    /**
     * Returns an output stream at a specified location in a stream.
     * @param {Integer} position The location in the output stream at which to begin.
     * @returns {IOutputStream} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.irandomaccessstream.getoutputstreamat
     */
    GetOutputStreamAt(position) {
        result := ComCall(9, this, "uint", position, "ptr*", &stream := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IOutputStream(stream)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Position() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Sets the position of the stream to the specified value.
     * @remarks
     * > [!WARNING]
     * > This method does not check the position to make sure the value is valid for the stream. If the position is invalid for the stream, the [ReadAsync](iinputstream_readasync_1012630619.md) and [WriteAsync](ioutputstream_writeasync_897036872.md) methods will return an error if you call them.
     * @param {Integer} position The new position of the stream.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.irandomaccessstream.seek
     */
    Seek(position) {
        result := ComCall(11, this, "uint", position, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates a new instance of a [IRandomAccessStream](irandomaccessstream.md) over the same resource as the current stream.
     * @returns {IRandomAccessStream} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.irandomaccessstream.clonestream
     */
    CloneStream() {
        result := ComCall(12, this, "ptr*", &stream := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRandomAccessStream(stream)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanRead() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanWrite() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
