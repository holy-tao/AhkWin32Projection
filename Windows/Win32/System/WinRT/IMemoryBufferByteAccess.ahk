#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class IMemoryBufferByteAccess extends IUnknown{
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
     * 
     * @param {Pointer<Byte>} value 
     * @param {Pointer<UInt32>} capacity 
     * @returns {HRESULT} 
     */
    GetBuffer(value, capacity) {
        result := ComCall(3, this, "char*", value, "uint*", capacity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
