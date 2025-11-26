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
     * ITfSource::AdviseSink method
     * @param {Pointer<Guid>} riid Identifies the type of advise sink to install.
     * @param {IUnknown} punk The advise sink <b>IUnknown</b> pointer.
     * @returns {Integer} Address of a DWORD value that receives an identifying cookie. This value is used to uninstall the advise sink in a subsequent call to <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfsource-unadvisesink">ITfSource::UnadviseSink</a>. Receives (DWORD)-1 if a failure occurs.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfsource-advisesink
     */
    AdviseSink(riid, punk) {
        result := ComCall(3, this, "ptr", riid, "ptr", punk, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * ITfSource::UnadviseSink method
     * @param {Integer} dwCookie A DWORD that identifies the advise sink to uninstall. This value is provided by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfsource-advisesink">ITfSource::AdviseSink</a>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwCookie</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CONNECT_E_NOCONNECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The advise sink cannot be found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfsource-unadvisesink
     */
    UnadviseSink(dwCookie) {
        result := ComCall(4, this, "uint", dwCookie, "HRESULT")
        return result
    }
}
