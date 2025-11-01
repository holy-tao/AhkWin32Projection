#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
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
     * 
     * @param {Pointer<Pointer<Integer>>} value 
     * @param {Pointer<Integer>} capacity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/memorybuffer/nf-memorybuffer-imemorybufferbyteaccess-getbuffer
     */
    GetBuffer(value, capacity) {
        capacityMarshal := capacity is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr*", value, capacityMarshal, capacity, "HRESULT")
        return result
    }
}
