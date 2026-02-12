#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfThreadFocusSink interface is implemented by an application or TSF text service to receive notifications when the thread receives or loses the UI focus.
 * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nn-msctf-itfthreadfocussink
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfThreadFocusSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfThreadFocusSink
     * @type {Guid}
     */
    static IID => Guid("{c0f1db0c-3a20-405c-a303-96b6010a885f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnSetThreadFocus", "OnKillThreadFocus"]

    /**
     * ITfThreadFocusSink::OnSetThreadFocus method
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nf-msctf-itfthreadfocussink-onsetthreadfocus
     */
    OnSetThreadFocus() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * ITfThreadFocusSink::OnKillThreadFocus method
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nf-msctf-itfthreadfocussink-onkillthreadfocus
     */
    OnKillThreadFocus() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
