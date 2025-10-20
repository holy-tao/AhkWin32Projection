#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfTextInputProcessor interface is implemented by a text service and used by the TSF manager to activate and deactivate the text service.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itftextinputprocessor
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfTextInputProcessor extends IUnknown{
    /**
     * The interface identifier for ITfTextInputProcessor
     * @type {Guid}
     */
    static IID => Guid("{aa80e7f7-2021-11d2-93e0-0060b067b86e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ITfThreadMgr>} ptim 
     * @param {Integer} tid 
     * @returns {HRESULT} 
     */
    Activate(ptim, tid) {
        result := ComCall(3, this, "ptr", ptim, "uint", tid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Deactivate() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
