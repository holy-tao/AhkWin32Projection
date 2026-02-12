#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a referenced array of bytes used by byte stream read and write interfaces. [Buffer](buffer.md) is the class implementation of this interface.
 * @remarks
 * This interface is used for resizing the buffer while preserving the contents. If your C++/WinRT class implements `IBuffer` and does not need or support resizing, you should throw [hresult_not_implemented](/uwp/cpp-ref-for-winrt/error-handling/hresult-not-implemented).
 * 
 * For more info, see [Create, write, and read a file](/windows/uwp/files/quickstart-reading-and-writing-files), which shows how to read and write bytes to a file by using a [Buffer](buffer.md).
 * 
 * [WriteableBitmap.PixelBuffer](/uwp/api/windows.ui.xaml.media.imaging.writeablebitmap.pixelbuffer) is an example of a property that returns an **IBuffer** that can't be written to directly. See that topic for a language-specific code example showing to write to the underlying pixel content in the buffer.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.ibuffer
 * @namespace Windows.Storage.Streams
 * @version WindowsRuntime 1.4
 */
class IBuffer extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBuffer
     * @type {Guid}
     */
    static IID => Guid("{905a0fe0-bc53-11df-8c49-001e4fc686da}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Capacity", "get_Length", "put_Length"]

    /**
     * Gets the maximum number of bytes that the buffer can hold.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.ibuffer.capacity
     * @type {Integer} 
     */
    Capacity {
        get => this.get_Capacity()
    }

    /**
     * Gets the number of bytes currently in use in the buffer.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.ibuffer.length
     * @type {Integer} 
     */
    Length {
        get => this.get_Length()
        set => this.put_Length(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Capacity() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Length() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
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
    put_Length(value) {
        result := ComCall(8, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
