#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPrintAsyncCookie.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintAsyncNewChannelCookie extends IPrintAsyncCookie{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FinishAsyncCallWithData"]

    /**
     * 
     * @param {Pointer<IPrintAsyncNotifyChannel>} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     */
    FinishAsyncCallWithData(param0, param1) {
        result := ComCall(5, this, "ptr*", param0, "uint", param1, "HRESULT")
        return result
    }
}
