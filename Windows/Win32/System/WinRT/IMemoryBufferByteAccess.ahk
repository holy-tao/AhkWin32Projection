#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Gets an IMemoryBuffer as an array of bytes.
 * @remarks
 * When [**MemoryBuffer::Close**](/uwp/api/Windows.Foundation.MemoryBuffer) is called, the code using this buffer should set the *value* pointer to null.
 * @see https://learn.microsoft.com/windows/win32/ktop-src/WinRT/imemorybufferbyteaccess-getbuffer
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class IMemoryBufferByteAccess extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMemoryBufferByteAccess
     * @type {Guid}
     */
    static IID => Guid("{5b0d3235-4dba-4d44-865e-8f1d0e4fd04d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBuffer"]

    /**
     * Gets an IMemoryBuffer as an array of bytes.
     * @remarks
     * When [**MemoryBuffer::Close**](/uwp/api/Windows.Foundation.MemoryBuffer) is called, the code using this buffer should set the *value* pointer to null.
     * @param {Pointer<Pointer<Integer>>} value A pointer to a byte array containing the buffer data.
     * @param {Pointer<Integer>} capacity The number of bytes in the returned array
     * @returns {HRESULT} If this method succeeds, it returns **S\_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/WinRT/imemorybufferbyteaccess-getbuffer
     */
    GetBuffer(value, capacity) {
        valueMarshal := value is VarRef ? "ptr*" : "ptr"
        capacityMarshal := capacity is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, valueMarshal, value, capacityMarshal, capacity, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
