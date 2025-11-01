#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfTextInputProcessor.ahk

/**
 * The ITfTextInputProcessorEx interface is implemented by a text service and used by the TSF manager to activate and deactivate the text service.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itftextinputprocessorex
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfTextInputProcessorEx extends ITfTextInputProcessor{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfTextInputProcessorEx
     * @type {Guid}
     */
    static IID => Guid("{6e4e2102-f9cd-433d-b496-303ce03a6507}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ActivateEx"]

    /**
     * 
     * @param {ITfThreadMgr} ptim 
     * @param {Integer} tid 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itftextinputprocessorex-activateex
     */
    ActivateEx(ptim, tid, dwFlags) {
        result := ComCall(5, this, "ptr", ptim, "uint", tid, "uint", dwFlags, "HRESULT")
        return result
    }
}
