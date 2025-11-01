#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfThreadFocusSink interface is implemented by an application or TSF text service to receive notifications when the thread receives or loses the UI focus.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfthreadfocussink
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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadfocussink-onsetthreadfocus
     */
    OnSetThreadFocus() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadfocussink-onkillthreadfocus
     */
    OnKillThreadFocus() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
