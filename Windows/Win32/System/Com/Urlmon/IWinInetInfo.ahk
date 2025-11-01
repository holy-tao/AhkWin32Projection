#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IWinInetInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWinInetInfo
     * @type {Guid}
     */
    static IID => Guid("{79eac9d6-bafa-11ce-8c82-00aa004ba90b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryOption"]

    /**
     * 
     * @param {Integer} dwOption 
     * @param {Pointer<Void>} pBuffer 
     * @param {Pointer<Integer>} pcbBuf 
     * @returns {HRESULT} 
     */
    QueryOption(dwOption, pBuffer, pcbBuf) {
        result := ComCall(3, this, "uint", dwOption, "ptr", pBuffer, "uint*", pcbBuf, "HRESULT")
        return result
    }
}
