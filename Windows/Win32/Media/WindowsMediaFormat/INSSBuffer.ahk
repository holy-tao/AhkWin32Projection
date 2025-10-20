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
     * 
     * @param {Pointer<UInt32>} pdwLength 
     * @returns {HRESULT} 
     */
    GetLength(pdwLength) {
        result := ComCall(3, this, "uint*", pdwLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwLength 
     * @returns {HRESULT} 
     */
    SetLength(dwLength) {
        result := ComCall(4, this, "uint", dwLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwLength 
     * @returns {HRESULT} 
     */
    GetMaxLength(pdwLength) {
        result := ComCall(5, this, "uint*", pdwLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} ppdwBuffer 
     * @returns {HRESULT} 
     */
    GetBuffer(ppdwBuffer) {
        result := ComCall(6, this, "char*", ppdwBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} ppdwBuffer 
     * @param {Pointer<UInt32>} pdwLength 
     * @returns {HRESULT} 
     */
    GetBufferAndLength(ppdwBuffer, pdwLength) {
        result := ComCall(7, this, "char*", ppdwBuffer, "uint*", pdwLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
