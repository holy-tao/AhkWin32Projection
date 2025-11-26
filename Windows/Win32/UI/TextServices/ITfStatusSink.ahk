#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfStatusSink interface supports changes to the global document status. This advise sink is installed by calling ITfSource::AdviseSink with IID_ITfStatusSink. A text service can optionally implement this interface.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfstatussink
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfStatusSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfStatusSink
     * @type {Guid}
     */
    static IID => Guid("{6b7d8d73-b267-4f69-b32e-1ca321ce4f45}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnStatusChange"]

    /**
     * ITfStatusSink::OnStatusChange method
     * @param {ITfContext} pic Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcontext">ITfContext</a> interface whose status has changed.
     * @param {Integer} dwFlags Indicates that one of the dynamic flags changed.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfstatussink-onstatuschange
     */
    OnStatusChange(pic, dwFlags) {
        result := ComCall(3, this, "ptr", pic, "uint", dwFlags, "HRESULT")
        return result
    }
}
