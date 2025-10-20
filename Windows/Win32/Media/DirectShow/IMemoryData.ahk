#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This interface is deprecated.
 * @see https://docs.microsoft.com/windows/win32/api//austream/nn-austream-imemorydata
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMemoryData extends IUnknown{
    /**
     * The interface identifier for IMemoryData
     * @type {Guid}
     */
    static IID => Guid("{327fc560-af60-11d0-8212-00c04fc32c45}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} cbSize 
     * @param {Pointer<Byte>} pbData 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SetBuffer(cbSize, pbData, dwFlags) {
        result := ComCall(3, this, "uint", cbSize, "char*", pbData, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwLength 
     * @param {Pointer<Byte>} ppbData 
     * @param {Pointer<UInt32>} pcbActualData 
     * @returns {HRESULT} 
     */
    GetInfo(pdwLength, ppbData, pcbActualData) {
        result := ComCall(4, this, "uint*", pdwLength, "char*", ppbData, "uint*", pcbActualData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cbDataValid 
     * @returns {HRESULT} 
     */
    SetActual(cbDataValid) {
        result := ComCall(5, this, "uint", cbDataValid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
