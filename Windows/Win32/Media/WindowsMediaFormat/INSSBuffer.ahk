#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The INSSBuffer interface is the basic interface of a buffer object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsbuffer/nn-wmsbuffer-inssbuffer
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class INSSBuffer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INSSBuffer
     * @type {Guid}
     */
    static IID => Guid("{e1cd3524-03d7-11d2-9eed-006097d2d7cf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLength", "SetLength", "GetMaxLength", "GetBuffer", "GetBufferAndLength"]

    /**
     * 
     * @param {Pointer<Integer>} pdwLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsbuffer/nf-wmsbuffer-inssbuffer-getlength
     */
    GetLength(pdwLength) {
        pdwLengthMarshal := pdwLength is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwLengthMarshal, pdwLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsbuffer/nf-wmsbuffer-inssbuffer-setlength
     */
    SetLength(dwLength) {
        result := ComCall(4, this, "uint", dwLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsbuffer/nf-wmsbuffer-inssbuffer-getmaxlength
     */
    GetMaxLength(pdwLength) {
        pdwLengthMarshal := pdwLength is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pdwLengthMarshal, pdwLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} ppdwBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsbuffer/nf-wmsbuffer-inssbuffer-getbuffer
     */
    GetBuffer(ppdwBuffer) {
        result := ComCall(6, this, "ptr*", ppdwBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} ppdwBuffer 
     * @param {Pointer<Integer>} pdwLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsbuffer/nf-wmsbuffer-inssbuffer-getbufferandlength
     */
    GetBufferAndLength(ppdwBuffer, pdwLength) {
        pdwLengthMarshal := pdwLength is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr*", ppdwBuffer, pdwLengthMarshal, pdwLength, "HRESULT")
        return result
    }
}
