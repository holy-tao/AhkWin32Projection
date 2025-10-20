#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPrintAsyncCookie.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IAsyncGetSendNotificationCookie extends IPrintAsyncCookie{

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * 
     * @param {Pointer<IPrintAsyncNotifyDataObject>} param0 
     * @param {BOOL} param1 
     * @returns {HRESULT} 
     */
    FinishAsyncCallWithData(param0, param1) {
        result := ComCall(5, this, "ptr", param0, "int", param1, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
