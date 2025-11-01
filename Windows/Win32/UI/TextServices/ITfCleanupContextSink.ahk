#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfCleanupContextSink interface is implemented by a text service to receive notifications when a context cleanup operation occurs. This notification sink is installed by calling ITfSourceSingle::AdviseSingleSink with IID_ITfCleanupContextSink.
 * @remarks
 * 
  * A context cleanup occurs when:
  * 
  * <ul>
  * <li>The text service is deactivated while a context is still on the context stack. This can occur when the active text service is changed or when the active language changes while the text service is active.</li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfthreadmgr-deactivate">ITfThreadMgr::Deactivate
  *             </a> is called while a context is still on the context stack.</li>
  * </ul>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfcleanupcontextsink
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfCleanupContextSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfCleanupContextSink
     * @type {Guid}
     */
    static IID => Guid("{01689689-7acb-4e9b-ab7c-7ea46b12b522}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnCleanupContext"]

    /**
     * 
     * @param {Integer} ecWrite 
     * @param {ITfContext} pic 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcleanupcontextsink-oncleanupcontext
     */
    OnCleanupContext(ecWrite, pic) {
        result := ComCall(3, this, "uint", ecWrite, "ptr", pic, "HRESULT")
        return result
    }
}
