#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfTextInputProcessor interface is implemented by a text service and used by the TSF manager to activate and deactivate the text service.
 * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nn-msctf-itftextinputprocessor
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfTextInputProcessor extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Activate", "Deactivate"]

    /**
     * ITfTextInputProcessor::Activate method
     * @remarks
     * TSF calls this method after creating an instance of a text service with a call to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a>. This enables operations necessary to start the text service.
     * 
     * This method usually adds a reference to the thread manager for the session and advise sinks for events that involve the text service, such as change of focus, keystrokes, and window events. It also customizes the language bar for the text service.
     * 
     * The corresponding <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itftextinputprocessor-deactivate">ITfTextInputProcessor::Deactivate</a> method that shuts down the text service must release all references to the <i>ptim</i> parameter.
     * @param {ITfThreadMgr} ptim Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfthreadmgr">ITfThreadMgr</a> interface for the thread manager that owns the text service.
     * @param {Integer} tid Specifies the client identifier for the text service.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nf-msctf-itftextinputprocessor-activate
     */
    Activate(ptim, tid) {
        result := ComCall(3, this, "ptr", ptim, "uint", tid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * ITfTextInputProcessor::Deactivate method
     * @remarks
     * TSF calls this method immediately before releasing its final reference to a text service. This provides the opportunity to perform operations necessary to shut down the text service.
     * 
     * This method usually unadvises sinks for events that involve the text service. It can also close any user interface elements of the text service.
     * 
     * Before this method returns, it must release all references to the <i>ptim</i> parameter passed to the text service by the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itftextinputprocessor-activate">ITfTextInputProcessor::Activate</a> method.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nf-msctf-itftextinputprocessor-deactivate
     */
    Deactivate() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
