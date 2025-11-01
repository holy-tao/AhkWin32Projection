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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetBuffer", "GetInfo", "SetActual"]

    /**
     * 
     * @param {Integer} cbSize 
     * @param {Pointer<Integer>} pbData 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/austream/nf-austream-imemorydata-setbuffer
     */
    SetBuffer(cbSize, pbData, dwFlags) {
        pbDataMarshal := pbData is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "uint", cbSize, pbDataMarshal, pbData, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwLength 
     * @param {Pointer<Pointer<Integer>>} ppbData 
     * @param {Pointer<Integer>} pcbActualData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/austream/nf-austream-imemorydata-getinfo
     */
    GetInfo(pdwLength, ppbData, pcbActualData) {
        pdwLengthMarshal := pdwLength is VarRef ? "uint*" : "ptr"
        pcbActualDataMarshal := pcbActualData is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pdwLengthMarshal, pdwLength, "ptr*", ppbData, pcbActualDataMarshal, pcbActualData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cbDataValid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/austream/nf-austream-imemorydata-setactual
     */
    SetActual(cbDataValid) {
        result := ComCall(5, this, "uint", cbDataValid, "HRESULT")
        return result
    }
}
