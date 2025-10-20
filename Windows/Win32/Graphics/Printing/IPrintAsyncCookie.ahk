#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintAsyncCookie extends IUnknown{

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {HRESULT} param0 
     * @returns {HRESULT} 
     */
    FinishAsyncCall(param0) {
        result := ComCall(3, this, "int", param0, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HRESULT} param0 
     * @returns {HRESULT} 
     */
    CancelAsyncCall(param0) {
        result := ComCall(4, this, "int", param0, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
