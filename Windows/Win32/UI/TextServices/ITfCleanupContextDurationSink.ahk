#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfCleanupContextDurationSink interface is implemented by a text service to receive notifications when a context cleanup operation is performed.
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
  * A text service can use the notifications of this interface to prevent itself from performing any context initialization during the context cleanup operation.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfcleanupcontextdurationsink
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfCleanupContextDurationSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfCleanupContextDurationSink
     * @type {Guid}
     */
    static IID => Guid("{45c35144-154e-4797-bed8-d33ae7bf8794}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnStartCleanupContext", "OnEndCleanupContext"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcleanupcontextdurationsink-onstartcleanupcontext
     */
    OnStartCleanupContext() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcleanupcontextdurationsink-onendcleanupcontext
     */
    OnEndCleanupContext() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
