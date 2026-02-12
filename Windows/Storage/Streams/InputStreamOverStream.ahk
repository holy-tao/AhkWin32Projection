#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInputStream.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides a Windows Runtime input stream for an [IStream](/windows/desktop/api/objidl/nn-objidl-istream) base implementation.
 * @remarks
 * The InputStreamOverStream, [OutputStreamOverStream](outputstreamoverstream.md), and [RandomAccessStreamOverStream](randomaccessstreamoverstream.md) classes are interop helpers to convert between the Windows Runtime stream types, which are natively asynchronous, and the Component Object Model (COM) [IStream](/windows/desktop/api/objidl/nn-objidl-istream) types, which are natively synchronous.
 * 
 * 
 * These helper classes make it easier for to reuse legacy code when you transition to the Windows Runtime stream types.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.inputstreamoverstream
 * @namespace Windows.Storage.Streams
 * @version WindowsRuntime 1.4
 */
class InputStreamOverStream extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInputStream

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInputStream.IID

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
     * Returns an asynchronous byte reader object.
     * @param {IBuffer} buffer_ The buffer into which the asynchronous read operation places the bytes that are read.
     * @param {Integer} count The number of bytes to read that is less than or equal to the [Capacity](ibuffer_capacity.md) value.
     * @param {Integer} options Specifies the type of the asynchronous read operation.
     * @returns {IAsyncOperationWithProgress<IBuffer, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.inputstreamoverstream.readasync
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
     * Closes the current stream and releases system resources.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.inputstreamoverstream.close
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
