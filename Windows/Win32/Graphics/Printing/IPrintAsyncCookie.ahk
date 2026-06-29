#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
class IPrintAsyncCookie extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FinishAsyncCall", "CancelAsyncCall"]

    /**
     * 
     * @param {HRESULT} param0 
     * @returns {HRESULT} 
     */
    FinishAsyncCall(param0) {
        result := ComCall(3, this, "int", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} param0 
     * @returns {HRESULT} 
     */
    CancelAsyncCall(param0) {
        result := ComCall(4, this, "int", param0, "HRESULT")
        return result
    }
}
