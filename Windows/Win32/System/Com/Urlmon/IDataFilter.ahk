#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IDataFilter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataFilter
     * @type {Guid}
     */
    static IID => Guid("{69d14c80-c18e-11d0-a9ce-006097942311}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DoEncode", "DoDecode", "SetEncodingLevel"]

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Integer} lInBufferSize 
     * @param {Pointer<Integer>} pbInBuffer 
     * @param {Integer} lOutBufferSize 
     * @param {Pointer<Integer>} pbOutBuffer 
     * @param {Integer} lInBytesAvailable 
     * @param {Pointer<Integer>} plInBytesRead 
     * @param {Pointer<Integer>} plOutBytesWritten 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    DoEncode(dwFlags, lInBufferSize, pbInBuffer, lOutBufferSize, pbOutBuffer, lInBytesAvailable, plInBytesRead, plOutBytesWritten, dwReserved) {
        result := ComCall(3, this, "uint", dwFlags, "int", lInBufferSize, "char*", pbInBuffer, "int", lOutBufferSize, "char*", pbOutBuffer, "int", lInBytesAvailable, "int*", plInBytesRead, "int*", plOutBytesWritten, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Integer} lInBufferSize 
     * @param {Pointer<Integer>} pbInBuffer 
     * @param {Integer} lOutBufferSize 
     * @param {Pointer<Integer>} pbOutBuffer 
     * @param {Integer} lInBytesAvailable 
     * @param {Pointer<Integer>} plInBytesRead 
     * @param {Pointer<Integer>} plOutBytesWritten 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    DoDecode(dwFlags, lInBufferSize, pbInBuffer, lOutBufferSize, pbOutBuffer, lInBytesAvailable, plInBytesRead, plOutBytesWritten, dwReserved) {
        result := ComCall(4, this, "uint", dwFlags, "int", lInBufferSize, "char*", pbInBuffer, "int", lOutBufferSize, "char*", pbOutBuffer, "int", lInBytesAvailable, "int*", plInBytesRead, "int*", plOutBytesWritten, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwEncLevel 
     * @returns {HRESULT} 
     */
    SetEncodingLevel(dwEncLevel) {
        result := ComCall(5, this, "uint", dwEncLevel, "HRESULT")
        return result
    }
}
