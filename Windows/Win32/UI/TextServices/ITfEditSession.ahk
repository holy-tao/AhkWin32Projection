#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfEditSession interface is implemented by a text service and used by the TSF manager to read and/or modify the text and properties of a context.
 * @remarks
 * 
  * A text service initiates an edit session by calling <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfcontext-requesteditsession">ITfContext::RequestEditSession</a>, passing a pointer to the <b>ITfEditSession</b> interface. When the edit session is granted, the TSF manager calls <b>DoEditSession</b>.
  * 
  * If the context is destroyed before the application grants a lock, or if the calling text service is deactivated before a lock is granted, the <b>DoEditSession</b> method is not called. For this reason, a text service should put cleanup operations for an edit session in the <b>ITfEditSession</b> interface destructor rather than in the <b>DoEditSession</b> method.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfeditsession
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfEditSession extends IUnknown{
    /**
     * The interface identifier for ITfEditSession
     * @type {Guid}
     */
    static IID => Guid("{aa80e803-2021-11d2-93e0-0060b067b86e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} ec 
     * @returns {HRESULT} 
     */
    DoEditSession(ec) {
        result := ComCall(3, this, "uint", ec, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
