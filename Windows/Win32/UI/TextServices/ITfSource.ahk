#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfSource interface is implemented by the TSF manager. It is used by applications and text services to install and uninstall advise sinks.
 * @remarks
 * 
  * The TSF manager has different implementations of <b>ITfSource</b>, depending upon how the <b>ITfSource</b> interface is obtained. The difference in the implementations is the types of advise sinks that can be installed with the interface. The different implementations can be obtained from the following objects.
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
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcompartment">ITfCompartment
  *             </a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfinputprocessorprofiles">ITfInputProcessorProfiles
  *             </a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nn-ctfutb-itflangbaritem">ITfLangBarItem
  *             </a>
  * </li>
  * </ul>
  * For more information about advise sinks that can be installed by each implementation, see <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfsource-advisesink">ITfSource::AdviseSink</a>.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfsource
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfSource extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfSource
     * @type {Guid}
     */
    static IID => Guid("{4ea48a35-60ae-446f-8fd6-e6a8d82459f7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AdviseSink", "UnadviseSink"]

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {IUnknown} punk 
     * @param {Pointer<Integer>} pdwCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfsource-advisesink
     */
    AdviseSink(riid, punk, pdwCookie) {
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", riid, "ptr", punk, pdwCookieMarshal, pdwCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfsource-unadvisesink
     */
    UnadviseSink(dwCookie) {
        result := ComCall(4, this, "uint", dwCookie, "HRESULT")
        return result
    }
}
