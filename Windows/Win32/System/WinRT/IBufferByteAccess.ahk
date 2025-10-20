#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents a buffer as an array of bytes.
 * @remarks
 * 
  * The client creates an [IBuffer](/uwp/api/Windows.Storage.Streams.IBuffer) object, and the buffer is provided by the [Buffer](nf-robuffer-ibufferbyteaccess-buffer.md) method.
  * 
  * When you implement the **IBuffer** interface, you must implement the **IBufferByteAccess** interface.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//robuffer/ns-robuffer-ibufferbyteaccess
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class IBufferByteAccess extends IUnknown{
    /**
     * The interface identifier for IBufferByteAccess
     * @type {Guid}
     */
    static IID => Guid("{905a0fef-bc53-11df-8c49-001e4fc686da}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Byte>} value 
     * @returns {HRESULT} 
     */
    Buffer(value) {
        result := ComCall(3, this, "char*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
