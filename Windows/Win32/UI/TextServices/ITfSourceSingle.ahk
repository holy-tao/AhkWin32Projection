#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfSourceSingle interface is implemented by the TSF manager.
 * @remarks
 * 
  * The TSF manager has different implementations of <b>ITfSourceSingle</b>, depending upon how the <b>ITfSourceSingle</b> interface is obtained. The difference in the implementations is the types of advise sinks that can be installed with the interface. The different implementations can be obtained from the following objects.
  * 
  * <ul>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfthreadmgr">ITfThreadMgr
  *             </a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcontext">ITfContext
  *             </a>
  * </li>
  * </ul>
  * For more information about advise sinks that can be installed by each implementation, see <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfsourcesingle-advisesinglesink">ITfSourceSingle::AdviseSingleSink</a>.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfsourcesingle
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfSourceSingle extends IUnknown{
    /**
     * The interface identifier for ITfSourceSingle
     * @type {Guid}
     */
    static IID => Guid("{73131f9c-56a9-49dd-b0ee-d046633f7528}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} tid 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} punk 
     * @returns {HRESULT} 
     */
    AdviseSingleSink(tid, riid, punk) {
        result := ComCall(3, this, "uint", tid, "ptr", riid, "ptr", punk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} tid 
     * @param {Pointer<Guid>} riid 
     * @returns {HRESULT} 
     */
    UnadviseSingleSink(tid, riid) {
        result := ComCall(4, this, "uint", tid, "ptr", riid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
