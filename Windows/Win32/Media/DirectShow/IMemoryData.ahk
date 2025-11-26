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
     * Note  This interface is deprecated. New applications should not use it. Initializes a memory buffer with a pointer to memory and length.
     * @param {Integer} cbSize Size of memory pointed to by <i>pbData</i>, in bytes.
     * @param {Pointer<Integer>} pbData Pointer to memory that this object will use.
     * @param {Integer} dwFlags Reserved for flag data. Must be zero.
     * @returns {HRESULT} Returns S_OK if successful or E_INVALIDARG if <i>cbSize</i> is zero or <i>pbData</i> is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//austream/nf-austream-imemorydata-setbuffer
     */
    SetBuffer(cbSize, pbData, dwFlags) {
        pbDataMarshal := pbData is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "uint", cbSize, pbDataMarshal, pbData, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. Retrieves information describing an audio data object.
     * @param {Pointer<Integer>} pdwLength Length of memory in bytes, if non-<b>NULL</b>.
     * @param {Pointer<Pointer<Integer>>} ppbData Pointer to the memory, if non-<b>NULL</b>.
     * @param {Pointer<Integer>} pcbActualData Length of data in bytes, if non-<b>NULL</b>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//austream/nf-austream-imemorydata-getinfo
     */
    GetInfo(pdwLength, ppbData, pcbActualData) {
        pdwLengthMarshal := pdwLength is VarRef ? "uint*" : "ptr"
        ppbDataMarshal := ppbData is VarRef ? "ptr*" : "ptr"
        pcbActualDataMarshal := pcbActualData is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pdwLengthMarshal, pdwLength, ppbDataMarshal, ppbData, pcbActualDataMarshal, pcbActualData, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. Sets the amount of audio data currently in the object.
     * @param {Integer} cbDataValid Amount of data, in bytes.
     * @returns {HRESULT} Returns S_OK if successful or E_POINTER if the required parameter is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//austream/nf-austream-imemorydata-setactual
     */
    SetActual(cbDataValid) {
        result := ComCall(5, this, "uint", cbDataValid, "HRESULT")
        return result
    }
}
