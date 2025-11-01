#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IWinInetInfo.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IWinInetHttpInfo extends IWinInetInfo{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWinInetHttpInfo
     * @type {Guid}
     */
    static IID => Guid("{79eac9d8-bafa-11ce-8c82-00aa004ba90b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryInfo"]

    /**
     * 
     * @param {Integer} dwOption 
     * @param {Pointer<Void>} pBuffer 
     * @param {Pointer<Integer>} pcbBuf 
     * @param {Pointer<Integer>} pdwFlags 
     * @param {Pointer<Integer>} pdwReserved 
     * @returns {HRESULT} 
     */
    QueryInfo(dwOption, pBuffer, pcbBuf, pdwFlags, pdwReserved) {
        pBufferMarshal := pBuffer is VarRef ? "ptr" : "ptr"
        pcbBufMarshal := pcbBuf is VarRef ? "uint*" : "ptr"
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"
        pdwReservedMarshal := pdwReserved is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", dwOption, pBufferMarshal, pBuffer, pcbBufMarshal, pcbBuf, pdwFlagsMarshal, pdwFlags, pdwReservedMarshal, pdwReserved, "HRESULT")
        return result
    }
}
