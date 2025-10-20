#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IWinInetInfo.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IWinInetHttpInfo extends IWinInetInfo{
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
     * 
     * @param {Integer} dwOption 
     * @param {Pointer<Void>} pBuffer 
     * @param {Pointer<UInt32>} pcbBuf 
     * @param {Pointer<UInt32>} pdwFlags 
     * @param {Pointer<UInt32>} pdwReserved 
     * @returns {HRESULT} 
     */
    QueryInfo(dwOption, pBuffer, pcbBuf, pdwFlags, pdwReserved) {
        result := ComCall(4, this, "uint", dwOption, "ptr", pBuffer, "uint*", pcbBuf, "uint*", pdwFlags, "uint*", pdwReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
